
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Manuel A. Pedraza S.
-- Create date: 4/29/2025
-- Description:	--6 TODO:  Makes an order for a given fish catch, customer, price, weight and deliver date (save and log an error if any).
-- =============================================
CREATE PROCEDURE MakeOrder
	@customer_id INT,
    @fishCatch_id INT,
    @quantity INT,
	@price DECIMAL,
    @weight DECIMAL,
    @dtd DATETIME -- Date to deliver
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
	-- SET XACT_ABORT ON;

	BEGIN TRANSACTION MakeOrderTrans;

    BEGIN TRY

		-- Validate the fish_id
		IF NOT EXISTS(
			SELECT fc.id
			FROM FishCatch AS fc
			WHERE fc.id = @fishCatch_id
		)
			RAISERROR('Invalid fish catch ID', 15, 10);
		
		-- Validate the customer_id
		IF NOT EXISTS(
			SELECT c.id
			FROM Customers AS c
			WHERE c.id = @customer_id
		)
			RAISERROR('Invalid customer ID', 15, 10);

		-- Validates if date is in the future
		IF @dtd < GETDATE()
			RAISERROR('Invalid date', 15, 10);
		
		-- Validates if weight is lesser than fish catch weight
		IF @weight > (
			SELECT fc.weight
			FROM FishCatch AS fc
			WHERE fc.id = @fishCatch_id
		)
			RAISERROR('Invalid weight', 15, 10);

		IF @quantity > (
			SELECT fc.quantity
			FROM FishCatch AS fc
			WHERE fc.id = @fishCatch_id
		)
			RAISERROR('Invalid quantity', 15, 10);

		INSERT INTO FishSellingDB.dbo.Orders (customerId, dateToDeliver, wasDelivered)
		VALUES ( @customer_id, @dtd, 0);
		DECLARE @newOrderId INT;
		SET @newOrderId = SCOPE_IDENTITY();

		INSERT INTO FishSellingDB.dbo.FishOrder (fishCatchId, quantity, weight, price, orderId)
		VALUES (@fishCatch_id, @quantity, @weight, @price, @newOrderId);

		COMMIT TRANSACTION MakeOrderTrans;
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION MakeOrderTrans;
		EXEC FishSellingDB.dbo.ErrorLogger
		EXEC FishSellingDB.dbo.PrintError
	END CATCH

END
GO