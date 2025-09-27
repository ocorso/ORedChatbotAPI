# app.py
import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Hello from O Red Chatbot API!"

if __name__ == "__main__":
    # This block is for local testing only.
    # It won't be used when deployed to Cloud Run.
    app.run(debug=True, host="0.0.0.0", port=8080)
