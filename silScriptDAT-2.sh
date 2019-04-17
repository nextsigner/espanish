#!/bin/bash
ffmpeg -i "$1" -af silencedetect=noise=-20dB:d=0.5 -f null - 2>vol.txt
