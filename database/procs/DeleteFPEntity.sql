ALTER PROC DeleteFPEntity
@EUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN
	UPDATE entityOfFP
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE EUID = @EUID
	
	UPDATE entityDetails
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
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
