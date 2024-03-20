CREATE VIEW [cmdb].[vObjectsHierarchy]
AS
	 WITH vTemp
		  AS (SELECT oh.ID
				   , oh.ParentID
				   , oh.ChildID
				   , CAST(oh.ChildID AS VARBINARY(900)) AS Sortkey
			  FROM cmdb.ObjectsHierarchy AS oh
			  WHERE oh.ParentID IS NULL
			  UNION ALL
			  SELECT oh.ID
				   , oh.ParentID
				   , oh.ChildID
				   , CAST(vt.Sortkey + CAST(oh.ChildID AS BINARY(4)) AS VARBINARY(900))
			  FROM cmdb.ObjectsHierarchy AS oh INNER JOIN vTemp AS vt ON oh.ParentID = vt.ChildID)
		  SELECT vt.ID
			   , vt.ParentID
			   , vt.ChildID
			   , vt.Sortkey
		  FROM vTemp AS vt;
GO

CREATE VIEW [cmdb].[vObjectsHierarchyInherit]
AS
	 SELECT DISTINCT 
			voh1.ChildID AS ID
		  , voh2.ChildID
	 FROM cmdb.vObjectsHierarchy AS voh1 INNER JOIN cmdb.vObjectsHierarchy AS voh2 ON CHARINDEX(voh1.Sortkey, voh2.Sortkey) > 0 --AND voh1.Sortkey <> voh2.Sortkey
										 INNER JOIN cmdb.Objects AS o1 ON voh1.ChildID = o1.ID
										 INNER JOIN cmdb.Objects AS o2 ON voh2.ChildID = o2.ID;
GO

CREATE VIEW [cmdb].[vObjectsHierarchyTree]
AS
	 SELECT -- root
		 o.rowguid AS ID
	   , NULL AS ObjectsHierarchyViewModelID
	   , o.ID AS Level
	   , o.Name
	   , 'images\object\' + LOWER(too.Icon) + '_16.png' AS Icon
	   , 'images\object\' + LOWER(too.Icon) + '_80.png' AS IconBig
	   , 0 AS Groups
	   , o.ID AS ObjectID
	   , CAST(1 AS BIT) AS IsExpanded
	   , too.Name AS Type
	FROM cmdb.ObjectsHierarchy AS oh INNER JOIN cmdb.Objects AS o ON oh.ChildID = o.ID
																		  AND oh.ParentID IS NULL
										  INNER JOIN cmdb.TypeOfObjects AS too ON o.TypeOfObjectID = too.ID
	 UNION ALL
	 SELECT -- objects tree
		 co.rowguid AS ID
	   , po.rowguid AS ParentID
	   , po.ID AS Level
	   , co.Name
	   , 'images\object\' + LOWER(tooco.Icon) + '_16.png' AS Icon
	   , 'images\object\' + LOWER(tooco.Icon) + '_80.png' AS IconBig
	   , 1
	   , co.ID AS ObjectID
	   , CAST(0 AS BIT)
	   , tooco.Name
	 FROM cmdb.ObjectsHierarchy AS oh INNER JOIN cmdb.Objects AS po ON oh.ParentID = po.ID
									  INNER JOIN cmdb.TypeOfObjects AS toopo ON po.TypeOfObjectID = toopo.ID
																				AND toopo.ShowInTree = 1
									  INNER JOIN cmdb.Objects AS co ON oh.ChildID = co.ID
									  INNER JOIN cmdb.TypeOfObjects AS tooco ON co.TypeOfObjectID = tooco.ID
																				AND tooco.ShowInTree = 1
	 UNION ALL
	 SELECT -- hardware root
		 '00000000-0000-0000-0000-000000000001' AS ID
	   , NULL AS ParentID
	   , 0 AS Level
	   , 'Hardware store' AS Name
	   , 'images\object\hardware_store_16.png' AS Icon
	   , 'images\object\hardware_store_80.png' AS IconBig
	   , 2 AS Groups
	   , -1
	   , CAST(0 AS BIT)
	   , 'Hardware store'
	 UNION ALL
	 SELECT -- object types for hardware root
		 too.rowguid
	   , '00000000-0000-0000-0000-000000000001'
	   , 0 AS Level
	   , too.Name
	   , 'images\object\' + LOWER(too.Icon) + '_16.png'
	   , 'images\object\' + LOWER(too.Icon) + '_80.png'
	   , 3
	   , - too.ID
	   , CAST(0 AS BIT)
	   , too.Name
	 FROM cmdb.TypeOfObjects AS too
	 WHERE too.IsHardware = 1
	 UNION ALL
	 SELECT -- Retired assets root
		 '99999999-9999-9999-9999-999999999992' AS ID
	   , NULL AS ParentID
	   , 0 AS Level
	   , 'Retired assets' AS Name
	   , 'images\object\retired_assets_16.png' AS Icon
	   , 'images\object\retired_assets_80.png' AS Icon
	   , 5 AS Groups
	   , -1
	   , CAST(0 AS BIT)
	   , 'Retired assets'
	 UNION ALL
	 SELECT -- Recycle bin root
		 '99999999-9999-9999-9999-999999999993' AS ID
	   , NULL AS ParentID
	   , 0 AS Level
	   , 'Recycle bin' AS Name
	   , 'images\object\recycle_bin_16.png' AS Icon
	   , 'images\object\recycle_bin_80.png' AS IconBig
	   , 5 AS Groups
	   , -1
	   , CAST(0 AS BIT)
	   , 'Recycle bin';
