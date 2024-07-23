class_name TimeSystem
extends Node

var _elapsed_time: float = 0.0
var _is_running: bool = false

var elapsed_time: float:
	get:
		return _elapsed_time

func start() -> void:
	print("Start game time")
	_is_running = true

func stop() -> void:
	print("Stop game time")
	_is_running = false

func _physics_process(delta: float):
	if _is_running:
		_elapsed_time += delta
