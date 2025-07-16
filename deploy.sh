#!/bin/bash

# Script per deploy automatico
echo "🚀 Deploying to GitHub..."

git add .
git commit -m "Update: $(date '+%Y-%m-%d %H:%M:%S')"
git push

echo "✅ Deploy completato! Cloudflare aggiornerà il sito in 1-2 minuti."