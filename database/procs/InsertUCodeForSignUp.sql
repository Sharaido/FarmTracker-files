ALTER PROC InsertUCodeForSignUp
@IP varchar(15)
AS
BEGIN
	DECLARE @CTUID int = 4
	DECLARE @CountUCodesCreatedForSignUpLast5MinWithIP int
	SELECT @CountUCodesCreatedForSignUpLast5MinWithIP = COUNT(*) FROM generatedUCodes WHERE forIP = @IP AND CTUID = @CTUID AND DATEDIFF(SECOND, createdDate, GETUTCDATE()) < 300
	IF( @CountUCodesCreatedForSignUpLast5MinWithIP < 5)
	BEGIN
		INSERT INTO generatedUCodes(forIP, CTUID, expirationDate)
		OUTPUT inserted.*
		VALUES(@IP, @CTUID, DATEADD(MINUTE, 5, GETUTCDATE()))
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM generatedUCodes
	END
END 