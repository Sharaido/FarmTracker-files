CREATE PROC InsertIncomeOrExpense
@FUID uniqueidentifier,
@DATE datetime,
@HEAD nvarchar(50),
@DESCRIPRION nvarchar(max),
@COST money,
@CREATED_BY_UUID uniqueidentifier,
@INCOME_FLAG bit
AS
BEGIN
	INSERT INTO incomeAndExpeneses(FUID, date, head, description, cost, createdByUUID, incomeFlag)
	OUTPUT inserted.*
	VALUES(@FUID, @DATE, @HEAD, @DESCRIPRION, @COST, @CREATED_BY_UUID, @INCOME_FLAG)
	
	UPDATE farms SET lastModifiedDate = GETUTCDATE()
	WHERE FUID = @FUID
END
