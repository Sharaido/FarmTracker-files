CREATE PROC DeleteAdd
@AUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN

	UPDATE Adds
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE AUID = @AUID

END