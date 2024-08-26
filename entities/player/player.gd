extends CharacterBody3D
class_name Player

@onready var nav_agent_3d: NavigationAgent3D = $NavigationAgent3D


func _on_ready() -> void:
	WorldManager.register_player(self)

func _physics_process(delta: float) -> void:
	move_and_slide()
