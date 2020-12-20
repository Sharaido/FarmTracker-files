ALTER PROC InsertFarmEntity
@NAME nvarchar(50),
@CUID int,
@FUID uniqueidentifier,
@COUNT int,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	INSERT INTO farmEntities(name, CUID, FUID, count, createdByUUID)
	OUTPUT inserted.*
	VALUES(@NAME, @CUID, @FUID, @COUNT, @CREATED_BY_UUID)

	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID
END