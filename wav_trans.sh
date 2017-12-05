#!/bin/sh

path="."

if [ -e /etc/issue ]; then
  for f in ${path}/m4a/*.m4a; do
    avconv -i ${f} ${path}/unformatted_wav/`basename ${f} .m4a`.wav;
  done
  for f in ${path}/unformatted_wav/*.wav; do
    sox ${path}/unformatted_wav/`basename ${f} .wav`.wav -c 1 -r 16000 -b 16 ${path}/wav/`basename ${f} .wav`.wav
  done
else
  for f in ${path}/m4a/*.m4a; do
    afconvert -f WAVE -d LEI16 ${f} ${path}/unformatted_wav/`basename ${f} .m4a`.wav;
  done
  for f in ${path}/unformatted_wav/*.wav; do
    sox ${path}/unformatted_wav/`basename ${f} .wav`.wav -c 1 -r 16000 -b 16 ${path}/wav/`basename ${f} .wav`.wav
  done
fi
