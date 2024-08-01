USE [SolarWindsOrion]
GO
/****** Object:  UserDefinedFunction [dbo].[GetErrorCountsGrouped]    Script Date: 01/08/2024 13:16:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetErrorCountsGrouped](
    @datumOd DATE,
    @datumDo DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        Interface,
		SUM(NumberOfErrors) AS NumberOfErrors,
        Hostname,
        IP,
		CAST(GETDATE() AS DATE) AS Datum
    FROM 
        ErrorCounts
    WHERE 
        Datum BETWEEN @datumOd AND @datumDo
    GROUP BY 
        Interface, Hostname, IP
);
