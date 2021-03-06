#!/usr/bin/env python

import rospy
from pid_controller import PID
from nodes.msg import MotorCmd
import RPi.GPIO as GPIO

# PID constants and controllers
K_P = 0.01
K_I = 0
K_D = 0
pid = None

# PWM channels to motors
pwm_A1 = None
pwm_A2 = None
pwm_B1 = None
pwm_B2 = None


"""
General drive function
speed: int (0 to 100)
veer: int (50 is straight, towards 0 veers left, towards 100 veers right)
"""
def drive(speed, veer):
	global pwm_A1
	global pwm_A2
	global pwm_B1
	global pwm_B2	
	
	# set the speed of both side wheels, accounting for the veer
	left_speed = min(speed, speed*veer/50)
	right_speed = min(speed, (100-veer)*speed/50)

	# write to the motors
	pwm_A1.ChangeDutyCycle(left_speed)
	pwm_A2.ChangeDutyCycle(0)
	pwm_B1.ChangeDutyCycle(right_speed)
	pwm_B2.ChangeDutyCycle(0)
		

"""
Callback function to handle all incoming motor commands
cmd: MotorCmd
"""
def handle_motor_cmd(cmd):
	global pid

	speed = cmd.speed
	error = cmd.error
	
	# calculate the next veer value and put it into the driver
	offset = pid.next(error)
	drive(speed, offset)


"""
Main function
"""
def main():
	global pid
	global pwm_A1
	global pwm_A2
	global pwm_B1
	global pwm_B2	

	# setup GPIO pins and motors
	FREQ = 100
	A1_PIN = 13
	A2_PIN = 19
	B1_PIN = 12
	B2_PIN = 18

	GPIO.setmode(GPIO.BCM)
	GPIO.setwarnings(False)

	GPIO.setup(A1_PIN, GPIO.OUT)
	GPIO.setup(A2_PIN, GPIO.OUT)
	GPIO.setup(B1_PIN, GPIO.OUT)
	GPIO.setup(B2_PIN, GPIO.OUT)

	pwm_A1 = GPIO.PWM(A1_PIN, FREQ)
	pwm_A2 = GPIO.PWM(A2_PIN, FREQ)
	pwm_B1 = GPIO.PWM(B1_PIN, FREQ)
	pwm_B2 = GPIO.PWM(B2_PIN, FREQ)

	pwm_A1.start(0)
	pwm_A2.start(0)
	pwm_B1.start(0)
	pwm_B2.start(0)

	# initialize PID controller
	pid = PID(0, 100, K_P, K_I, K_D)
	
	# initialize ROS node and listen for commands
	rospy.init_node("motor_ctrl")
	rospy.Subscriber("motor_cmd", MotorCmd, handle_motor_cmd)
	rospy.spin()
	

if __name__ == "__main__":
	main()
