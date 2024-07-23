class_name SettingsSystem
extends Node

# C:\Users\Soeren\AppData\Roaming\Godot\app_userdata\Tetriz
const SETTINGS_FILE = "user://settings.cfg"

var _settings: ConfigFile

func _ready():
	load_settings()

func load_settings():
	_settings = ConfigFile.new()
	_settings.load(SETTINGS_FILE)
	
func save():
	_settings.save(SETTINGS_FILE)

func get_value(section: String, key: String, default_value: Variant=null) -> Variant:
	return _settings.get_value(section, key, default_value)

func set_value(section: String, key: String, value: Variant):
	_settings.set_value(section, key, value)
