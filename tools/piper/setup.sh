#!/bin/sh
# Piper TTS setup - pobiera binarke i polskie glosy (uruchom w Git Bash z tools/piper/)
# Glosy: darkman (Mistrz/niski), mc_speech (Bezi-zastepczy), gosia (Adela/zenski)
set -e
BASE="https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pl/pl_PL"
curl -sL -o piper.zip "https://github.com/rhasspy/piper/releases/download/2023.11.14-2/piper_windows_amd64.zip"
unzip -oq piper.zip && rm piper.zip
for v in darkman mc_speech gosia; do
  curl -sL -o "pl_PL-$v-medium.onnx" "$BASE/$v/medium/pl_PL-$v-medium.onnx"
  curl -sL -o "pl_PL-$v-medium.onnx.json" "$BASE/$v/medium/pl_PL-$v-medium.onnx.json"
done
echo "Piper gotowy."
