# Buduje Data\STEXT_Voices.vdf z plikow docs\dubbing (glosy questow).
# Format: PSVDSC_V2.00 (Gothic VDFS). Drzewo: _WORK\DATA\SOUND\SFX\*.WAV
# Uruchom: powershell -File tools\build_voices_vdf.ps1

$repo = Split-Path $PSScriptRoot -Parent
$dub  = Join-Path $repo "docs\dubbing"
$out  = Join-Path $repo "Data\STEXT_Voices.vdf"

# mapa: nazwa w VDF -> plik zrodlowy
$files = [ordered]@{
    "STEXT_VOICE_M1.WAV" = "M1_zar.wav"
    "STEXT_VOICE_M2.WAV" = "M2_wieza.wav"
    "STEXT_VOICE_M3.WAV" = "M3_oczy.wav"
    "STEXT_VOICE_M4.WAV" = "M4_rytual.wav"
    "STEXT_VOICE_M5.WAV" = "M5_linia.wav"
    "STEXT_VOICE_M6.WAV" = "M6_dom.wav"
    "STEXT_VOICE_B1.WAV" = "B1_budzi.wav"
    "STEXT_VOICE_B2.WAV" = "B2_furia.wav"
}

$dirs = @("_WORK", "DATA", "SOUND", "SFX")
$numEntries = $dirs.Count + $files.Count
$entrySize = 80
$headerSize = 296
$dataStart = $headerSize + ($numEntries * $entrySize)

$blobs = @()
$total = 0
foreach ($k in $files.Keys) {
    $b = [IO.File]::ReadAllBytes((Join-Path $dub $files[$k]))
    $blobs += ,@($k, $b)
    $total += $b.Length
}

$fs = [IO.File]::Create($out)
$w = New-Object IO.BinaryWriter($fs)

# --- naglowek ---
$comment = "EthernalBreeze quest voices (Piper TTS)"
$cbytes = [Text.Encoding]::ASCII.GetBytes($comment)
$pad = New-Object byte[] (256)
for ($i=0; $i -lt 256; $i++) { $pad[$i] = 0x1A }
[Array]::Copy($cbytes, $pad, [Math]::Min($cbytes.Length, 255))
$w.Write($pad)
$w.Write([Text.Encoding]::ASCII.GetBytes("PSVDSC_V2.00`n`r`n`r"))
$w.Write([uint32]$numEntries)
$w.Write([uint32]$files.Count)
$now = Get-Date
$dos = (($now.Year - 1980) -shl 25) -bor ($now.Month -shl 21) -bor ($now.Day -shl 16) -bor ($now.Hour -shl 11) -bor ($now.Minute -shl 5) -bor [int]($now.Second / 2)
$w.Write([uint32]$dos)
$w.Write([uint32]$total)
$w.Write([uint32]$headerSize)
$w.Write([uint32]$entrySize)

function Write-Entry([IO.BinaryWriter]$w, [string]$name, [uint32]$offset, [uint32]$size, [uint32]$type, [uint32]$attr) {
    $n = $name.ToUpper().PadRight(64, ' ')
    $w.Write([Text.Encoding]::ASCII.GetBytes($n.Substring(0, 64)))
    $w.Write($offset); $w.Write($size); $w.Write($type); $w.Write($attr)
}

# --- tabela wpisow: kazdy katalog wskazuje indeks pierwszego dziecka ---
# [0]_WORK -> 1, [1]DATA -> 2, [2]SOUND -> 3, [3]SFX -> 4, [4..] pliki
$DIR = [uint32]2147483648; $LAST = [uint32]1073741824
Write-Entry $w "_WORK" 1 0 ($DIR -bor $LAST) 0
Write-Entry $w "DATA"  2 0 ($DIR -bor $LAST) 0
Write-Entry $w "SOUND" 3 0 ($DIR -bor $LAST) 0
Write-Entry $w "SFX"   4 0 ($DIR -bor $LAST) 0

$off = [uint32]$dataStart
for ($i=0; $i -lt $blobs.Count; $i++) {
    $name = $blobs[$i][0]; $bytes = $blobs[$i][1]
    $type = [uint32]0
    if ($i -eq $blobs.Count - 1) { $type = $LAST }
    Write-Entry $w $name $off ([uint32]$bytes.Length) $type 0x20
    $off += [uint32]$bytes.Length
}

# --- dane ---
foreach ($b in $blobs) { $w.Write($b[1]) }
$w.Close()
Write-Host "OK: $out ($([IO.FileInfo]::new($out).Length) B, $($files.Count) plikow)"
