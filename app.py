from flask import Flask
app = Flask(__name__)

import time


@app.route('/<float:size_mb>/<float:sleep_s>', methods=["POST", "GET"])
def hello(size_mb, sleep_s):
    print("sleeping", sleep_s)
    time.sleep(sleep_s)
    print("done sleeping, sending", size_mb)
    return "0"*int(size_mb*1024*1024)

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5022)

