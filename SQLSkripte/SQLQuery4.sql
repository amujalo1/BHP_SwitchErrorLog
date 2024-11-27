USE [SolarWindsOrion]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAllErrorCounts]    Script Date: 01/08/2024 13:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetAllErrorCounts](
    @datumOd DATE,
    @datumDo DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM ErrorCounts
    WHERE Datum BETWEEN @datumOd AND @datumDo
);
