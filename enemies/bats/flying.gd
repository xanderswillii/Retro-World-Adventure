extends NodeState

@export var character_body_2d : CharacterBody2D
@export var animated_sprite_2d : AnimatedSprite2D
@export var patrol_points : Node
@export var speed : float = 100
var point_positions : Array[Vector2]
var current_point_position : int
var current_point : Vector2

func on_process(rdelta : float):
	pass
	
func on_physics_process(delta : float):
	if point_positions.size() == 0:
		return
	
	var direction = (current_point - character_body_2d.global_position).normalized()
	character_body_2d.velocity = direction * speed
	character_body_2d.move_and_slide()
	
	animated_sprite_2d.flip_h = direction.x < 0
	
	if character_body_2d.global_position.distance_to(current_point):
		current_point_position += 1
		if current_point_position >= point_positions.size():
			current_point_position = 0
			
func enter():
	if patrol_points != null:
		for point in patrol_points.get_children():
			point_positions.append(point.global_position)
		current_point = point_positions[current_point_position]
	animated_sprite_2d.play("flying")
	
func exit():
	animated_sprite_2d.stop()
	

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		transition.emit("Attack")
