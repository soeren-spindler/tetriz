class_name GameOverScreen
extends Control

signal play_again_selected
signal quit_selected

func play_again() -> void:
	play_again_selected.emit()
	
func quit_to_menu() -> void:
	quit_selected.emit()
