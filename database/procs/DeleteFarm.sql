ALTER PROC DeleteFarm
@FUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN

	UPDATE entityDetails
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE EUID IN (SELECT EUID FROM entityOfFP WHERE PUID IN (SELECT PUID FROM farmProperties WHERE FUID = @FUID))

	UPDATE entityOfFP
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE PUID IN (SELECT PUID FROM farmProperties WHERE FUID = @FUID)

	UPDATE farmProperties
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE FUID = @FUID

	UPDATE farms
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE FUID = @FUID

END