from flask import Flask, request, jsonify
from ai_agent import generate_response

app = Flask(__name__)

@app.route("/api/ask", methods=["POST"])
def ask_agent():
    data = request.get_json()
    question = data.get("question", "")
    if not question:
        return jsonify({"error": "Question is required"}), 400

    answer = generate_response(question)
    return jsonify({
        "channel": "NextGen CE",
        "question": question,
        "answer": answer
    })

@app.route("/", methods=["GET"])
def home():
    return "NextGen CE AI Agent API is running."

if __name__ == "__main__":
    app.run(debug=True)