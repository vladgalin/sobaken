from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def hello():
    message = os.environ.get("WELCOME_MESSAGE", "По умолчанию: Привет, брат!")
    return f"{message} 🚀"
@app.route("/secret")
def show_secret():
    secret = os.environ.get("API_KEY", "Нет секрета 🫣")
    return f"🔐 API_KEY: {secret}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
