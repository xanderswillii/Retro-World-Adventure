extends CanvasLayer

@onready var window_mode_option_button: OptionButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/WindowModeOptionButton
@onready var resolution_option_button: OptionButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/ResolutionOptionButton

var window_modes : Dictionary = {"Fullscreen" : DisplayServer.WINDOW_MODE_FULLSCREEN,
									"Window" : DisplayServer.WINDOW_MODE_WINDOWED, 
									 "Window Maximized" : DisplayServer.WINDOW_MODE_MAXIMIZED }

var resolutions : Dictionary ={"320x180" : Vector2i(230, 180),
							  "480x270" : Vector2i(480, 270),
							  "640x360" : Vector2i(640, 360),
							  "854x480" : Vector2i(640, 360),
							  "1280x720"  : Vector2i(1280, 720)}

func _ready():
	for window_mode in window_modes:
		window_mode_option_button.add_item(window_mode)
		
	for resolution in resolutions:
		resolution_option_button.add_item(resolution)


func _on_window_mode_option_button_item_selected(index: int) -> void:
	var window_mode = window_modes.get(window_mode_option_button.get_item_text(index))
	print("window mode", window_mode)

func _on_resolution_option_button_item_selected(index: int) -> void:
	var resolution = resolutions.get(resolution_option_button.get_item_text(index)) as Vector2i
	print("resolution", resolution)

func _on_main_menu_button_pressed() -> void:
	queue_free()
