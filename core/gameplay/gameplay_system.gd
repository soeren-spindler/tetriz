class_name GameplaySystem
extends Node

@export_category("Gameplay")
@export var tick_speed_seconds: float = 1.0

@export_category("References")
@export var game_interface_canvas: GameInterfaceCanvas
@export var game_sidebar: GameSidebar
@export var time_system: TimeSystem
@export var piece_system: PieceSystem
@export var game_tile_map: GameTileMap

var _next_piece: TetrizPiece
var _is_running: bool = false
var _tick_interval: float = 0.0

func _ready():
	game_interface_canvas.introduction_closed.connect(game_interface_canvas.start_countdown)
	game_interface_canvas.countdown_finished.connect(_start_game)

	game_tile_map.piece_collided.connect(_spawn_next_piece)

func _enter_tree():
	await game_sidebar.ready
	update_next_piece()

	await game_interface_canvas.ready
	if Settings.get_value("gameplay", "show_introduction", true):
		game_interface_canvas.show_introduction()
	else:
		game_interface_canvas.start_countdown()

func update_next_piece():
	_next_piece = piece_system.get_random_piece()
	game_sidebar.set_next_piece(_next_piece)

func is_game_running() -> bool:
	return _is_running

func _physics_process(delta: float):
	if _is_running:
		_tick_interval += delta
		if _tick_interval >= tick_speed_seconds:
			_next_tick()
			_tick_interval -= tick_speed_seconds

func _start_game():
	_is_running = true
	time_system.start()
	_spawn_next_piece()

func _next_tick():
	game_tile_map.next_tick()

func _spawn_next_piece() -> void:
	if game_tile_map.can_spawn(_next_piece):
		game_tile_map.spawn_piece(_next_piece)
		update_next_piece()
	else:
		_game_over()

func _game_over() -> void:
	print("Game Over.")
	_is_running = false
	time_system.stop()
	game_interface_canvas.show_game_over()
