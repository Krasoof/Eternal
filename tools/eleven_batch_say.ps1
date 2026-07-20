# Dubbing linii StExt_Say: skan skryptow -> CRC32 (identyczny z DLL
# VoiceController.cpp StExt_SayCrc32) -> ElevenLabs TTS -> WAV 22050/16/mono
# -> deploy do _work\Data\Sound\Speech obu instalacji.
# Nazwa pliku = nazwa OU (STEXT_SAY_<CRC32>.WAV) - silnik podpina audio sam.
#
# Uzycie:
#   powershell -File tools\eleven_batch_say.ps1 -DryRun     # tylko lista linii
#   powershell -File tools\eleven_batch_say.ps1             # generuj + deploy
param(
    [switch]$DryRun,
    [string]$VoiceId = "pNInz6obpgDQGcFmaJgB",   # Adam - Dominant, Firm (surowy Mistrz)
    [double]$Stability = 0.45,
    [double]$Similarity = 0.80,
    [string]$Model = "eleven_multilingual_v2"
)
$ErrorActionPreference = "Stop"
$repo = Split-Path $PSScriptRoot -Parent
$scriptsDir = Join-Path $repo "System\Autorun\EthernalBreeze"
$outDir = Join-Path $PSScriptRoot "voices_say"
$targets = @("C:\Gry\Steam\steamapps\common\Gothic II", "C:\ghotic_test\Gothic II")

# CRC32 - dokladnie ten sam algorytm co DLL (poly 0xEDB88320, init/final 0xFFFFFFFF),
# liczony po bajtach literalu ze skryptu (Latin-1 = bajty 1:1).
function Get-SayCrc32([string]$text) {
    # UWAGA PS 5.1: literal 0xFFFFFFFF parsuje sie jako int32 = -1 (maska
    # bylaby no-opem) - stad jawne wartosci long.
    $mask = [long]4294967295      # 0xFFFFFFFF
    $poly = [long]3988292384      # 0xEDB88320
    $bytes = [System.Text.Encoding]::GetEncoding(28591).GetBytes($text)
    [long]$crc = $mask
    foreach ($b in $bytes) {
        $crc = $crc -bxor [long]$b
        for ($k = 0; $k -lt 8; $k++) {
            if ($crc -band 1) { $crc = (($crc -shr 1) -bxor $poly) -band $mask }
            else { $crc = ($crc -shr 1) -band $mask }
        }
    }
    return "{0:X8}" -f (($crc -bxor $mask) -band $mask)
}

# Wymowa: tekst w skrypcie jest ASCII (bez ogonkow), lektor ma czytac
# poprawna polszczyzne. Klucz = CRC linii, wartosc = tekst do TTS.
# Linie bez wpisu czytane sa tak, jak stoja w skrypcie.
$Spoken = @{}
$spokenPath = Join-Path $PSScriptRoot "eleven_say_spoken.psd1"
if (Test-Path $spokenPath) { $Spoken = Import-PowerShellDataFile $spokenPath }

# Glosy per mowca: token pierwszego argumentu StExt_Say -> voice id.
# Linie gracza (sentinel "HERO") NIE dostaja dubbingu (kanon: hero bez glosu).
function Resolve-VoiceId([string]$speakerToken) {
    if ($speakerToken -match 'Kowal') { return 'SOYHLrjzK2X1ezoPC6cr' }        # Harry - Fierce Warrior (design HubSouls)
    if ($speakerToken -match 'DarkTeacher') { return 'N2lVS1w4EtoT3dr4eOWO' }  # Callum - Husky Trickster (Mistrz Mrocznych Rycerzy: chropawy, zlowieszczy, oddany Beliarowi; free-premade)
    return $VoiceId                                                            # domyslnie: Adam (Mistrz Zakonu)
}

