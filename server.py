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
