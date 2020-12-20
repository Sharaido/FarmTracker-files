CREATE PROC DeleteFarmEntity
@EUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN

	UPDATE farmEntities
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE EUID = @EUID

	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = (SELECT FUID FROM farmEntities WHERE EUID = @EUID)

END