# --- ekstrakcja linii ---
$lines = @()
Get-ChildItem $scriptsDir -Recurse -Filter "*.d" | ForEach-Object {
    $content = [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::GetEncoding(28591))
    foreach ($m in [regex]::Matches($content, 'StExt_Say\s*\(\s*([^,]+),\s*"([^"]*)"\s*\)')) {
        $speaker = $m.Groups[1].Value.Trim()
        $text = $m.Groups[2].Value
        if ($text.Trim().Length -eq 0) { continue }
        if ($speaker -match 'HERO') { continue }    # linie gracza: napisy bez glosu
        $crc = Get-SayCrc32 $text
        if (-not ($lines | Where-Object { $_.Crc -eq $crc })) {
            $lines += [pscustomobject]@{ Crc = $crc; File = $_.Name; Text = $text; Voice = (Resolve-VoiceId $speaker) }
        }
    }
}
Write-Output ("Znaleziono {0} unikalnych linii StExt_Say (bez linii HERO)" -f $lines.Count)

if ($DryRun) {
    foreach ($l in $lines) {
        $sp = ""; if ($Spoken.ContainsKey($l.Crc)) { $sp = " [wymowa OK]" }
        Write-Output ("STEXT_SAY_{0}  ({1}){2}`n  {3}" -f $l.Crc, $l.File, $sp, $l.Text)
    }
    return
}

# --- generacja ---
New-Item -ItemType Directory -Force $outDir | Out-Null
$key = (Get-Content (Join-Path $PSScriptRoot ".eleven_key") -Raw).Trim()
$manifest = @()
$made = 0; $skipped = 0

foreach ($l in $lines) {
    $wavName = "STEXT_SAY_$($l.Crc).WAV"
    $wavPath = Join-Path $outDir $wavName
    $ttsText = if ($Spoken.ContainsKey($l.Crc)) { $Spoken[$l.Crc] } else { $l.Text }
    $manifest += "$wavName`t$($l.File)`t$($l.Text)"

    if (Test-Path $wavPath) { $skipped++; continue }

    $body = @{
        text = $ttsText
        model_id = $Model
        voice_settings = @{ stability = $Stability; similarity_boost = $Similarity; style = 0.0; use_speaker_boost = $true }
    } | ConvertTo-Json -Compress
    $uri = "https://api.elevenlabs.io/v1/text-to-speech/$($l.Voice)/stream?output_format=pcm_22050"
    $tmpPcm = [IO.Path]::GetTempFileName()
    try {
        Invoke-WebRequest -Uri $uri -Method Post -Headers @{ "xi-api-key" = $key; "Content-Type" = "application/json" } `
            -Body ([System.Text.Encoding]::UTF8.GetBytes($body)) -OutFile $tmpPcm
        $pcm = [IO.File]::ReadAllBytes($tmpPcm)
        if ($pcm.Length -lt 200) { throw "Odpowiedz za krotka dla $wavName" }
        $sr = 22050; $bits = 16; $ch = 1
        $byteRate = $sr * $ch * ($bits / 8); $blockAlign = $ch * ($bits / 8)
        $fs = [IO.File]::Create($wavPath); $w = New-Object IO.BinaryWriter($fs)
        $w.Write([Text.Encoding]::ASCII.GetBytes("RIFF")); $w.Write([uint32](36 + $pcm.Length))
        $w.Write([Text.Encoding]::ASCII.GetBytes("WAVE")); $w.Write([Text.Encoding]::ASCII.GetBytes("fmt "))
        $w.Write([uint32]16); $w.Write([uint16]1); $w.Write([uint16]$ch); $w.Write([uint32]$sr)
        $w.Write([uint32]$byteRate); $w.Write([uint16]$blockAlign); $w.Write([uint16]$bits)
        $w.Write([Text.Encoding]::ASCII.GetBytes("data")); $w.Write([uint32]$pcm.Length); $w.Write($pcm)
        $w.Close()
        $sec = [math]::Round($pcm.Length / $byteRate, 1)
        Write-Output "TTS OK: $wavName ($sec s)  <- $($ttsText.Substring(0, [Math]::Min(60, $ttsText.Length)))..."
        $made++
    } finally { Remove-Item $tmpPcm -ErrorAction SilentlyContinue }
}

$manifest | Set-Content (Join-Path $outDir "manifest.txt") -Encoding UTF8
Write-Output "Wygenerowano: $made, pominieto (istnieja): $skipped"

# --- deploy ---
foreach ($t in $targets) {
    $speech = Join-Path $t "_work\Data\Sound\Speech"
    New-Item -ItemType Directory -Force $speech | Out-Null
    Copy-Item (Join-Path $outDir "STEXT_SAY_*.WAV") $speech -Force
    Write-Output "DEPLOY: $speech"
}
