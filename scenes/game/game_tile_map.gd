class_name GameTileMap
extends TileMapLayer

signal piece_collided

class ControlledPiece extends RefCounted:
	var piece: TetrizPiece
	var position: Vector2i

	func _init(initial_piece: TetrizPiece, initial_position: Vector2i=Vector2i.ZERO):
		piece = initial_piece
		position = initial_position

var _controlled_piece: ControlledPiece

func next_tick() -> void:
	if _controlled_piece:
		_move_down()

func spawn_piece(new_piece: TetrizPiece) -> void:
	_controlled_piece = ControlledPiece.new(new_piece, _get_spawn_coords(new_piece.get_size()))
	_draw_piece(_controlled_piece)

func can_spawn(new_piece: TetrizPiece):
	var spawn_coords: Vector2i = _get_spawn_coords(new_piece.get_size())
	for cell: Vector2i in new_piece.cell_coords:
		var tile_data: TileData = get_cell_tile_data(spawn_coords + cell)
		if tile_data:
			var is_piece: bool = tile_data.get_custom_data("IsPiece")
			if is_piece:
				print("Piece at %s" % cell)
				return false
	return true

func _input(_event: InputEvent) -> void:
	# handle horizontal movement
	var horizontal_axis: float = Input.get_axis("move_left", "move_right")
	if horizontal_axis != 0:
		print(horizontal_axis)
	# downwards
	if Input.is_action_pressed("move_down"):
		_move_down()

func _move_down() -> void:
	if not _controlled_piece:
		return

	_clear_piece(_controlled_piece)
	_controlled_piece.position.y += 1
	_draw_piece(_controlled_piece)

	if not _can_move_again():
		_controlled_piece = null
		piece_collided.emit()

func _can_move_again() -> bool:
	for collision_coord: Vector2i in _controlled_piece.piece.collision_coords:
		var tile_data: TileData = get_cell_tile_data(_controlled_piece.position + collision_coord)
		if tile_data:
			var is_border: bool = tile_data.get_custom_data("IsBorder")
			var is_piece: bool = tile_data.get_custom_data("IsPiece")
			if is_border or is_piece:
				print("Border or piece at %s" % collision_coord)
				return false
	return true

func _clear_piece(controlled_piece: ControlledPiece) -> void:
	for cell: Vector2i in controlled_piece.piece.cell_coords:
		erase_cell(controlled_piece.position + cell)

func _draw_piece(controlled_piece: ControlledPiece) -> void:
	for cell: Vector2i in controlled_piece.piece.cell_coords:
		set_cell(controlled_piece.position + cell, 1, Vector2i(3, 0))

func _get_spawn_coords(piece_size: Vector2i) -> Vector2i:
	var used_rect: Rect2i = get_used_rect()
	return Vector2i(
		used_rect.position.x + floori(used_rect.size.x / 2.0) - ceili(piece_size.x / 2.0),
		used_rect.position.y + 1
	)
