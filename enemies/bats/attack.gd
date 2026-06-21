extends NodeState

@export var character_body_2d : CharacterBody2D
@export var animated_sprite_2d : AnimatedSprite2D
@export var speed : float = 150
var player : CharacterBody2D

func on_process(delta : float):
	pass
	
func on_physics_process(delta : float):
	if player == null:
		return
		
	var direction = (player.global_position - character_body_2d.global_position).normalized()
	character_body_2d.velocity = direction * speed
	character_body_2d.move_and_slide()
	
	animated_sprite_2d.flip_h = direction.x < 0
	
	if character_body_2d.global_position.distance_to(player.global_position) > 300:
		transition.emit("Flying")
		
func enter():
	character_body_2d.velocity = Vector2.ZERO
	player = get_tree().get_nodes_in_group("Player")[0] as CharacterBody2D
	animated_sprite_2d.play("attack")
	
func exit():
	animated_sprite_2d.stop()


func _on_attack_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		transition.emit("Sleeping")
