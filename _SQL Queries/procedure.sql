CREATE PROCEDURE [dbo].[uspGetUzytkownik] 
	 @LoginName VARCHAR(50)
   , @Password VARCHAR(100)
AS
	BEGIN
		INSERT INTO ident.UserLogins
			   ( LoginName
			   , [Date]
			   , Status ) 
		VALUES ( @LoginName
			   , GETDATE()
			   , 'A' );

		SELECT u.ID
			 , u.LoginName
			 , u.FirstName
			 , u.LastName
			 , u.Description
			 , u.Email
			 , '???' AS Token
			 , STRING_AGG(r.Name, '|') AS UserRoles
		FROM ident.Users AS u INNER JOIN ident.UserRoles AS ur ON u.ID = ur.UserID
							  INNER JOIN ident.Roles AS r ON ur.RoleID = r.ID
		WHERE u.LoginName = @LoginName
			  AND PWDCOMPARE(@Password, u.Password, 0) = 1
			  AND u.Blocked = 0
			  AND u.STATUS = 'A'
		GROUP BY u.ID
			   , u.LoginName
			   , u.FirstName
			   , u.LastName
			   , u.Description
			   , u.Email;
	END;
GO

