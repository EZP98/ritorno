#!/bin/bash

echo "Compressing Ritorno.mov..."

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg is not installed. Install it with: brew install ffmpeg"
    exit 1
fi

# Compress to MP4 with good quality but smaller size
# Target: under 50MB for GitHub
ffmpeg -i Ritorno.mov -c:v libx264 -preset slow -crf 28 -c:a aac -b:a 128k -movflags +faststart Ritorno-compressed.mp4

# Show file sizes
echo "Original MOV size:"
ls -lh Ritorno.mov
echo "Compressed MP4 size:"
ls -lh Ritorno-compressed.mp4

echo "Done! Use Ritorno-compressed.mp4 for the website"