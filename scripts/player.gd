extends CharacterBody3D

@export var move_speed: float = 7.0
@export var ground_acceleration: float = 42.0
@export var air_acceleration: float = 18.0
@export var jump_velocity: float = 10.5
@export var lane_z: float = 0.0
@export var fall_limit: float = -8.0

var spawn_position: Vector3
@onready var character_visual: Node3D = $Visuals

func _ready() -> void:
	spawn_position = global_position

func _physics_process(delta: float) -> void:
	if global_position.y < fall_limit:
		global_position = spawn_position
		velocity = Vector3.ZERO
		return

	var direction := Input.get_axis("move_left", "move_right")
	if not is_zero_approx(direction):
		character_visual.scale.x = signf(direction)
	var acceleration := ground_acceleration if is_on_floor() else air_acceleration
	velocity.x = move_toward(velocity.x, direction * move_speed, acceleration * delta)

	if not is_on_floor():
		velocity.y -= get_gravity().length() * delta
	elif Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity

	# Keep the character on the 2D gameplay plane.
	global_position.z = lane_z
	velocity.z = 0.0
	move_and_slide()
