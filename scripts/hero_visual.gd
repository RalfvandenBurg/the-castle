@tool
extends Node3D

func _ready() -> void:
	_build_model()

func _build_model() -> void:
	var tunic := Color("#267b50")
	var tunic_light := Color("#42a467")
	var skin := Color("#f0bd86")
	var hair := Color("#d9a849")
	var leather := Color("#613d32")
	var gold := Color("#f2c45d")
	var steel := Color("#d8e4e8")
	var shield_blue := Color("#367a9b")

	# Boots and legs give the adventurer a readable low-poly silhouette.
	_add_box(Vector3(0.27, 0.20, 0.40), Vector3(-0.17, 0.13, 0.03), leather)
	_add_box(Vector3(0.27, 0.20, 0.40), Vector3(0.17, 0.13, 0.03), leather)
	_add_capsule(0.105, 0.46, Vector3(-0.17, 0.43, 0.0), Color("#e4c68f"))
	_add_capsule(0.105, 0.46, Vector3(0.17, 0.43, 0.0), Color("#e4c68f"))

	# Tapered tunic, shoulder mantle, belt, and buckle.
	_add_cylinder(0.34, 0.22, 0.48, Vector3(0.0, 0.79, 0.0), tunic)
	_add_box(Vector3(0.55, 0.59, 0.34), Vector3(0.0, 1.13, 0.0), tunic)
	_add_box(Vector3(0.57, 0.13, 0.37), Vector3(0.0, 0.83, 0.0), tunic_light)
	_add_box(Vector3(0.53, 0.10, 0.04), Vector3(0.0, 0.94, 0.20), leather)
	_add_box(Vector3(0.12, 0.11, 0.04), Vector3(0.0, 0.94, 0.23), gold)

	# The face looks toward the side-on camera at positive Z.
	_add_capsule(0.115, 0.48, Vector3(-0.34, 1.22, 0.0), tunic_light, Vector3(0.0, 0.0, -14.0))
	_add_capsule(0.115, 0.48, Vector3(0.34, 1.22, 0.0), tunic_light, Vector3(0.0, 0.0, 14.0))
	_add_sphere(Vector3(0.0, 1.49, 0.0), Vector3(0.22, 0.19, 0.20), skin)
	_add_sphere(Vector3(0.0, 1.76, 0.0), Vector3(0.28, 0.33, 0.25), skin)
	_add_sphere(Vector3(-0.27, 1.75, 0.0), Vector3(0.07, 0.10, 0.10), skin)
	_add_sphere(Vector3(0.27, 1.75, 0.0), Vector3(0.07, 0.10, 0.10), skin)
	_add_sphere(Vector3(-0.095, 1.78, 0.222), Vector3(0.035, 0.045, 0.025), Color("#243542"))
	_add_sphere(Vector3(0.095, 1.78, 0.222), Vector3(0.035, 0.045, 0.025), Color("#243542"))
	_add_sphere(Vector3(0.0, 1.69, 0.24), Vector3(0.055, 0.05, 0.05), skin)

	# Golden hair peeks out beneath a soft green pointed cap.
	_add_sphere(Vector3(0.0, 1.96, -0.02), Vector3(0.29, 0.16, 0.27), hair)
	_add_cylinder(0.30, 0.30, 0.08, Vector3(0.0, 2.02, 0.0), tunic)
	_add_cone(0.25, 0.54, Vector3(-0.09, 2.25, 0.0), tunic, Vector3(0.0, 0.0, -23.0))
	_add_sphere(Vector3(-0.19, 1.93, 0.07), Vector3(0.12, 0.07, 0.10), hair)

	# Small blue shield and steel sword complete the original adventurer design.
	_add_box(Vector3(0.34, 0.43, 0.10), Vector3(-0.45, 1.08, 0.17), shield_blue, Vector3(0.0, 0.0, -8.0))
	_add_box(Vector3(0.23, 0.05, 0.035), Vector3(-0.45, 1.08, 0.23), gold)
	_add_box(Vector3(0.05, 0.25, 0.035), Vector3(-0.45, 1.08, 0.23), gold)
	_add_box(Vector3(0.09, 0.38, 0.07), Vector3(0.47, 0.99, 0.0), leather, Vector3(0.0, 0.0, -28.0))
	_add_box(Vector3(0.12, 0.07, 0.09), Vector3(0.57, 1.13, 0.0), gold, Vector3(0.0, 0.0, -28.0))
	_add_box(Vector3(0.10, 0.48, 0.055), Vector3(0.70, 1.37, 0.0), steel, Vector3(0.0, 0.0, -28.0))
	_add_sphere(Vector3(0.34, 0.96, 0.0), Vector3(0.105, 0.105, 0.105), skin)

func _add_box(size: Vector3, at: Vector3, color: Color, rotation_degrees: Vector3 = Vector3.ZERO) -> void:
	var mesh := BoxMesh.new()
	mesh.size = size
	_add_mesh(mesh, at, color, rotation_degrees)

func _add_capsule(radius: float, height: float, at: Vector3, color: Color, rotation_degrees: Vector3 = Vector3.ZERO) -> void:
	var mesh := CapsuleMesh.new()
	mesh.radius = radius
	mesh.height = height
	_add_mesh(mesh, at, color, rotation_degrees)

func _add_sphere(at: Vector3, size: Vector3, color: Color) -> void:
	var mesh := SphereMesh.new()
	mesh.radius = 0.5
	mesh.height = 1.0
	_add_mesh(mesh, at, color, Vector3.ZERO, size)

func _add_cylinder(top_radius: float, bottom_radius: float, height: float, at: Vector3, color: Color) -> void:
	var mesh := CylinderMesh.new()
	mesh.top_radius = top_radius
	mesh.bottom_radius = bottom_radius
	mesh.height = height
	_add_mesh(mesh, at, color)

func _add_cone(radius: float, height: float, at: Vector3, color: Color, rotation_degrees: Vector3) -> void:
	var mesh := CylinderMesh.new()
	mesh.top_radius = 0.0
	mesh.bottom_radius = radius
	mesh.height = height
	_add_mesh(mesh, at, color, rotation_degrees)

func _add_mesh(mesh: Mesh, at: Vector3, color: Color, rotation_degrees: Vector3 = Vector3.ZERO, mesh_scale: Vector3 = Vector3.ONE) -> void:
	var visual := MeshInstance3D.new()
	visual.mesh = mesh
	visual.position = at
	visual.rotation_degrees = rotation_degrees
	visual.scale = mesh_scale
	visual.material_override = _material(color)
	add_child(visual)

func _material(color: Color) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	material.roughness = 0.85
	return material
