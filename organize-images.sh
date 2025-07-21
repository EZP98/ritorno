#!/bin/bash

# Crea cartella images
mkdir -p images

# Sposta tutte le immagini PNG
mv *.png images/ 2>/dev/null || true

echo "✅ Immagini spostate nella cartella images/"
ls -la images/