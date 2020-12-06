ALTER PROC InsertDetailForEntityOfFP
@EUID uniqueidentifier,
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@COST money,
@REMAINDER_DATE datetime,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	INSERT INTO entityDetails(EUID, name, description, cost, remainderDate, createdByUUID)
	OUTPUT inserted.*
	VALUES(@EUID, @NAME, @DESCRIPTION, @COST, @REMAINDER_DATE, @CREATED_BY_UUID)

	UPDATE entityOfFP SET lastModifiedDate = GETUTCDATE()
	WHERE EUID = @EUID

	DECLARE @PUID uniqueidentifier
	SELECT @PUID = PUID FROM entityOfFP WHERE EUID = @EUID 
	UPDATE farmProperties SET lastModifiedDate = GETUTCDATE()
	WHERE PUID = @PUID
	
	DECLARE @FUID uniqueidentifier
	SELECT @FUID = FUID FROM farmProperties WHERE PUID = @PUID 
	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID

END