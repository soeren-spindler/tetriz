class_name PieceSystem
extends Node

@export var pieces: Array[TetrizPiece]

func get_random_piece() -> TetrizPiece:
	return pieces.pick_random()
