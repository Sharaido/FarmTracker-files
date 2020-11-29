CREATE PROC DeleteFPEntity
@EUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN
	UPDATE entityOfFP
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE EUID = @EUID
END
