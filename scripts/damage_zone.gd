extends Area2D
@onready var damage_amount : int = 1

@export var current_state: spike_state
enum spike_state {ACTIVE, ANIMATED}

func _process(delta):
	match current_state:
		spike_state.ACTIVE:
			active()
		spike_state.ANIMATED:
			active_animated()
			
func active():
	$anim.play("Active")
	
func active_animated():
	$anim.play("Active_animated")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		HealthManager.decrease_health(damage_amount)
