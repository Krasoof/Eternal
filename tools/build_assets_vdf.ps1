# Buduje Data\STEXT_Assets.vdf ze WSZYSTKICH naszych assetow (MDM zbroi,
# tekstury, glosy questow) - user przenosi tylko Data\, zadnych luznych _Work.
# Zrodlo: katalog staging podany nizej (odwzorowuje drzewo _WORK\DATA\...).
# Format: PSVDSC_V2.00; pelne drzewo katalogow (BFS, bloki dzieci ciagle).
# Uruchom: powershell -File tools\build_assets_vdf.ps1 [-Staging <dir>] [-Out <vdf>]
param(
    [string]$Staging = "$env:TEMP\stext_vdf_staging",
    [string]$Out = (Join-Path (Split-Path $PSScriptRoot -Parent) "Data\STEXT_Assets.vdf")
)

if (-not (Test-Path $Staging)) { Write-Error "Brak stagingu: $Staging"; exit 1 }

# --- zbierz drzewo ---
function Walk([string]$path) {
    $node = @{ Name = (Split-Path $path -Leaf); Dirs = @(); Files = @() }
    foreach ($d in (Get-ChildItem $path -Directory | Sort-Object Name)) { $node.Dirs += ,(Walk $d.FullName) }
    foreach ($f in (Get-ChildItem $path -File | Sort-Object Name)) {
        $node.Files += ,@{ Name = $f.Name; Bytes = [IO.File]::ReadAllBytes($f.FullName) }
    }
    return $node
}
$rootNodes = @()
foreach ($d in (Get-ChildItem $Staging -Directory | Sort-Object Name)) { $rootNodes += ,(Walk $d.FullName) }

# --- BFS: bloki wpisow (dzieci katalogu = ciagly blok; dir.offset = indeks 1. dziecka) ---
$DIRF = [uint32]2147483648; $LASTF = [uint32]1073741824
$entries = New-Object System.Collections.ArrayList   # @{Name;IsDir;Node;Offset;Size;Type;EntryIdx}
$queue = New-Object System.Collections.Queue

function Add-Block($dirNodes, $fileNodes) {
    $start = $entries.Count
    $total = $dirNodes.Count + $fileNodes.Count
    $i = 0
    foreach ($dn in $dirNodes) {
        $t = $DIRF; if ($i -eq $total - 1) { $t = $t -bor $LASTF }
        [void]$entries.Add(@{ Name=$dn.Name; IsDir=$true; Node=$dn; Offset=[uint32]0; Size=[uint32]0; Type=$t })
        $queue.Enqueue(@{ Node=$dn; EntryIdx=($entries.Count-1) })
        $i++
    }
    foreach ($fn in $fileNodes) {
        $t = [uint32]0; if ($i -eq $total - 1) { $t = $LASTF }
        [void]$entries.Add(@{ Name=$fn.Name; IsDir=$false; Node=$fn; Offset=[uint32]0; Size=[uint32]$fn.Bytes.Length; Type=$t })
        $i++
    }
    return $start
}

[void](Add-Block $rootNodes @())
while ($queue.Count -gt 0) {
    $item = $queue.Dequeue()
    $start = Add-Block $item.Node.Dirs $item.Node.Files
    $entries[$item.EntryIdx].Offset = [uint32]$start
}

# --- offsety danych plikow (w kolejnosci tabeli) ---
$numEntries = $entries.Count
$headerSize = 296; $entrySize = 80
$dataOff = [uint32]($headerSize + $numEntries * $entrySize)
$numFiles = 0; $dataSize = [uint32]0
foreach ($e in $entries) {
    if (-not $e.IsDir) { $e.Offset = $dataOff; $dataOff += $e.Size; $dataSize += $e.Size; $numFiles++ }
}

# --- zapis ---
$fs = [IO.File]::Create($Out); $w = New-Object IO.BinaryWriter($fs)
$pad = New-Object byte[] (256); for ($i=0; $i -lt 256; $i++) { $pad[$i] = 0x1A }
$cb = [Text.Encoding]::ASCII.GetBytes("EthernalBreeze assets (armors/textures/voices)")
[Array]::Copy($cb, $pad, [Math]::Min($cb.Length, 255)); $w.Write($pad)
$w.Write([Text.Encoding]::ASCII.GetBytes("PSVDSC_V2.00`n`r`n`r"))
$w.Write([uint32]$numEntries); $w.Write([uint32]$numFiles)
$now = Get-Date
$dos = (($now.Year-1980) -shl 25) -bor ($now.Month -shl 21) -bor ($now.Day -shl 16) -bor ($now.Hour -shl 11) -bor ($now.Minute -shl 5) -bor [int]($now.Second/2)
$w.Write([uint32]$dos); $w.Write([uint32]$dataSize); $w.Write([uint32]$headerSize); $w.Write([uint32]$entrySize)
foreach ($e in $entries) {
    $n = $e.Name.ToUpper().PadRight(64, ' ')
    $w.Write([Text.Encoding]::ASCII.GetBytes($n.Substring(0,64)))
    $w.Write([uint32]$e.Offset); $w.Write([uint32]$e.Size); $w.Write([uint32]$e.Type)
    if ($e.IsDir) { $w.Write([uint32]0) } else { $w.Write([uint32]0x20) }
}
foreach ($e in $entries) { if (-not $e.IsDir) { $w.Write($e.Node.Bytes) } }
$w.Close()
Write-Host "OK: $Out (wpisow: $numEntries, plikow: $numFiles, danych: $dataSize B)"
