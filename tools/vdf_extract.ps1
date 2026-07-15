# Ekstraktor VDF (PSVDSC_V2.00). Uzycie:
#   powershell -File tools\vdf_extract.ps1 -Vdf <plik.vdf> -Out <dir> [-Filter ".TEX"]
param(
    [Parameter(Mandatory=$true)][string]$Vdf,
    [Parameter(Mandatory=$true)][string]$Out,
    [string]$Filter = ""
)
$d = [IO.File]::ReadAllBytes($Vdf)
$numEntries = [BitConverter]::ToUInt32($d, 272)
$rootOff = [BitConverter]::ToUInt32($d, 288)
$entrySize = [BitConverter]::ToUInt32($d, 292)
New-Item -ItemType Directory -Force $Out | Out-Null
$n = 0
for ($i = 0; $i -lt $numEntries; $i++) {
    $e = $rootOff + $i * $entrySize
    $name = [Text.Encoding]::ASCII.GetString($d, $e, 64).Trim()
    $off  = [BitConverter]::ToUInt32($d, $e + 64)
    $size = [BitConverter]::ToUInt32($d, $e + 68)
    $type = [BitConverter]::ToUInt32($d, $e + 72)
    $isDir = ($type -band 0x80000000) -ne 0
    if ($isDir -or $size -eq 0) { continue }
    if ($Filter -and -not $name.ToUpper().EndsWith($Filter.ToUpper())) { continue }
    if ($off + $size -gt $d.Length) { continue }
    $bytes = New-Object byte[] ($size); [Array]::Copy($d, $off, $bytes, 0, $size)
    [IO.File]::WriteAllBytes((Join-Path $Out $name), $bytes)
    $n++
}
Write-Host "Wypakowano: $n plikow ($Filter) -> $Out"
