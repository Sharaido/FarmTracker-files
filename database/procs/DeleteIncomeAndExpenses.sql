CREATE PROC DeleteIncomeAndExpenses
@IEUID uniqueidentifier,
@UUID uniqueidentifier
AS
BEGIN

	UPDATE incomeAndExpeneses
	SET deletedFlag = 1, deletedByUUID = @UUID, deletedDate = GETUTCDATE()
	WHERE IEUID = @IEUID

END