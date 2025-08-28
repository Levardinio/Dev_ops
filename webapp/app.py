from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return '<h1>Hello, World!</h1><p>This is a simple Flask application.</p>'

@app.route('/health')
def health_check():
    return {'status': 'healthy', 'message': 'Application is running'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
