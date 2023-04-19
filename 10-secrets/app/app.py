import os
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def hello():
	return render_template('index.html', color = getColor(), content=getContent())

def getColor():
	return os.environ['APP_COLOR']

def getContent():
	return os.environ.get('APP_CONTENT')

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=80)