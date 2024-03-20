CREATE PROCEDURE [dbo].[uspGetUzytkownik] 
	 @LoginName VARCHAR(50)
   , @Password VARCHAR(100)
AS
	BEGIN
		INSERT INTO [identity].UserLogins
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
		FROM [identity].Users AS u INNER JOIN [identity].UserRoles AS ur ON u.ID = ur.UserID
								   INNER JOIN [identity].Roles AS r ON ur.RoleID = r.ID
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

