extends Node

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_falling = false
@onready var character_body_host : CharacterBody3D = get_parent()

		
func _physics_process(delta: float) -> void:
		if not character_body_host.is_on_floor():
			is_falling = true
			character_body_host.velocity.y += character_body_host.velocity.y - (gravity * delta)
			
		if character_body_host.is_on_floor():
			is_falling = false
			
