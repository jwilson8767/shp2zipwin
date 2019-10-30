$7zip_exe = (Get-Command 7z.exe -erroraction 'silentlycontinue' | % { $_.Path })
if ([string]::IsNullOrEmpty($7zip_exe))
{
    $7zip_exe = (Get-Command 7za.exe -erroraction 'silentlycontinue' | % { $_.Path })
}
if ([string]::IsNullOrEmpty($7zip_exe))
{
    $7zip_exe = $env:ProgramFiles + "\7-Zip\7z.exe"
}

if (!(Test-Path $args[0] -PathType Leaf)){
    throw "The file specified does not exist"
}

if ([System.IO.Path]::GetExtension($args[0]) -ne '.shp')
{
    throw "The file specified is not a shapefile!"
}

$extensions = [System.Collections.ArrayList]@(".shp",".shx", ".dbf", ".sbn",".qpj", ".sbx", ".fbn", ".fbx", ".ain", ".aih", ".atx", ".ixs", ".mxs", ".prj", ".xml", ".cpg", ".shp.xml")

$input_file_basename = [System.IO.Path]::GetFileNameWithoutExtension($args[0])

$input_files = [System.Collections.ArrayList]@()
foreach ($ext in $extensions)
{
    $file = $input_file_basename + $ext
    if (Test-Path $file -PathType Leaf)
    {
        [void]$input_files.Add($file)
    }
}

$outfile = $input_file_basename + '.shp.zip'

$params = [System.Collections.ArrayList]@('u','-tzip', '-mx=9',$outfile)
$params.AddRange($input_files)
#echo $7zip_exe
#echo ($params)
& $7zip_exe $params


