#!/bin/sh
# Generacja jednej kwestii: ./gen.sh <glos> <plik_wyjsciowy.wav> <length_scale> "tekst"
# Glosy: darkman | mc_speech | gosia
# length_scale: 1.0 normalnie, wiecej = wolniej (boss ~1.45), mniej = szybciej (krzyk ~0.9)
cd "$(dirname "$0")"
echo "$4" | ./piper/piper.exe -m "pl_PL-$1-medium.onnx" -f "$2" --length_scale "$3"
