extends Node

const game_scene: PackedScene = preload ("res://scenes/game/game.tscn")
const main_menu_scene: PackedScene = preload ("res://scenes/main_menu/main_menu.tscn")

var _main_menu: MainMenu
var _game: Game

func _ready():
	_show_main_menu()

func _on_main_menu_start_game():
	_main_menu.queue_free()
	_start_new_game()

func _on_game_quit_to_menu():
	_game.queue_free()
	_show_main_menu()

func _on_game_restart():
	_game.queue_free()
	_start_new_game()
	
func _show_main_menu():
	_main_menu = main_menu_scene.instantiate()
	_main_menu.new_game_selected.connect(_on_main_menu_start_game)
	add_child(_main_menu)
	
func _start_new_game():
	_game = game_scene.instantiate()
	_game.quit_to_menu_requested.connect(_on_game_quit_to_menu)
	_game.restart_requested.connect(_on_game_restart)
	add_child(_game)
