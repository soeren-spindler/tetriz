class_name StartCountdown
extends Control

signal finished

@onready var timer: Timer = %Timer
@onready var countdown_label: Label = %CountdownLabel

func _ready():
	timer.timeout.connect(finished.emit)
	start()
	
func start():
	timer.start()
	
func _physics_process(_delta):
	var time: int = floori(timer.time_left)
	if time == 0:
		countdown_label.text = "Go!"
	else:
		countdown_label.text = "%d" % time
