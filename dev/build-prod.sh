#!/bin/bash

echo "🔨 Preparando per la produzione..."

# Crea una copia temporanea dell'HTML
cp index.html index-prod.html

# Leggi il contenuto del CSS
CSS_CONTENT=$(cat style.css)

# Sostituisci il link CSS con il contenuto inline
sed -i '' '/<link rel="stylesheet" href="style.css">/d' index-prod.html
sed -i '' '/<link rel="shortcut icon".*>/a\
    <style>\
'"$CSS_CONTENT"'\
    </style>' index-prod.html

# Aggiorna i percorsi delle immagini (rimuovi "images/")
sed -i '' 's/images\///g' index-prod.html

echo "✅ File pronto: index-prod.html"
echo ""
echo "Prossimi passi:"
echo "1. Controlla index-prod.html"
echo "2. Se tutto ok, esegui:"
echo "   cp index-prod.html ../"
echo "   cp images/*.png ../"
echo "   cd .. && ./deploy.sh"