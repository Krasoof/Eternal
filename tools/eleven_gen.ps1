# ElevenLabs TTS -> WAV (22050 Hz 16-bit mono, gotowe pod Gothic SFX-VDF).
# Klucz z tools\.eleven_key (gitignored). Uzycie:
#   powershell -File tools\eleven_gen.ps1 -VoiceId <id> -Out <plik.wav> -Text "..."
param(
    [Parameter(Mandatory=$true)][string]$VoiceId,
    [Parameter(Mandatory=$true)][string]$Out,
    [Parameter(Mandatory=$true)][string]$Text,
    [double]$Stability = 0.45,
    [double]$Similarity = 0.80,
    [string]$Model = "eleven_multilingual_v2"
)
$ErrorActionPreference = "Stop"
$key = (Get-Content (Join-Path $PSScriptRoot ".eleven_key") -Raw).Trim()
$body = @{
    text = $Text
    model_id = $Model
    voice_settings = @{ stability = $Stability; similarity_boost = $Similarity; style = 0.0; use_speaker_boost = $true }
} | ConvertTo-Json -Compress
$uri = "https://api.elevenlabs.io/v1/text-to-speech/$VoiceId/stream?output_format=pcm_22050"
$tmpPcm = [IO.Path]::GetTempFileName()
try {
    Invoke-WebRequest -Uri $uri -Method Post -Headers @{ "xi-api-key" = $key; "Content-Type" = "application/json" } `
        -Body $body -OutFile $tmpPcm
    $pcm = [IO.File]::ReadAllBytes($tmpPcm)
    if ($pcm.Length -lt 200) { throw "Odpowiedz za krotka ($($pcm.Length) B) - blad API? tresc: $([Text.Encoding]::UTF8.GetString($pcm))" }
    # --- WAV header 16-bit mono 22050 ---
    $sr = 22050; $bits = 16; $ch = 1
    $byteRate = $sr * $ch * ($bits/8); $blockAlign = $ch * ($bits/8)
    $fs = [IO.File]::Create($Out); $w = New-Object IO.BinaryWriter($fs)
    $w.Write([Text.Encoding]::ASCII.GetBytes("RIFF")); $w.Write([uint32](36 + $pcm.Length))
    $w.Write([Text.Encoding]::ASCII.GetBytes("WAVE")); $w.Write([Text.Encoding]::ASCII.GetBytes("fmt "))
    $w.Write([uint32]16); $w.Write([uint16]1); $w.Write([uint16]$ch); $w.Write([uint32]$sr)
    $w.Write([uint32]$byteRate); $w.Write([uint16]$blockAlign); $w.Write([uint16]$bits)
    $w.Write([Text.Encoding]::ASCII.GetBytes("data")); $w.Write([uint32]$pcm.Length); $w.Write($pcm)
    $w.Close()
    $sec = [math]::Round($pcm.Length / $byteRate, 1)
    Write-Host "OK: $Out ($sec s, $([IO.FileInfo]::new($Out).Length) B)"
} finally { Remove-Item $tmpPcm -ErrorAction SilentlyContinue }
