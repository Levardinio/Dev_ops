# Flask Hello World App

A simple Flask application that serves a "Hello, World!" message.

## Setup

1. Create a virtual environment:
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Run the application:
   ```bash
   python app.py
   ```

The application will be available at `http://localhost:5000`

## Endpoints

- `/` - Returns a Hello World message
- `/health` - Health check endpoint

## Production Deployment

For production deployment, use gunicorn:
```bash
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```
