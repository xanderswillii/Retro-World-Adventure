extends Node

var scene_transition_screen = preload("res://ui/screen_transition/scene_transition_screen.tscn")

var scenes : Dictionary = { "testlevel": "res://levels/test_levels/test_level.tscn",
							"level1": "res://levels/level_1.tscn",
							"level2": "res://levels/level_2.tscn",
							"level3": "res://levels/level_3.tscn",
							"level4": "res://levels/level_4.tscn",
							"level5": "res://levels/level_5.tscn",
							"level6": "res://mevels/level_6.tscn" }

func _transition_to_scene(level : String):
	var scene_path : String = scenes.get(level)
	
	if scene_path != null:
		var scene_transition_screen_instance = scene_transition_screen.instantiate()
		get_tree().get_root().add_child(scene_transition_screen_instance)
		await get_tree().create_timer(4.0).timeout
		get_tree().change_scene_to_file(scene_path)
		scene_transition_screen_instance.queue_free()
