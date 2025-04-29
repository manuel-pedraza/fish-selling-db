
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Manuel A. Pedraza S.
-- Create date: 4/24/2025
-- Description:	Show all fishermen who have at least one catch.
-- =============================================
CREATE PROCEDURE ShowFishermenWithCatches
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    SELECT DISTINCT fm.id, fm.firstName, fm.lastName
    FROM Fishermen AS fm
    INNER JOIN Catches AS c ON c.fishermanId = fm.id
    INNER JOIN FishCatch AS fc ON fc.catchId = c.id
    ORDER BY fm.id

END
GO