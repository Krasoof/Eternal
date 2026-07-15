# Klonuje MDM podmieniajac nazwe tekstury (zero-terminated; nowa nazwa musi
# byc <= starej; reszta spanu zerowana). Uzycie:
#   powershell -File tools\patch_mdm.ps1 -Src a.mdm -Dst b.mdm -OldTga X.TGA -NewTga Y.TGA
param(
    [Parameter(Mandatory=$true)][string]$Src,
    [Parameter(Mandatory=$true)][string]$Dst,
    [Parameter(Mandatory=$true)][string]$OldTga,
    [Parameter(Mandatory=$true)][string]$NewTga
)
$d = [IO.File]::ReadAllBytes($Src)
$old = [Text.Encoding]::ASCII.GetBytes($OldTga.ToUpper())
$new = [Text.Encoding]::ASCII.GetBytes($NewTga.ToUpper())
if ($new.Length -gt $old.Length) { Write-Error "Nowa nazwa dluzsza od starej!"; exit 1 }
$hits = 0
for ($i = 0; $i -le $d.Length - $old.Length; $i++) {
    $ok = $true
    for ($j = 0; $j -lt $old.Length; $j++) { if ($d[$i+$j] -ne $old[$j]) { $ok = $false; break } }
    if (-not $ok) { continue }
    for ($j = 0; $j -lt $old.Length; $j++) { $d[$i+$j] = if ($j -lt $new.Length) { $new[$j] } else { 0 } }
    $hits++; $i += $old.Length - 1
}
[IO.File]::WriteAllBytes($Dst, $d)
Write-Host "OK: $([IO.Path]::GetFileName($Dst)) - podmian: $hits ($OldTga -> $NewTga)"
