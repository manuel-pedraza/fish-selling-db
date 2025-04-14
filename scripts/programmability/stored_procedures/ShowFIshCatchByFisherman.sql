SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Manuel A. Pedraza S.
-- Create date: 3/24/2025
-- Description:	Show all the fish catch for a given fisherman id (save and log an error if any).
-- =============================================
CREATE PROCEDURE ShowFishCatchesByFisherman
    @fisherman_id INT
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    BEGIN TRY

		IF NOT EXISTS(
			SELECT lastName, firstName
            FROM Fishermen AS fm
            WHERE fm.id = @fisherman_id
		)
			RAISERROR('Invalid user ID', 15, 10);

		SELECT lastName, firstName
        FROM Fishermen AS fm
        WHERE fm.id = @fisherman_id;

		SELECT f.id AS Fish_id, fc.quantity
        FROM Fishermen AS fm
        INNER JOIN Catches AS c ON c.fishermanId = fm.id
        INNER JOIN FishCatch AS fc ON fc.catchId = c.id
        INNER JOIN Fish AS f ON f.id = fc.fishId
        WHERE fm.id = @fisherman_id;


	END TRY
	BEGIN CATCH
		EXEC FishSellingDB.dbo.ErrorLogger
		EXEC FishSellingDB.dbo.PrintError
	END CATCH

END
GO