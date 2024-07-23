class_name PiecePreview
extends TileMapLayer

func set_piece(new_piece: TetrizPiece):
	clear()
	var size: Vector2i = new_piece.get_size()
	_draw_piece(Vector2i(-ceili(size.x / 2.0), -ceili(size.y / 2.0)), new_piece)
	
func _draw_piece(at_position: Vector2i, piece: TetrizPiece):
	for cell in piece.cell_coords:
		set_cell(at_position + cell, 0, Vector2i(3, 0))