GO

CREATE VIEW [cmdb].[vObjectsDetailList]
AS
	 SELECT o.ID
		  , o.Name
		  , o.TypeOfObjectID
		  , too.Name AS Type
		  , 'images\object\' + LOWER(too.Icon) + '_80.png' AS Icon
		  , too.IsHardware
		  , o.STATUS
	 FROM cmdb.Objects AS o INNER JOIN cmdb.TypeOfObjects AS too ON o.TypeOfObjectID = too.ID;
GO

CREATE VIEW [cmdb].[vObjectPropertiesList]
AS
	 SELECT op.ID
		  , op.ObjectID
		  , op.ParameterTypeID
		  , op.Value
		  , op.STATUS
		  , pt.TypeOfObjectID
		  , pt.ObjectGroupID
		  , pt.Label
		  , pt.ValueType
		  , pt.Control
		  , pt.Inherit
		  , NULL AS Object
		  , 'none' AS Source
		  , STRING_AGG(cop.Name, ',') AS Category
	 FROM cmdb.ObjectProperties AS op INNER JOIN cmdb.ParametersType AS pt ON op.ParameterTypeID = pt.ID
																			  AND pt.Deleted = 0
									  LEFT OUTER JOIN cmdb.ParameterCategories AS pc ON pt.ID = pc.ParameterTypeID
									  LEFT OUTER JOIN cmdb.CategoryOfParameters AS cop ON pc.CategoryOfParametersID = cop.ID
	 GROUP BY op.ID
			, op.ObjectID
			, op.ParameterTypeID
			, op.Value
			, op.STATUS
			, pt.TypeOfObjectID
			, pt.ObjectGroupID
			, pt.Label
			, pt.ValueType
			, pt.Control
			, pt.Inherit
	 UNION ALL
	 SELECT op.ID
		  , vohi.ChildID
		  , op.ParameterTypeID
		  , op.Value
		  , op.STATUS
		  , pt.TypeOfObjectID
		  , pt.ObjectGroupID
		  , pt.Label
		  , pt.ValueType
		  , pt.Control
		  , pt.Inherit
		  , o.Name AS Object
		  , 'inherit' AS Source
		  , STRING_AGG(cop.Name, ',') AS Category
	 FROM cmdb.vObjectsHierarchyInherit AS vohi INNER JOIN cmdb.Objects AS o ON vohi.ID = o.ID
												INNER JOIN cmdb.ObjectProperties AS op ON o.ID = op.ObjectID
												INNER JOIN cmdb.ParametersType AS pt ON op.ParameterTypeID = pt.ID
																						AND pt.Deleted = 0
																						AND pt.Inherit = 1
												LEFT OUTER JOIN cmdb.ParameterCategories AS pc ON pt.ID = pc.ParameterTypeID
												LEFT OUTER JOIN cmdb.CategoryOfParameters AS cop ON pc.CategoryOfParametersID = cop.ID
	 GROUP BY op.ID
			, vohi.ChildID
			, op.ParameterTypeID
			, op.Value
			, op.STATUS
			, pt.TypeOfObjectID
			, pt.ObjectGroupID
			, pt.Label
			, pt.ValueType
			, pt.Control
			, pt.Inherit
			, o.Name;
