#!/bin/bash
ffmpeg -i "$1" -af silencedetect=noise=-10dB:d=0.5 -f null - 2>$2
