class_name MenuScreen
extends Control

signal closed

func close() -> void:
	closed.emit()
