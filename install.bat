
if not exist "%appdata%\ShellExtensions" mkdir "%appdata%\ShellExtensions"
copy shp2zip.ps1 "%appdata%\ShellExtensions\shp2zip.ps1" /Y
copy shp2zipdel.ps1 "%appdata%\ShellExtensions\shp2zipdel.ps1" /Y

FileActionsConsole.exe add shp shpzip "Zip Shapefile" "Powershell.exe -executionpolicy Bypass -File ""%appdata%\\ShellExtensions\\shp2zip.ps1"" "%%1""

FileActionsConsole.exe add shp shpzipdel "Zip Shapefile (remove original)" "Powershell.exe -executionpolicy Bypass -File ""%appdata%\\ShellExtensions\\shp2zipdel.ps1"" "%%1""

pause
