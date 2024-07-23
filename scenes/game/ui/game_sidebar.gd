class_name GameSidebar
extends PanelContainer

@export var time_system: TimeSystem
@export var gameplay_system: GameplaySystem

@onready var time_label: Label = %TimeLabel
@onready var piece_preview: PiecePreview = %PiecePreview

func _ready():
	update_time_label()

func update_time_label():
	var total_sec: int = floori(time_system.elapsed_time)
	time_label.text = "%02d:%02d" % [floori(total_sec / 60.0), total_sec % 60]

func set_next_piece(next_piece: TetrizPiece):
	piece_preview.set_piece(next_piece)

func _process(_delta):
	if time_system._is_running:
		update_time_label()
