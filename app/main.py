from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from Private EC2 behind ALB!"

@app.route("/health")
def health():
    return "UP and running"

if __name__ == "__main__":
    # Required: App must listen on port 8080 for ALB target group
    app.run(host="0.0.0.0", port=8080)
