CREATE PROC DeleteFarmProperty
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
END
