extends Node

@onready var character_body_host : CharacterBody3D = get_parent()
@onready var nav_agent_3d : NavigationAgent3D = get_parent().get_node("NavigationAgent3D")
var target_position
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		target_position = WorldManager.players[0].position
		nav_agent_3d.set_target_position(target_position)
		
func _physics_process(delta: float) -> void:
	if target_position:
		var destination = nav_agent_3d.get_next_path_position()
		var local_destination = destination - character_body_host.global_position
		var direction = local_destination.normalized()
		var speed = 5.0
		character_body_host.velocity = direction * speed
		character_body_host.look_at(target_position,Vector3(0,0,0),true)
