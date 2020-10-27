CREATE PROC SelectFailedSignInRequestsInTheLast5MinFromUUID
@UUID uniqueidentifier
AS
BEGIN
	SELECT * FROM signIn_logs WHERE UUID = @UUID AND attemptedResult = 0 AND DATEDIFF(SECOND, date, GETUTCDATE()) < 300
END 