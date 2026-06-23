extends CharacterBody2D

var enemy_death_effect = preload("res://enemies/enemy_death_effect.tscn")

@onready var animated_sprite_2d : AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine : Node = $StateMachine

@onready var damage_amount : int = 1
@onready var health_amount : int = 3


func _on_hurt_box_area_entered(area: Area2D) -> void:
	print("Hurtbox area entered")
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		health_amount -= node.damage_amount
		print("Bath health", health_amount)
		if health_amount <= 0:
			var enemy_death_effect_instance = enemy_death_effect.instantiate()
			enemy_death_effect_instance.global_position = global_position
			get_parent().add_child(enemy_death_effect_instance)
			queue_free()
		else:
			state_machine.transition_to("hurt")
