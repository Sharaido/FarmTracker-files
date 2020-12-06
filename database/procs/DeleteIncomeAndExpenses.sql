ALTER PROC DeleteIncomeAndExpenses
@IEUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN

	UPDATE incomeAndExpeneses
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE IEUID = @IEUID
	
	DECLARE @FUID uniqueidentifier
	SELECT @FUID = FUID FROM incomeAndExpeneses WHERE IEUID = @IEUID 
	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID
END