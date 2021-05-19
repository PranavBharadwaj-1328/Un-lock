from flask import Flask,render_template
import RPi.GPIO as GPIO
from time import sleep

app = Flask(__name__)
@app.route('/')
def  hello():
	return render_template('index.html')
@app.route('/lock')
def door_lock():
	GPIO.cleanup()
	GPIO.setwarnings(False)
	GPIO.setmode(GPIO.BOARD)
	servo = 7
	GPIO.setup(servo,GPIO.OUT)
	p = GPIO.PWM(servo,50)
	p.start(2.5)
	sleep(1)
	return render_template('lock.html')
@app.route('/unlock')
def door_unlock():
	GPIO.cleanup()
	GPIO.setwarnings(False)
	GPIO.setmode(GPIO.BOARD)
	servo = 7
	GPIO.setup(servo,GPIO.OUT)
	p = GPIO.PWM(servo,50)
	p.start(7.5)
	sleep(1)
	return render_template('unlock.html')
if __name__ == "__main__":
	app.run(host='0.0.0.0', port=80, debug=True)
