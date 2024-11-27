$connectionString = "Data Source=(local)\SOLARWINDS_ORION;Initial Catalog=SolarWindsOrion;User ID=SolarWindsOrionDatabaseUser;Password=4uP%1yS+080I0pv8;Encrypt=False"
$sqlQueryDelete = "DELETE FROM syslog WHERE DateTime < DATEADD(HOUR, -48, GETDATE())"
$sqlQueryExecuteSP = "EXEC InsertErrorCountsTemp"
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString

try {
    if ($connection.State -ne 'Open') {
        $connection.Open()
    }

    # Izvršavanje SQL upita za brisanje starih zapisa
    $commandDelete = $connection.CreateCommand()
    $commandDelete.CommandText = $sqlQueryDelete
    $rowsDeleted = $commandDelete.ExecuteNonQuery()
    Write-Output "Deleted $rowsDeleted rows from syslog older than 48 hours."

    # Izvršavanje stored procedure
    $commandSP = $connection.CreateCommand()
    $commandSP.CommandText = $sqlQueryExecuteSP
    $commandSP.ExecuteNonQuery()
    Write-Output "Executed InsertErrorCountsTemp stored procedure."
    Start-Sleep -Seconds 3
    # Exit 0 označava uspešno završenje skripte
    exit 0
}
catch {
    Write-Error "Greška prilikom izvršavanja SQL upita: $_"
    # Dodajte dodatne informacije o grešci ako je potrebno
    Write-Error "Tip greške: $($_.Exception.GetType().FullName)"

    # Exit -1 označava grešku prilikom izvršenja skripte
    exit -1
}
finally {
    # Zatvaranje veze s bazom
    if ($connection.State -eq 'Open') {
        $connection.Close()
    }

    # Oslobađanje resursa
    Remove-Variable -Name connection

    # Završne poruke
    Write-Output "Skripta je završila izvršavanje."
}