GO

CREATE VIEW [cmdb].[vObjectsHierarchyDetail]
AS
	 SELECT 
		 co.rowguid AS ID
	   , po.rowguid AS ParentID
	   , co.Code
	   , co.Name
	   , co.TagNumber
	   , tooco.Name AS Type
	   , os.Name AS ObjectState
	   , 'images\object\' + LOWER(tooco.Icon) + '_16.png' AS Icon
	   , co.ID AS ObjectID
	 FROM cmdb.ObjectsHierarchy AS oh INNER JOIN cmdb.Objects AS po ON oh.ParentID = po.ID
									  INNER JOIN cmdb.TypeOfObjects AS toopo ON po.TypeOfObjectID = toopo.ID
									  INNER JOIN cmdb.Objects AS co ON oh.ChildID = co.ID
									  INNER JOIN cmdb.TypeOfObjects AS tooco ON co.TypeOfObjectID = tooco.ID
									  LEFT OUTER JOIN cmdb.ObjectStates AS os ON co.ObjectStateID = os.ID
	 UNION ALL
	 SELECT -- object types for hardware root
		 too.rowguid
	   , '00000000-0000-0000-0000-000000000001'
	   , NULL
	   , too.Name
	   , NULL
	   , NULL
	   , NULL
	   , 'images\object\' + LOWER(too.Icon) + '_16.png'
	   , too.ID
	 FROM cmdb.TypeOfObjects AS too
	 WHERE too.IsHardware = 1
	 UNION ALL
	 SELECT -- object types for hardware root
		 o.rowguid
	   , too.rowguid
	   , o.Code
	   , o.Name
	   , o.TagNumber
	   , too.Name
	   , os.Name
	   , 'images\object\' + LOWER(too.Icon) + '_16.png'
	   , o.ID
	 FROM cmdb.Objects AS o INNER JOIN cmdb.TypeOfObjects AS too ON o.TypeOfObjectID = too.ID
	 LEFT OUTER JOIN cmdb.ObjectStates AS os ON o.ObjectStateID = os.ID
	 WHERE too.IsHardware = 1
GO

CREATE VIEW [identity].vUserRoles
AS
	SELECT u.LoginName
		 , u.FirstName
		 , u.LastName
		 , u.Description
		 , u.Phone
		 , u.Email
		 , u.Blocked 
		 , u.IsEditing
		 , u.Status
		 , u.rowguid
		 , ur.UserID
		 , ur.RoleID
		 , r.Name AS RoleName
		 , r.Description AS RoleDescription
		 , r.IsEditing AS RoleIsEditing
		 , r.Blocked AS RoleBlocked
	FROM [identity].Users AS u INNER JOIN [identity].UserRoles AS ur ON u.ID = ur.UserID
							   INNER JOIN [identity].Roles AS r ON ur.RoleID = r.ID
																   AND r.Status = 'A';

CREATE VIEW [identity].vUserGroups
AS
	SELECT u.LoginName
		 , u.FirstName
		 , u.LastName
		 , u.Description
		 , u.Phone
		 , u.Email
		 , u.Blocked 
		 , u.IsEditing
		 , u.Status
		 , u.rowguid
		 , ug.UserID
		 , ug.GroupID
		 , g.Name AS RoleName
		 , g.Description AS RoleDescription
		 , g.IsEditing AS RoleIsEditing
		 , g.Blocked AS RoleBlocked
	FROM [identity].Users AS u INNER JOIN [identity].UserGroups AS ug ON u.ID = ug.UserID
							   INNER JOIN [identity].Groups AS g ON ug.GroupID = g.ID
																   AND g.Status = 'A';