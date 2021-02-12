from flask import Flask
app = Flask(__name__)

import time


@app.route('/<int:size_mb>/<int:sleep_ms>', methods=["POST", "GET"])
def hello(size_mb, sleep_ms):
    print("sleeping", sleep_ms)
    time.sleep(sleep_ms/1000.)
    print("done sleeping, sending", size_mb)
    return "0"*int(size_mb*1024*1024)

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5022)

