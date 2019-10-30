
FileActionsConsole.exe add shp shpzip "Zip Shapefile" "Powershell.exe -File ""%appdata%\\ShellExtensions\\shp2zip.ps1"" "%%1"" [default=false]
copy shp2zip.ps1 "%appdata%\ShellExtensions\shp2zip.ps1" /Y

pause