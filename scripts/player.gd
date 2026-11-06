extends CharacterBody3D

@export var walk_speed: float = 3.2
@export var run_speed: float = 6.8
@export var ground_acceleration: float = 24.0
@export var ground_deceleration: float = 30.0
@export var air_acceleration: float = 12.0
@export var jump_velocity: float = 10.5
@export var lane_z: float = 0.0
@export var fall_limit: float = -8.0

var spawn_position: Vector3
@onready var character_visual: Node3D = $Visuals

func _ready() -> void:
	spawn_position = global_position
	character_visual.rotation.y = PI * 0.5

func _physics_process(delta: float) -> void:
	if global_position.y < fall_limit:
		global_position = spawn_position
		velocity = Vector3.ZERO
		return

	var direction := Input.get_axis("move_left", "move_right")
	if not is_zero_approx(direction):
		character_visual.rotation.y = signf(direction) * PI * 0.5
	var target_speed := run_speed if Input.is_action_pressed("run") else walk_speed
	var target_velocity := direction * target_speed
	var acceleration := air_acceleration
	if is_on_floor():
		acceleration = ground_deceleration if is_zero_approx(direction) else ground_acceleration
	velocity.x = move_toward(velocity.x, target_velocity, acceleration * delta)

	if not is_on_floor():
		velocity.y -= get_gravity().length() * delta
	elif Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity

	# Keep the character on the 2D gameplay plane.
	global_position.z = lane_z
	velocity.z = 0.0
	move_and_slide()
