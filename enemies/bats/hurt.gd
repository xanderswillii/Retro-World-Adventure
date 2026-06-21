extends NodeState

@export var character_body_2d : CharacterBody2D
@export var animated_sprite_2d : AnimatedSprite2D
@export var hurt_time : float = 0.3

func on_process(delta : float):
	pass
	
func on_physics_process(delta : float):
	character_body_2d.move_and_slide()
	
func enter():
	animated_sprite_2d.play("hurt")
	get_tree().create_timer(hurt_time).timeout.connect(on_hurt_timeout)
	
func exit():
	animated_sprite_2d.stop()
	
func on_hurt_timeout():
	transition.emit("Flying")
	
	
