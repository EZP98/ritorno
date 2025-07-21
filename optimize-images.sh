#!/bin/bash

# Create optimized versions of sky.png
echo "Optimizing sky.png..."

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "ImageMagick is not installed. Install it with: brew install imagemagick"
    exit 1
fi

# Create backup
cp images/sky.png images/sky-original.png

# Optimize for web (resize to max 2000px width and compress)
convert images/sky-original.png -resize 2000x\> -quality 85 -strip images/sky.png

# Create mobile version (max 1200px width, higher compression)
convert images/sky-original.png -resize 1200x\> -quality 75 -strip images/sky-mobile.png

# Show file sizes
echo "Original size:"
ls -lh images/sky-original.png
echo "Optimized size:"
ls -lh images/sky.png
echo "Mobile size:"
ls -lh images/sky-mobile.png

echo "Done! You can now use sky-mobile.png for mobile devices"