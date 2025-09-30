import flask
from flask import Flask, render_template_string

app = Flask(__name__)

@app.route('/')
def home():
    return render_template_string('''
    <html>
        <head><title>Flask Debug Demo</title></head>
        <body>
            <h1>Welcome to Flask Debug Demo</h1>
            <p>This is a simple Flask application running with debug mode enabled.</p>
            <p>Debug mode can leak sensitive information in production!</p>
        </body>
    </html>
    ''')

@app.route('/debug')
def debug_route():
    # This route might cause an error that would leak sensitive info in debug mode
    some_variable = "This is sensitive data that shouldn't be exposed"
    return f"Debug info: {some_variable}"

if __name__ == '__main__':
    # This is the problematic line that triggers the Semgrep rule
    app.run(debug=True, host='0.0.0.0', port=5000)
