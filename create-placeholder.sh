#!/bin/bash

# Crea un'immagine placeholder usando ImageMagick (se installato)
# Altrimenti copia una delle immagini esistenti come placeholder

if command -v convert &> /dev/null
then
    echo "Creando placeholder con ImageMagick..."
    convert -size 400x500 xc:'#2a2a2a' \
            -fill '#F64128' -gravity center -pointsize 48 \
            -annotate +0+0 'Foglia\nda\ncaricare' \
            images/placeholder.png
else
    echo "ImageMagick non trovato. Usando un'immagine esistente come placeholder..."
    # Copia un'immagine esistente e la rende più scura come placeholder
    cp images/Eugenio.png images/placeholder.png
fi

echo "✅ Placeholder creato in images/placeholder.png"