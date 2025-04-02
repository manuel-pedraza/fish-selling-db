SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Manuel A. Pedraza S.
-- Create date: 3/24/2025
-- Description:	Using a cursor, shows ALL the fishes in their habitat 
--				follwed by the fishermen who have catched them.
-- =============================================
CREATE PROCEDURE ShowFishCatchesByHabitat
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Tables vars
	DECLARE 
		@wb_id INT,
		@wb_name NVARCHAR(max),
		@species_id INT,
		@species_name NVARCHAR(max),
		--@fish_id INT,
		--@fish_name NVARCHAR(max),
		@fish_catch_id INT,
		--@catch_id INT,
		@quantity INT,
		@fisherman_id INT,
		@fisherman_fn NVARCHAR(max),
		@fisherman_ln NVARCHAR(max);

	-- Index vars
	DECLARE
		@wb_index INT = 1,
		@fish_index INT = 1,
		@fisherman_index INT = 0;

	-- Start of cursor
	DECLARE HABITAT_CURSOR CURSOR
	FOR
		SELECT wb.id, wb.name
		--, s.id, s.name
		FROM WaterBodies AS wb
		--INNER JOIN Habitats AS h ON h.waterBodyId = wb.id
		--INNER JOIN Species AS s ON s.id = h.speciesId
	OPEN HABITAT_CURSOR
	FETCH NEXT FROM HABITAT_CURSOR INTO @wb_id, @wb_name
	WHILE @@FETCH_STATUS = 0 BEGIN
		SELECT 'Habitat ' + CAST(@wb_index AS VARCHAR(max)) + ' : ' +  @wb_name
		SET @wb_index = @wb_index + 1
		SET @fish_index = 0

		DECLARE FISH_CURSOR CURSOR
		FOR
			SELECT DISTINCT s.id, s.name
		--SELECT wb.id, wb.name--, s.id, s.name
			FROM WaterBodies AS wb
			INNER JOIN Habitats AS h ON h.waterBodyId = wb.id
			INNER JOIN Species AS s ON s.id = h.speciesId
			WHERE h.waterBodyId = @wb_id

		OPEN FISH_CURSOR
		FETCH NEXT FROM FISH_CURSOR INTO @species_id, @species_name

		WHILE @@FETCH_STATUS = 0 BEGIN
			SELECT 'Fish Species ' + CAST(@fish_index AS VARCHAR(max)) + ' : ' + @species_name AS ' '
			SET @fisherman_index = 0

			SELECT DISTINCT fc.id AS 'fc_id', fc.quantity, fm.id 'fm_id', fm.firstName, fm.lastName AS ' '
			FROM WaterBodies AS wb
			INNER JOIN Habitats AS h ON h.waterBodyId = wb.id
			INNER JOIN Species AS s ON s.id = h.speciesId
			INNER JOIN Fish AS f ON f.speciesId = s.id
			INNER JOIN FishCatch AS fc ON fc.fishId = f.id
			INNER JOIN Catches AS c ON c.id = fc.catchId
			INNER JOIN Fishermen AS fm ON fm.id = c.fishermanId
			WHERE @species_id = f.speciesId

			-- This cursor can be used to do operations for each fisherman, but its not optimal
			--DECLARE FISHERMEN_CURSOR CURSOR
			--FOR

			--OPEN FISHERMEN_CURSOR
			--FETCH NEXT FROM FISHERMEN_CURSOR INTO @fish_catch_id, @quantity, @fisherman_id, @fisherman_fn, @fisherman_ln
			--WHILE @@FETCH_STATUS = 0
			--BEGIN
			--	SELECT 'Fisherman ' + CAST(@fisherman_index AS VARCHAR(max)) + ' : ' + @fisherman_fn + ' ' + @fisherman_ln
			--	SET @fisherman_index = @fisherman_index + 1
			--	FETCH NEXT FROM FISHERMEN_CURSOR INTO @fish_catch_id, @quantity, @fisherman_id, @fisherman_fn, @fisherman_ln
			--END
			--CLOSE FISHERMEN_CURSOR
			--DEALLOCATE FISHERMEN_CURSOR

			SET @fish_index = @fish_index + 1
			FETCH NEXT FROM FISH_CURSOR INTO @species_id, @species_name
		END

		CLOSE FISH_CURSOR
		DEALLOCATE FISH_CURSOR

		FETCH NEXT FROM HABITAT_CURSOR INTO @wb_id, @wb_name
	END

	CLOSE HABITAT_CURSOR
	DEALLOCATE HABITAT_CURSOR
END
GO