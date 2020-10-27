ALTER PROC InsertUser
@USERNAME varchar(50),
@PASSWORD char(24),
@EMAIL nvarchar(50),
@NAME nvarchar(50),
@SURNAME nvarchar(50),
@GUC uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON
	IF(
		NOT EXISTS(SELECT username FROM users WHERE username = @USERNAME) AND
		NOT EXISTS(SELECT email FROM users WHERE email = @EMAIL) AND
		EXISTS(SELECT TOP(1) GUC FROM generatedUCodes WHERE GUC = @GUC AND isValid = 1 AND DATEDIFF(SECOND, GETUTCDATE(), expirationDate) > 0)
	)
	BEGIN
		BEGIN TRY
			BEGIN TRAN InsertUser
				--temp table for getting uniqueidentifiers 
				DECLARE @temp TABLE(UID uniqueidentifier)
				--Insert user
				INSERT 
				INTO users(username, password, email, name, surname)
				OUTPUT inserted.UUID
				INTO @temp
				VALUES(@USERNAME, @PASSWORD, @EMAIL, @NAME, @SURNAME)
				--Get user's UUID
				DECLARE @UUID uniqueidentifier = (SELECT UID FROM @temp)
				DELETE @temp --clear temp table 
				--Create email activation code
				DECLARE @CTUID int = 3 --EMAIL TYPE ID
				DECLARE @EXPIRATION_DATE datetime = DATEADD(DAY, 7, GETUTCDATE())
				INSERT INTO generatedUCodes(forUUID, expirationDate, CTUID)
				OUTPUT inserted.*
				VALUES (@UUID, @EXPIRATION_DATE, @CTUID)
				UPDATE generatedUCodes SET isValid = 0 WHERE GUC = @GUC
			COMMIT TRAN InsertUser
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN InsertUser
		END CATCH
	END
	ELSE
	BEGIN
		SELECT TOP 0 * FROM generatedUCodes
	END
END
