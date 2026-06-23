extends NodeState

@export var character_body_2d: CharacterBody2D
@export var animated_sprite_2d : AnimatedSprite2D

func on_process(delta :float):
	pass
	
func on_physics_process(delta : float):
	pass
	
func enter():
	print("Death state entered!")
	animated_sprite_2d.play("death")
	await animated_sprite_2d.animation_finished
	character_body_2d.queue_free()
	
func exit():
	pass
