USE [SolarWindsOrion]
GO
/****** Object:  StoredProcedure [dbo].[InsertErrorCountsTemp]    Script Date: 01/08/2024 13:15:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[InsertErrorCountsTemp]
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM ErrorCounts
	WHERE Datum = CAST(GETDATE() AS DATE);
	

    WITH CTE AS (
        SELECT 
            MsgID,
            EngineID,
            DateTime,
            IP,
            Acknowledged,
            SysLogFacility,
            SysLogSeverity,
            Hostname_ANSI,
            Hostname_UNICODE,
            NodeID,
            MessageType_ANSI,
            MessageType_UNICODE,
            Message_ANSI,
            Message_UNICODE,
            SysLogTag_ANSI,
            SysLogTag_UNICODE,
            FirstIPInMessage,
            SecIPInMessage,
            MacInMessage,
            TimeStamp,
            Hostname,
            Message,
            MessageType,
            SysLogTag,
            SUBSTRING(Message_UNICODE, CHARINDEX(': ', Message_UNICODE) + 2, 
                     CASE WHEN CHARINDEX(',', Message_UNICODE) > 0 
                          THEN CHARINDEX(',', Message_UNICODE) - CHARINDEX(': ', Message_UNICODE) - 2 
                          ELSE LEN(Message_UNICODE) - CHARINDEX(': ', Message_UNICODE) - 1 END) AS interface,
            SUBSTRING(Message_UNICODE, CHARINDEX(', ', Message_UNICODE) + 2, LEN(Message_UNICODE)) AS tipPoruke,
			CAST(DateTime AS DATE) Datum
        FROM dbo.SysLog
    )

    INSERT INTO ErrorCounts (Interface, NumberOfErrors, Hostname, ip, Datum)
    SELECT 
        s1.interface AS Interface,
        COUNT(*) AS NumberOfErrors,
		s1.Hostname AS Hostname,
		s1.IP AS ip,
		s1.Datum AS Datum
    FROM 
        CTE s1
    WHERE 
		s1.Datum = CAST(GETDATE() AS DATE)
        AND s1.tipPoruke = 'changed state to down'
		AND s1.interface NOT LIKE '%Line protocol on%'
    GROUP BY
        s1.interface,
		s1.Datum,
		s1.IP,
		s1.Hostname
    HAVING
        COUNT(*) >= 10
END;

