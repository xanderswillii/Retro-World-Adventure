extends NodeState

@export var character_body_2d : CharacterBody2D
@export var animated_sprite_2d : AnimatedSprite2D

func on_process(delta  : float):
	pass
	
func on_physics_process(delta : float):
	pass
	
func enter():
	animated_sprite_2d.play("sleeping")

func exit():
	animated_sprite_2d.stop()
	


func _on_attack_area_body_entered(body: Node2D) -> void:
	print("Attack area entered: ", body.name)
	if body.is_in_group("Player"):
		print("Player detected, transition to attack!")
		transition.emit("Attack")
