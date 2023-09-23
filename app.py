from flask import Flask, render_template, jsonify
from flask_cors import CORS
import json

app = Flask(__name__, static_folder='static', template_folder='templates')
CORS(app, origins="*", allow_headers=["Content-Type"])

def obtener_productos():
    with open('productos.json', 'r') as json_file:
        productos = json.load(json_file)
    return productos

@app.route('/')
def index():
    productos = obtener_productos()
    return render_template('index.html', productos=productos)

@app.route('/nuevo')
def mostrar_nuevo():
    with open('nuevo.json', 'r') as json_file:
        datos_nuevo = json.load(json_file)
    return render_template('nuevo.html', datos=datos_nuevo)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8181)