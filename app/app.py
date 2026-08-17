from flask import Flask, jsonify
import os
import socket

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST", "postgres")
DB_PORT = int(os.getenv("DB_PORT", "5432"))

@app.get("/")
def index():
    return jsonify({
        "application": "k8s-cicd-demo",
        "status": "running"
    })

@app.get("/health")
def health():
    try:
        with socket.create_connection((DB_HOST, DB_PORT), timeout=2):
            return jsonify({
                "status": "healthy",
                "database": "reachable"
            }), 200
    except Exception as exc:
        return jsonify({
            "status": "unhealthy",
            "database": "unreachable",
            "error": str(exc)
        }), 503

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
