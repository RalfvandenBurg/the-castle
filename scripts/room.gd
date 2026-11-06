extends Node3D

const PLAYER_SCRIPT := preload("res://scripts/player.gd")
const HERO_VISUAL_SCENE := preload("res://scenes/hero_visual.tscn")

func _ready() -> void:
	_setup_controls()
	_add_light()
	_add_camera()
	_add_platform(Vector3(0.0, -0.5, 0.0), Vector3(18.0, 1.0, 3.0), Color("#5b536f"))
	_add_platform(Vector3(-4.2, 1.1, 0.0), Vector3(4.2, 0.45, 2.4), Color("#827596"))
	_add_platform(Vector3(3.8, 2.4, 0.0), Vector3(4.4, 0.45, 2.4), Color("#827596"))
	_add_platform(Vector3(7.0, 0.8, 0.0), Vector3(2.8, 0.45, 2.4), Color("#827596"))
	_add_pushable(Vector3(-1.6, 0.65, 0.0), Color("#d18a5b"))
	_add_pushable(Vector3(2.2, 0.65, 0.0), Color("#d18a5b"))
	_add_player(Vector3(-7.0, 0.35, 0.0))

func _setup_controls() -> void:
	for action in ["move_left", "move_right", "jump"]:
		if not InputMap.has_action(action):
			InputMap.add_action(action)
		InputMap.action_erase_events(action)

	_bind_key("move_left", KEY_A)
	_bind_key("move_left", KEY_LEFT)
	_bind_key("move_right", KEY_D)
	_bind_key("move_right", KEY_RIGHT)
	_bind_key("jump", KEY_SPACE)

func _bind_key(action: StringName, key: int) -> void:
	var event := InputEventKey.new()
	event.physical_keycode = key
	InputMap.action_add_event(action, event)

func _add_light() -> void:
	var light := DirectionalLight3D.new()
	light.rotation_degrees = Vector3(-35.0, -25.0, 0.0)
	light.light_energy = 1.2
	add_child(light)

func _add_camera() -> void:
	var camera := Camera3D.new()
	camera.position = Vector3(0.0, 5.0, 18.0)
	camera.fov = 48.0
	add_child(camera)
	camera.look_at(Vector3(0.0, 2.1, 0.0), Vector3.UP)
	camera.current = true

func _add_platform(at: Vector3, size: Vector3, color: Color) -> void:
	var body := StaticBody3D.new()
	body.position = at
	add_child(body)

	var shape := BoxShape3D.new()
	shape.size = size
	var collision := CollisionShape3D.new()
	collision.shape = shape
	body.add_child(collision)

	var mesh := BoxMesh.new()
	mesh.size = size
	var visual := MeshInstance3D.new()
	visual.mesh = mesh
	visual.material_override = _material(color)
	body.add_child(visual)

func _add_pushable(at: Vector3, color: Color) -> void:
	var body := RigidBody3D.new()
	body.position = at
	body.mass = 3.0
	body.linear_damp = 1.5
	body.angular_damp = 8.0
	body.axis_lock_linear_z = true
	body.axis_lock_angular_x = true
	body.axis_lock_angular_y = true
	body.axis_lock_angular_z = true
	add_child(body)

	var shape := BoxShape3D.new()
	shape.size = Vector3(1.1, 1.1, 1.4)
	var collision := CollisionShape3D.new()
	collision.shape = shape
	body.add_child(collision)

	var mesh := BoxMesh.new()
	mesh.size = shape.size
	var visual := MeshInstance3D.new()
	visual.mesh = mesh
	visual.material_override = _material(color)
	body.add_child(visual)

func _add_player(at: Vector3) -> void:
	var player := CharacterBody3D.new()
	player.name = "Player"
	player.position = at
	player.script = PLAYER_SCRIPT

	var capsule := CapsuleShape3D.new()
	capsule.radius = 0.38
	capsule.height = 2.5
	var collision := CollisionShape3D.new()
	collision.shape = capsule
	collision.position.y = 1.25
	player.add_child(collision)

	var visuals := HERO_VISUAL_SCENE.instantiate()
	visuals.name = "Visuals"
	player.add_child(visuals)
	add_child(player)

func _material(color: Color) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	material.roughness = 0.85
	return material
