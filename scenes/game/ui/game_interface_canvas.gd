class_name GameInterfaceCanvas
extends CanvasLayer

signal quit_to_menu_requested
signal play_again_requested
signal introduction_closed
signal countdown_finished

const _introduction_scene: PackedScene = preload ("res://scenes/game/ui/introduction_screen.tscn")
const _countdown_scene: PackedScene = preload ("res://scenes/game/ui/start_countdown.tscn")
const _game_over_scene: PackedScene = preload ("res://scenes/game/ui/game_over_screen.tscn")

var _introduction_screen: IntroductionScreen
var _countdown: StartCountdown
var _game_over_screen: GameOverScreen

func show_introduction() -> void:
	_introduction_screen = _introduction_scene.instantiate()
	_introduction_screen.closed.connect(_on_introduction_closed)
	add_child(_introduction_screen)

func start_countdown():
	_countdown = _countdown_scene.instantiate()
	_countdown.finished.connect(_on_countdown_finished)
	add_child(_countdown)

func show_game_over() -> void:
	_game_over_screen = _game_over_scene.instantiate()
	_game_over_screen.play_again_selected.connect(_on_game_over_play_again)
	_game_over_screen.quit_selected.connect(_on_game_over_quit)
	add_child(_game_over_screen)

func _on_game_over_play_again():
	_game_over_screen.queue_free()
	play_again_requested.emit()

func _on_game_over_quit():
	_game_over_screen.queue_free()
	quit_to_menu_requested.emit()

func _on_introduction_closed():
	_introduction_screen.queue_free()
	introduction_closed.emit()

func _on_countdown_finished():
	_countdown.queue_free()
	countdown_finished.emit()
