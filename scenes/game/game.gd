class_name Game
extends Node2D

signal quit_to_menu_requested
signal restart_requested

@onready var game_interface_canvas: GameInterfaceCanvas = %GameInterfaceCanvas

func _ready():
	game_interface_canvas.quit_to_menu_requested.connect(quit_to_menu_requested.emit)
	game_interface_canvas.play_again_requested.connect(restart_requested.emit)
