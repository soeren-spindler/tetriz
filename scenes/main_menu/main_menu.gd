class_name MainMenu
extends Node2D

signal new_game_selected

@onready var main_menu_screen: MainMenuScreen = %MainMenuScreen

func _ready():
	main_menu_screen.new_game_selected.connect(new_game_selected.emit)
