import os, json, time, sqlite3, sys
from flask import (
     Flask, request, render_template,
     url_for, redirect, jsonify,
)

app = Flask(__name__)

# Default settings #
@app.errorhandler(404)
def go_default(error):
     return 'notmyproblem .!.', 404


### Real sh1t ###
@app.route('/')
def home():
     return render_template('index.html')

if __name__ == '__main__':
     app.run(port=10003)

#ned
