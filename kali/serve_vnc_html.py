# serve_vnc_html.py
from http.server import SimpleHTTPRequestHandler, HTTPServer

class CustomHandler(SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Content-Type', 'text/html')
        super().end_headers()

    def do_GET(self):
        if self.path == '/':
            self.path = '/vnc.html'
        return super().do_GET()

PORT = 8081
Handler = CustomHandler

with HTTPServer(("", PORT), Handler) as httpd:
    print(f"Serving at http://localhost:{PORT}")
    httpd.serve_forever()
