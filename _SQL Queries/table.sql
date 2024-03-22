CREATE TABLE [identity].[Users](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LoginName] [varchar](100) NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Description] [varchar](1000) NULL,
	[Phone] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Password] [varbinary](250) NULL,
	[IsNew] [bit] NULL,
	[Blocked] [bit] NULL,
	[IsEditing] [bit] NULL,
	[Status] [char](1) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [identity].[Users] ADD  CONSTRAINT [DF_Users_IsNew]  DEFAULT ((1)) FOR [IsNew]
GO

ALTER TABLE [identity].[Users] ADD  CONSTRAINT [DF_Users_Blocked]  DEFAULT ((0)) FOR [Blocked]
GO

ALTER TABLE [identity].[Users] ADD  CONSTRAINT [DF_Users_IsEditing]  DEFAULT ((1)) FOR [IsEditing]
GO

ALTER TABLE [identity].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [identity].[Users] ADD  CONSTRAINT [DF_Users_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [identity].[Groups](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](100) NULL,
	[Description] [varchar](1000) NULL,
	[IsEditing] [bit] NULL,
	[Blocked] [bit] NULL,
	[Status] [nchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [identity].[Groups] ADD  CONSTRAINT [DF_Groups_IsEditing]  DEFAULT ((1)) FOR [IsEditing]
GO

ALTER TABLE [identity].[Groups] ADD  CONSTRAINT [DF_Groups_Blocked]  DEFAULT ((0)) FOR [Blocked]
GO

ALTER TABLE [identity].[Groups] ADD  CONSTRAINT [DF_Groups_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [identity].[Groups] ADD  CONSTRAINT [DF_Groups_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [identity].[Roles](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](100) NULL,
	[Description] [varchar](1000) NULL,
	[IsEditing] [bit] NULL,
	[Blocked] [bit] NULL,
	[Status] [char](1) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [identity].[Roles] ADD  CONSTRAINT [DF_Roles_IsEditing]  DEFAULT ((0)) FOR [IsEditing]
GO

ALTER TABLE [identity].[Roles] ADD  CONSTRAINT [DF_Roles_Blocked]  DEFAULT ((0)) FOR [Blocked]
GO

ALTER TABLE [identity].[Roles] ADD  CONSTRAINT [DF_Roles_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [identity].[Roles] ADD  CONSTRAINT [DF_Roles_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO


CREATE TABLE [identity].[UserGroups](
	[ID] [int] NOT NULL,
	[UserID] [int] NULL,
	[GroupID] [int] NULL,
	[Status] [char](1) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_UserGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [identity].[UserGroups] ADD  CONSTRAINT [DF_UserGroups_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [identity].[UserGroups] ADD  CONSTRAINT [DF_UserGroups_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [identity].[UserGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserGroups_Groups] FOREIGN KEY([GroupID])
REFERENCES [identity].[Groups] ([ID])
GO

ALTER TABLE [identity].[UserGroups] CHECK CONSTRAINT [FK_UserGroups_Groups]
GO

ALTER TABLE [identity].[UserGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserGroups_Users] FOREIGN KEY([UserID])
REFERENCES [identity].[Users] ([ID])
GO

ALTER TABLE [identity].[UserGroups] CHECK CONSTRAINT [FK_UserGroups_Users]
GO

CREATE TABLE [identity].[UserLogins](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[Date] [datetime] NULL,
	[Status] [char](1) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [identity].[UserLogins] ADD  CONSTRAINT [DF_UserLogins_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [identity].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_UserLogins] FOREIGN KEY([ID])
REFERENCES [identity].[UserLogins] ([ID])
GO

ALTER TABLE [identity].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_UserLogins]
GO

CREATE TABLE [identity].[UserRoles](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
	[Status] [char](1) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [identity].[UserRoles] ADD  CONSTRAINT [DF_UserRoles_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [identity].[UserRoles] ADD  CONSTRAINT [DF_UserRoles_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [identity].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [identity].[Roles] ([ID])
GO

ALTER TABLE [identity].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO

ALTER TABLE [identity].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserID])
REFERENCES [identity].[Users] ([ID])
GO

ALTER TABLE [identity].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO

CREATE TABLE [identity].[GroupRoles](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[GroupID] [int] NULL,
	[RoleID] [int] NULL,
	[Status] [char](1) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_GroupRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [identity].[GroupRoles] ADD  CONSTRAINT [DF_GroupRoles_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [identity].[GroupRoles] ADD  CONSTRAINT [DF_GroupRoles_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [identity].[GroupRoles]  WITH CHECK ADD  CONSTRAINT [FK_GroupRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [identity].[Roles] ([ID])
GO

ALTER TABLE [identity].[GroupRoles] CHECK CONSTRAINT [FK_GroupRoles_Roles]
GO

ALTER TABLE [identity].[GroupRoles]  WITH CHECK ADD  CONSTRAINT [FK_GroupRoles_Groups] FOREIGN KEY([GroupID])
REFERENCES [identity].[Groups] ([ID])
GO

ALTER TABLE [identity].[GroupRoles] CHECK CONSTRAINT [FK_GroupRoles_Groups]
GO

CREATE TABLE [dbo].[Files](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[plkExtension] [char](10) NULL,
	[Name] [varchar](250) NULL,
	[Number] [varchar](50) NULL,
	[SystemNumber] [varchar](50) NULL,
	[FileName] [varchar](250) NULL,
	[Link] [varchar](4000) NULL,
	[Version] [tinyint] NULL,
	[Description] [varchar](4000) NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [cmdb].[ObjectStates](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[Status] [char](1) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ObjectStates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [cmdb].[ObjectStates] ADD  CONSTRAINT [DF_ObjectStates_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [cmdb].[ObjectStates] ADD  CONSTRAINT [DF_ObjectStates_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [cmdb].[TypeOfObjects](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](150) NULL,
	[Icon] [varchar](50) NULL,
	[IsHardware] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_TypeOfObjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [cmdb].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [cmdb].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [cmdb].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [cmdb].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [cmdb].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [cmdb].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [cmdb].[TypeOfObjects] ADD  CONSTRAINT [DF_TypeOfObjects_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [cmdb].[ParametersType](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfObjectID] [int] NULL,
	[ObjectGroupID] [int] NULL,
	[Label] [varchar](150) NULL,
	[ValueType] [varchar](50) NULL,
	[Control] [varchar](50) NULL,
	[Inherit] [bit] NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [nchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ParametersType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [cmdb].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_Inherit]  DEFAULT ((0)) FOR [Inherit]
GO

ALTER TABLE [cmdb].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [cmdb].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [cmdb].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [cmdb].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [cmdb].[ParametersType] ADD  CONSTRAINT [DF_ParametersType_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [cmdb].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [cmdb].[ParametersType] ADD  CONSTRAINT [DF_ParametersForObjectType_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [cmdb].[ParametersType]  WITH CHECK ADD  CONSTRAINT [FK_ParametersType_ParametersType] FOREIGN KEY([ID])
REFERENCES [cmdb].[ParametersType] ([ID])
GO

ALTER TABLE [cmdb].[ParametersType] CHECK CONSTRAINT [FK_ParametersType_ParametersType]
GO

ALTER TABLE [cmdb].[ParametersType]  WITH CHECK ADD  CONSTRAINT [FK_ParametersType_TypeOfObjects] FOREIGN KEY([TypeOfObjectID])
REFERENCES [cmdb].[TypeOfObjects] ([ID])
GO

ALTER TABLE [cmdb].[ParametersType] CHECK CONSTRAINT [FK_ParametersType_TypeOfObjects]
GO

CREATE TABLE [cmdb].[ObjectProperties](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ObjectID] [int] NULL,
	[ParameterTypeID] [int] NULL,
	[Value] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ObjectProperties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [cmdb].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [cmdb].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [cmdb].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [cmdb].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [cmdb].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [cmdb].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [cmdb].[ObjectProperties] ADD  CONSTRAINT [DF_ObjectParameters_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [cmdb].[ObjectProperties]  WITH CHECK ADD  CONSTRAINT [FK_ObjectProperties_ParametersType] FOREIGN KEY([ParameterTypeID])
REFERENCES [cmdb].[ParametersType] ([ID])
GO

ALTER TABLE [cmdb].[ObjectProperties] CHECK CONSTRAINT [FK_ObjectProperties_ParametersType]
GO

CREATE TABLE [cmdb].[CategoryOfParameters](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](150) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_CategoryOfParameters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [cmdb].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [cmdb].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [cmdb].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [cmdb].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [cmdb].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [cmdb].[CategoryOfParameters] ADD  CONSTRAINT [DF_CategoryOfParameters_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [cmdb].[ParameterCategories](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ParameterTypeID] [int] NULL,
	[CategoryOfParametersID] [int] NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ParameterCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [cmdb].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [cmdb].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [cmdb].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [cmdb].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [cmdb].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [cmdb].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [cmdb].[ParameterCategories] ADD  CONSTRAINT [DF_ParameterCategories_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [cmdb].[Objects](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ParentID] [int] NULL,
	[ChildID] [int] NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [varchar](500) NULL,
	[ObjectStateID] [int] NULL,
	[TypeOfObjectID] [int] NULL,
	[TagNumber] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[Status] [char](1) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_Objects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [cmdb].[Objects] ADD  CONSTRAINT [DF_Objects_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [cmdb].[Objects] ADD  CONSTRAINT [DF_Objects_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [cmdb].[Objects] ADD  CONSTRAINT [DF_Objects_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [cmdb].[Objects] ADD  CONSTRAINT [DF_Objects_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [cmdb].[Objects] ADD  CONSTRAINT [DF_Objects_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [cmdb].[Objects] ADD  CONSTRAINT [DF_Objects_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [cmdb].[Objects] ADD  CONSTRAINT [DF_Objects_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [cmdb].[Objects]  WITH CHECK ADD  CONSTRAINT [FK_Objects_Objects] FOREIGN KEY([ObjectStateID])
REFERENCES [cmdb].[ObjectStates] ([ID])
GO

ALTER TABLE [cmdb].[Objects] CHECK CONSTRAINT [FK_Objects_Objects]
GO

ALTER TABLE [cmdb].[Objects]  WITH CHECK ADD  CONSTRAINT [FK_Objects_TypeOfObjects] FOREIGN KEY([TypeOfObjectID])
REFERENCES [cmdb].[TypeOfObjects] ([ID])
GO

ALTER TABLE [cmdb].[Objects] CHECK CONSTRAINT [FK_Objects_TypeOfObjects]
GO

CREATE TABLE [cmdb].[ObjectsHierarchy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[ChildID] [int] NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Status] [char](1) NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ObjectsHierarchy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [cmdb].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE [cmdb].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_CreationUserID]  DEFAULT ((0)) FOR [CreationUserID]
GO

ALTER TABLE [cmdb].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_ModifyingDate]  DEFAULT (getdate()) FOR [ModifyingDate]
GO

ALTER TABLE [cmdb].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_ModifyingUserID]  DEFAULT ((0)) FOR [ModifyingUserID]
GO

ALTER TABLE [cmdb].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [cmdb].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [cmdb].[ObjectsHierarchy] ADD  CONSTRAINT [DF_ObjectsHierarchy_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [hd].[TicketStatusValues](
	[Status] [char](1) NOT NULL,
	[Disclaimer] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_TicketStatusValues] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hd].[TicketStatusValues] ADD  CONSTRAINT [DF_TicketStatusValues_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[TicketStatusValues] ADD  CONSTRAINT [DF_TicketStatusValues_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [hd].[TicketAssignmentUsers](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TicketID] [int] NULL,
	[UserID] [int] NULL,
	[Description] [varchar](max) NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_TicketAssignmentUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [hd].[TicketAssignmentUsers] ADD  CONSTRAINT [DF_TicketAssignmentUsers_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [hd].[TicketAssignmentUsers] ADD  CONSTRAINT [DF_TicketAssignmentUsers_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[TicketAssignmentUsers] ADD  CONSTRAINT [DF_TicketAssignmentUsers_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [hd].[PrioritiesOfTicket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[Icon] [varchar](50) NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_PrioritiesOfTicket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hd].[PrioritiesOfTicket] ADD  CONSTRAINT [DF_PrioritiesOfTicket_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [hd].[PrioritiesOfTicket] ADD  CONSTRAINT [DF_PrioritiesOfTicket_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[PrioritiesOfTicket] ADD  CONSTRAINT [DF_PrioritiesOfTicket_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [hd].[TicketFiles](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TicketID] [int] NULL,
	[FileID] [int] NULL,
	[Status] [char](1) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_TicketFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hd].[TicketFiles] ADD  CONSTRAINT [DF_TicketFiles_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [hd].[TicketFiles] ADD  CONSTRAINT [DF_TicketFiles_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [hd].[TypesOfTicket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[Icon] [varchar](50) NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_TypesOfTicket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hd].[TypesOfTicket] ADD  CONSTRAINT [DF_TypesOfTicket_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [hd].[TypesOfTicket] ADD  CONSTRAINT [DF_TypesOfTicket_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[TypesOfTicket] ADD  CONSTRAINT [DF_TypesOfTicket_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [hd].[ActionTypes](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Description] [varchar](150) NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ActionTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hd].[ActionTypes] ADD  CONSTRAINT [DF_ActionTypes_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[ActionTypes] ADD  CONSTRAINT [DF_ActionTypes_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO


CREATE TABLE [hd].[Actions](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ActionID] [int] NULL,
	[TicketID] [int] NULL,
	[UserID] [int] NULL,
	[ActionTypeID] [int] NULL,
	[Information] [varchar](max) NULL,
	[Date] [datetime] NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [hd].[Actions] ADD  CONSTRAINT [DF_Actions_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [hd].[Actions] ADD  CONSTRAINT [DF_Actions_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[Actions] ADD  CONSTRAINT [DF_Actions_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [hd].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_Actions] FOREIGN KEY([ActionID])
REFERENCES [hd].[Actions] ([ID])
GO

ALTER TABLE [hd].[Actions] CHECK CONSTRAINT [FK_Actions_Actions]
GO

ALTER TABLE [hd].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_ActionTypes] FOREIGN KEY([ActionTypeID])
REFERENCES [hd].[ActionTypes] ([ID])
GO

ALTER TABLE [hd].[Actions] CHECK CONSTRAINT [FK_Actions_ActionTypes]
GO

ALTER TABLE [hd].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_Tickets] FOREIGN KEY([TicketID])
REFERENCES [hd].[Tickets] ([ID])
GO

ALTER TABLE [hd].[Actions] CHECK CONSTRAINT [FK_Actions_Tickets]
GO

ALTER TABLE [hd].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_Users] FOREIGN KEY([UserID])
REFERENCES [identity].[Users] ([ID])
GO

ALTER TABLE [hd].[Actions] CHECK CONSTRAINT [FK_Actions_Users]
GO

CREATE TABLE [hd].[ActionFiles](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ActionID] [int] NULL,
	[FileID] [int] NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ActionFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hd].[ActionFiles] ADD  CONSTRAINT [DF_ActionFiles_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [hd].[ActionFiles] ADD  CONSTRAINT [DF_ActionFiles_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[ActionFiles] ADD  CONSTRAINT [DF_ActionFiles_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [hd].[ActionUsers](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ActionID] [int] NULL,
	[UserID] [int] NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_ActionUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hd].[ActionUsers] ADD  CONSTRAINT [DF_ActionUsers_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [hd].[ActionUsers] ADD  CONSTRAINT [DF_ActionUsers_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[ActionUsers] ADD  CONSTRAINT [DF_ActionUsers_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [hd].[TicketsCategory](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](150) NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_TicketsCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hd].[TicketsCategory] ADD  CONSTRAINT [DF_TicketsCategory_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[TicketsCategory] ADD  CONSTRAINT [DF_TicketsCategory_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [hd].[TicketsSource](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [varchar](150) NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_TicketsSource] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hd].[TicketsSource] ADD  CONSTRAINT [DF_TicketsSource_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[TicketsSource] ADD  CONSTRAINT [DF_TicketsSource_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

CREATE TABLE [hd].[Tickets](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Number] [varchar](50) NULL,
	[UserID] [int] NULL,
	[TypeOfTicketID] [int] NULL,
	[PriorityOfTicketID] [int] NULL,
	[TicketCategoryID] [int] NULL,
	[TicketSourceID] [int] NULL,
	[Date] [datetime] NULL,
	[Topic] [varchar](100) NULL,
	[Disclaimer] [varchar](max) NULL,
	[Status] [char](1) NULL,
	[CreationDate] [datetime] NULL,
	[CreationUserID] [int] NULL,
	[ModifyingDate] [datetime] NULL,
	[ModifyingUserID] [int] NULL,
	[Deleted] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [hd].[Tickets] ADD  CONSTRAINT [DF_Tickets_Status]  DEFAULT ('A') FOR [Status]
GO

ALTER TABLE [hd].[Tickets] ADD  CONSTRAINT [DF_Tickets_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [hd].[Tickets] ADD  CONSTRAINT [DF_Tickets_rowguid]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [hd].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_PrioritiesOfTicket] FOREIGN KEY([PriorityOfTicketID])
REFERENCES [hd].[PrioritiesOfTicket] ([ID])
GO

ALTER TABLE [hd].[Tickets] CHECK CONSTRAINT [FK_Tickets_PrioritiesOfTicket]
GO

ALTER TABLE [hd].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketsCategory] FOREIGN KEY([TicketCategoryID])
REFERENCES [hd].[TicketsCategory] ([ID])
GO

ALTER TABLE [hd].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketsCategory]
GO

ALTER TABLE [hd].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketsSource] FOREIGN KEY([TicketSourceID])
REFERENCES [hd].[TicketsSource] ([ID])
GO

ALTER TABLE [hd].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketsSource]
GO

ALTER TABLE [hd].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TypesOfTicket] FOREIGN KEY([TypeOfTicketID])
REFERENCES [hd].[TypesOfTicket] ([ID])
GO

ALTER TABLE [hd].[Tickets] CHECK CONSTRAINT [FK_Tickets_TypesOfTicket]
GO

