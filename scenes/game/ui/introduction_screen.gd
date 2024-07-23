class_name IntroductionScreen
extends MenuScreen

@onready var dont_show_again_check_box: CheckBox = %DontShowAgainCheckBox

func start_game():
	if dont_show_again_check_box.button_pressed:
		Settings.set_value("gameplay", "show_introduction", false)
		Settings.save()
	
	close()
