CREATE PROC InsertExpense
@FUID uniqueidentifier,
@DATE datetime,
@HEAD nvarchar(50),
@DESCRIPRION nvarchar(max),
@COST money,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	INSERT INTO incomeAndExpeneses(FUID, date, head, decription, cost, createdByUUID, incomeFlag)
	OUTPUT inserted.*
	VALUES(@FUID, @DATE, @HEAD, @DESCRIPRION, @COST, @CREATED_BY_UUID, 0)
END
