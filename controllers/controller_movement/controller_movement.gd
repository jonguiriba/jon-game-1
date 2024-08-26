extends Node

var direction = Vector3.ZERO

# How fast the player moves in meters per second.
@export var speed = 1
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO
@onready var character_body_host : CharacterBody3D = get_parent()

func _unhandled_input(event: InputEvent) -> void:
	var input_dir = Input.get_vector("left","right","up","down")
		
func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left","right","up","down")
	direction = Vector3(input_dir.x,0,input_dir.y).normalized()

	# Ground Velocity
	if direction:
		character_body_host.velocity.x = direction.x * speed
		character_body_host.velocity.z = direction.z * speed
	else:
		character_body_host.velocity.x = move_toward(character_body_host.velocity.x , 0, speed)
		character_body_host.velocity.z = move_toward(character_body_host.velocity.z , 0, speed)

	# Moving the Character
	character_body_host.move_and_slide()
