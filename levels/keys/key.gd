extends Node2D

@export var key_id : String
@onready var key_sound : AudioStreamPlayer2D = $KeySound


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		InventoryManager.add_to_inventory("key1", key_id)
		hide()
		key_sound.play()
		await key_sound.finished
		queue_free()
