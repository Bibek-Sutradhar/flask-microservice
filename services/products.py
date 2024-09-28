import requests
import os
from flask import Flask, jsonify
app = Flask(__name__)
port = int(os.environ.get('PORT', 5010))
BASE_URL = "https://dummyjson.com"
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = True

@app.route("/")
def home():
    return "Hello from Flask microservice"
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=port)

@app.route("/products", methods=['GET'])
def getProducts():
    response = requests.get(f"{BASE_URL}/products")
    if response.status_code != 200:
        return jsonify({'error': response.json()['message']}), response.status_code
    products=[]
    for product in response.json()['products']:
        product_data = {
            'id': product['id'],
            'title': product['title'],
            'description': product['description'],
            'category': product['category'],
            'price': product['price']
        }
        products.append(product_data)
    return jsonify({'data': products}), 200 if products else 204