#!/bin/bash
set -e

apt update -y
apt install -y python3 python3-pip

# Create application directory
mkdir -p /home/ubuntu/app

# Write Python Flask app
cat <<'EOF' > /home/ubuntu/app/main.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def index():
    return "Hello from Private EC2 behind ALB!"

@app.route("/health")
def health():
    return "ok"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
EOF

pip3 install flask

# Start app using nohup (simple & assignment-friendly)
nohup python3 /home/ubuntu/app/main.py > /var/log/app.log 2>&1 &
