extends Node

var max_health : int = 3
var current_health : int 
var is_dead : bool = false
signal on_health_changed

func _ready():
	if current_health == 0:
		current_health = max_health
	
func decrease_health(health_amount : int):
	current_health -= health_amount
	print("current health after hit:", current_health)
	if current_health <= 0:
		current_health = 0
		is_dead = true
		on_health_changed.emit(current_health)
		await get_tree().create_timer(1.0).timeout
		is_dead = false
		current_health = max_health
		get_tree().reload_current_scene()
		return
	
	if current_health < 0:
		current_health = 0

	print("decrease_health called")
	on_health_changed.emit(current_health)

func increase_health(health_amount : int ):
	current_health += health_amount
	
	if current_health > max_health:
		current_health = max_health
 
	print("increase_health called")
	on_health_changed.emit(current_health)
