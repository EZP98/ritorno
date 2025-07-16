#!/bin/bash

# Crea ambiente di sviluppo
echo "📁 Creando ambiente di sviluppo..."

# Crea cartella dev
mkdir -p dev

# Copia tutti i file necessari
cp index.html dev/
cp *.png dev/ 2>/dev/null || true

# Crea un semplice server Python per test locale
cat > dev/server.py << 'EOF'
import http.server
import socketserver
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))

PORT = 8000

Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"🌐 Server attivo su http://localhost:{PORT}")
    print("🛑 Premi Ctrl+C per fermare")
    httpd.serve_forever()
EOF

echo "✅ Ambiente di sviluppo creato in ./dev/"
echo ""
echo "Per avviare il server locale:"
echo "  cd dev && python3 server.py"
echo ""
echo "Poi apri: http://localhost:8000"