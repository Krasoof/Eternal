# Konwerter Gothic ZTEX (-C.TEX) -> PNG (najwiekszy mipmap).
# Formaty: DXT1/DXT3/DXT5 + 16/24/32bpp. Uzycie:
#   powershell -File tools\tex2png.ps1 -In <dir|plik> -Out <dir>
param(
    [string]$In = "C:\ghotic_test\Gothic II\_Work\Data\Textures\_compiled",
    [string]$Out = (Join-Path (Split-Path $PSScriptRoot -Parent) "docs\armor_preview")
)
Add-Type -AssemblyName System.Drawing
Add-Type -TypeDefinition @"
using System;
public static class DxtDec {
    static void C565(ushort c, byte[] o, int p){ o[p]= (byte)(((c>>11)&31)*255/31); o[p+1]=(byte)(((c>>5)&63)*255/63); o[p+2]=(byte)((c&31)*255/31); }
    public static byte[] Decode(byte[] d, int w, int h, int fmt){ // fmt:10 dxt1,12 dxt3,14 dxt5
        byte[] outb = new byte[w*h*4]; int bs = fmt==10?8:16; int bw=(w+3)/4, bh=(h+3)/4; int off=0;
        byte[] c0=new byte[3], c1=new byte[3];
        for(int by=0; by<bh; by++) for(int bx=0; bx<bw; bx++){
            int o=off; off+=bs; int cofs = fmt==10?o:o+8;
            ushort a=(ushort)(d[cofs]|d[cofs+1]<<8), b=(ushort)(d[cofs+2]|d[cofs+3]<<8);
            C565(a,c0,0); C565(b,c1,0);
            uint idx=(uint)(d[cofs+4]|d[cofs+5]<<8|d[cofs+6]<<16|d[cofs+7]<<24);
            for(int py=0; py<4; py++) for(int px=0; px<4; px++){
                int x=bx*4+px, y=by*4+py; if(x>=w||y>=h) continue;
                int ci=(int)((idx>>(2*(py*4+px)))&3); byte r,g,bb;
                bool noAlphaBlack = fmt==10 && a<=b && ci==3;
                if(ci==0){r=c0[0];g=c0[1];bb=c0[2];} else if(ci==1){r=c1[0];g=c1[1];bb=c1[2];}
                else if(fmt==10 && a<=b){ if(ci==2){r=(byte)((c0[0]+c1[0])/2);g=(byte)((c0[1]+c1[1])/2);bb=(byte)((c0[2]+c1[2])/2);} else {r=0;g=0;bb=0;} }
                else if(ci==2){r=(byte)((2*c0[0]+c1[0])/3);g=(byte)((2*c0[1]+c1[1])/3);bb=(byte)((2*c0[2]+c1[2])/3);}
                else {r=(byte)((c0[0]+2*c1[0])/3);g=(byte)((c0[1]+2*c1[1])/3);bb=(byte)((c0[2]+2*c1[2])/3);}
                byte al=255;
                if(fmt==12){ int ai=o+(py*4+px)/2; byte av=d[ai+ ( (py*4+px)%2==0 ? 0:0)]; av = (py*4+px)%2==0 ? (byte)(av&15) : (byte)((d[o+(py*4+px)/2]>>4)&15); al=(byte)(av*17); }
                else if(fmt==14){ byte a0=d[o], a1=d[o+1]; ulong bits=0; for(int i=0;i<6;i++) bits |= ((ulong)d[o+2+i])<<(8*i);
                    int aidx=(int)((bits>>(3*(py*4+px)))&7);
                    if(aidx==0) al=a0; else if(aidx==1) al=a1;
                    else if(a0>a1) al=(byte)(((8-aidx)*a0+(aidx-1)*a1)/7);
                    else { if(aidx==6) al=0; else if(aidx==7) al=255; else al=(byte)(((6-aidx)*a0+(aidx-1)*a1)/5); } }
                else if(noAlphaBlack) al=0;
                int op=(y*w+x)*4; outb[op]=bb; outb[op+1]=g; outb[op+2]=r; outb[op+3]=al; // BGRA
            }
        }
        return outb;
    }
}
"@
function Convert-Tex([string]$path, [string]$outDir) {
    $d = [IO.File]::ReadAllBytes($path)
    if ([Text.Encoding]::ASCII.GetString($d, 0, 4) -ne "ZTEX") { return "skip(sig)" }
    $fmt = [BitConverter]::ToInt32($d, 8)
    $w = [BitConverter]::ToInt32($d, 12); $h = [BitConverter]::ToInt32($d, 16)
    $mips = [BitConverter]::ToInt32($d, 20)
    $hdr = 36
    if ($fmt -eq 9) { $hdr += 1024 }  # paleta P8
    # mipy od NAJMNIEJSZEGO do najwiekszego -> pomijamy wszystkie poza ostatnim
    $bpp = 0; $block = 0
    switch ($fmt) { 10 {$block=8} 12 {$block=16} 14 {$block=16} 0 {$bpp=4} 1 {$bpp=4} 2 {$bpp=4} 3 {$bpp=4} 4 {$bpp=3} 5 {$bpp=3} 6 {$bpp=2} 7 {$bpp=2} 8 {$bpp=2} 9 {$bpp=1} default { return "skip(fmt $fmt)" } }
    $off = $hdr
    for ($m = $mips - 1; $m -ge 1; $m--) {
        $mw = [Math]::Max(1, $w -shr $m); $mh = [Math]::Max(1, $h -shr $m)
        if ($block -gt 0) { $off += [Math]::Max(1, [int](($mw+3)/4)) * [Math]::Max(1, [int](($mh+3)/4)) * $block }
        else { $off += $mw * $mh * $bpp }
    }
    $size = if ($block -gt 0) { [Math]::Max(1,[int](($w+3)/4)) * [Math]::Max(1,[int](($h+3)/4)) * $block } else { $w * $h * $bpp }
    if ($off + $size -gt $d.Length) {
        # naglowki bywaja niestandardowe - najwiekszy mip i tak lezy na koncu
        $off = $d.Length - $size
        if ($off -lt $hdr) { return "skip(trunc)" }
    }
    $mip = New-Object byte[] ($size); [Array]::Copy($d, $off, $mip, 0, $size)

    $bgra = $null
    if ($block -gt 0) { $bgra = [DxtDec]::Decode($mip, $w, $h, $fmt) }
    else {
        $bgra = New-Object byte[] ($w*$h*4)
        for ($i=0; $i -lt $w*$h; $i++) {
            switch ($fmt) {
                0 { $bgra[$i*4]=$mip[$i*4+2]; $bgra[$i*4+1]=$mip[$i*4+1]; $bgra[$i*4+2]=$mip[$i*4]; $bgra[$i*4+3]=$mip[$i*4+3] }      # B8G8R8A8
                3 { $bgra[$i*4]=$mip[$i*4+3]; $bgra[$i*4+1]=$mip[$i*4+2]; $bgra[$i*4+2]=$mip[$i*4+1]; $bgra[$i*4+3]=$mip[$i*4] }      # A8R8G8B8
                8 { $v=[BitConverter]::ToUInt16($mip,$i*2); $bgra[$i*4]=[byte](($v -band 31)*255/31); $bgra[$i*4+1]=[byte]((($v -shr 5) -band 63)*255/63); $bgra[$i*4+2]=[byte]((($v -shr 11) -band 31)*255/31); $bgra[$i*4+3]=255 }
                default { $bgra[$i*4]=$mip[$i*$bpp]; $bgra[$i*4+1]=$mip[$i*$bpp+1]; $bgra[$i*4+2]=$mip[$i*$bpp+2]; $bgra[$i*4+3]=255 }
            }
        }
    }
    $bmp = New-Object Drawing.Bitmap($w, $h, [Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $rect = New-Object Drawing.Rectangle(0, 0, $w, $h)
    $bd = $bmp.LockBits($rect, [Drawing.Imaging.ImageLockMode]::WriteOnly, $bmp.PixelFormat)
    [Runtime.InteropServices.Marshal]::Copy($bgra, 0, $bd.Scan0, $bgra.Length)
    $bmp.UnlockBits($bd)
    $name = [IO.Path]::GetFileNameWithoutExtension($path) + ".png"
    $bmp.Save((Join-Path $outDir $name), [Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    return "ok ${w}x${h} fmt$fmt"
}

New-Item -ItemType Directory -Force $Out | Out-Null
$files = if (Test-Path $In -PathType Container) { Get-ChildItem $In -Filter *.TEX } else { ,(Get-Item $In) }
$done = 0
foreach ($f in $files) {
    try { $r = Convert-Tex $f.FullName $Out; if ($r -like "ok*") { $done++ } else { Write-Host "  $($f.Name): $r" } }
    catch { Write-Host "  $($f.Name): ERR $_" }
}
Write-Host "Skonwertowano: $done / $($files.Count) -> $Out"
