class_name MainMenuScreen
extends MenuScreen

signal new_game_selected

func start_new_game():
	new_game_selected.emit()

func quit():
	get_tree().quit()
