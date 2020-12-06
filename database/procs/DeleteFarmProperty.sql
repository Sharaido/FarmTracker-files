ALTER PROC DeleteFarmProperty
@PUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN
	UPDATE farmProperties
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE PUID = @PUID

	UPDATE entityOfFP
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE PUID = @PUID

	UPDATE entityDetails
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE EUID IN (SELECT EUID FROM entityOfFP WHERE PUID = @PUID)
	
	DECLARE @FUID uniqueidentifier
	SELECT @FUID = FUID FROM farmProperties WHERE PUID = @PUID 
	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID
END
