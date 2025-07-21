#!/bin/bash

# Create PNG favicon from SVG using ImageMagick
if command -v convert &> /dev/null; then
    # Create different sizes for better compatibility
    convert -background none -resize 16x16 favicon.svg favicon-16x16.png
    convert -background none -resize 32x32 favicon.svg favicon-32x32.png
    convert -background none -resize 180x180 favicon.svg apple-touch-icon.png
    convert -background none -resize 192x192 favicon.svg favicon-192x192.png
    echo "PNG favicons created successfully!"
else
    echo "ImageMagick not installed. Creating a simple red circle PNG manually..."
    # If ImageMagick is not available, we'll need to use the SVG directly
fi