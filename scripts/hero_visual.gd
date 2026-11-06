@tool
extends Node3D

const JOINT_AXIS := Vector3(1.0, 0.0, 0.0)

var skeleton: Skeleton3D
var _bone_indices: Dictionary = {}
var _attachments: Dictionary = {}

func _ready() -> void:
	_build_skeleton()
	_build_model()

func _process(_delta: float) -> void:
	if not is_instance_valid(skeleton):
		return

	var actor := get_parent() as CharacterBody3D
	var movement_weight := 0.0
	var run_weight := 0.0
	if actor != null:
		movement_weight = clampf(absf(actor.velocity.x) / 2.8, 0.0, 1.0)
		run_weight = clampf((absf(actor.velocity.x) - 3.0) / 3.8, 0.0, 1.0)

	var cadence := lerpf(7.0, 11.5, run_weight)
	var stride := sin(float(Time.get_ticks_msec()) * 0.001 * cadence) * lerpf(0.28, 0.58, run_weight) * movement_weight
	_set_bone_angle("left_leg", stride)
	_set_bone_angle("right_leg", -stride)
	_set_bone_angle("left_arm", -stride * lerpf(0.72, 0.95, run_weight))
	_set_bone_angle("right_arm", stride * lerpf(0.72, 0.95, run_weight))
	_set_bone_angle("spine", -0.05 * run_weight * movement_weight)

func _build_skeleton() -> void:
	skeleton = Skeleton3D.new()
	skeleton.name = "Skeleton3D"
	add_child(skeleton)

	_add_bone("root", "", Vector3.ZERO)
	_add_bone("pelvis", "root", Vector3(0.0, 0.79, 0.0))
	_add_bone("spine", "pelvis", Vector3(0.0, 0.36, 0.0))
	_add_bone("neck", "spine", Vector3(0.0, 0.34, 0.0))
	_add_bone("head", "neck", Vector3(0.0, 0.27, 0.0))
	_add_bone("left_arm", "spine", Vector3(-0.34, 0.07, 0.0))
	_add_bone("left_hand", "left_arm", Vector3(-0.02, -0.26, 0.14))
	_add_bone("right_arm", "spine", Vector3(0.34, 0.07, 0.0))
	_add_bone("right_hand", "right_arm", Vector3(0.02, -0.26, 0.14))
	_add_bone("left_leg", "pelvis", Vector3(-0.17, -0.36, 0.0))
	_add_bone("left_foot", "left_leg", Vector3(0.0, -0.30, 0.03))
	_add_bone("right_leg", "pelvis", Vector3(0.17, -0.36, 0.0))
	_add_bone("right_foot", "right_leg", Vector3(0.0, -0.30, 0.03))

	skeleton.reset_bone_poses()
	skeleton.force_update_all_bone_transforms()
	for bone_name in _bone_indices:
		var attachment := BoneAttachment3D.new()
		attachment.name = "Attach_" + bone_name
		skeleton.add_child(attachment)
		attachment.bone_idx = int(_bone_indices[bone_name])
		attachment.bone_name = bone_name
		_attachments[bone_name] = attachment

func _add_bone(bone_name: String, parent_name: String, local_position: Vector3) -> void:
	var index := skeleton.add_bone(bone_name)
	_bone_indices[bone_name] = index
	if not parent_name.is_empty():
		skeleton.set_bone_parent(index, int(_bone_indices[parent_name]))
	skeleton.set_bone_rest(index, Transform3D(Basis.IDENTITY, local_position))

func _build_model() -> void:
	var tunic := Color("#267b50")
	var tunic_light := Color("#42a467")
	var skin := Color("#f0bd86")
	var hair := Color("#d9a849")
	var leather := Color("#613d32")
	var gold := Color("#f2c45d")

	var pelvis := _attachment("pelvis")
	_add_cylinder(pelvis, 0.25, 0.35, 0.48, Vector3.ZERO, tunic)
	_add_box(pelvis, Vector3(0.53, 0.10, 0.04), Vector3(0.0, 0.15, 0.20), leather)
	_add_box(pelvis, Vector3(0.12, 0.11, 0.04), Vector3(0.0, 0.15, 0.23), gold)
	_add_box(pelvis, Vector3(0.19, 0.22, 0.12), Vector3(0.18, -0.10, 0.25), leather)
	_add_box(pelvis, Vector3(0.12, 0.07, 0.04), Vector3(0.18, -0.07, 0.32), gold)

	var spine := _attachment("spine")
	_add_capsule(spine, 0.27, 0.72, Vector3.ZERO, tunic, Vector3.ZERO, Vector3(1.0, 1.0, 0.72))
	_add_capsule(spine, 0.12, 0.70, Vector3(0.0, 0.25, 0.0), tunic_light, Vector3(0.0, 0.0, 90.0))

	var neck := _attachment("neck")
	_add_sphere(neck, Vector3.ZERO, Vector3(0.22, 0.19, 0.20), skin)

	var head := _attachment("head")
	_add_sphere(head, Vector3.ZERO, Vector3(0.29, 0.34, 0.27), skin)
	# Put one small eye on each side so the face reads from either movement direction.
	for side in [-1.0, 1.0]:
		_add_sphere(head, Vector3(side * 0.235, 0.045, 0.075), Vector3(0.035, 0.05, 0.045), Color("#243542"))
		_add_sphere(head, Vector3(side * 0.238, 0.085, 0.075), Vector3(0.04, 0.018, 0.05), hair.darkened(0.18))
	_add_sphere(head, Vector3(0.0, -0.045, 0.245), Vector3(0.065, 0.055, 0.06), skin)
	_add_sphere(head, Vector3(0.0, 0.18, -0.035), Vector3(0.28, 0.15, 0.24), hair)
	_add_sphere(head, Vector3(0.0, 0.14, 0.16), Vector3(0.22, 0.09, 0.08), hair)
	_add_cylinder(head, 0.29, 0.29, 0.075, Vector3(0.0, 0.265, 0.0), tunic)
	_add_cylinder(head, 0.25, 0.25, 0.045, Vector3(0.0, 0.31, 0.0), Color("#1e6542"))
	_add_sphere(head, Vector3(0.0, 0.37, 0.0), Vector3(0.38, 0.17, 0.34), tunic)
	_add_cone(head, 0.20, 0.25, Vector3(0.0, 0.55, 0.07), tunic, Vector3(30.0, 0.0, 0.0))

	var left_arm := _attachment("left_arm")
	_add_capsule(left_arm, 0.115, 0.48, Vector3(0.0, -0.12, 0.0), tunic_light, Vector3(0.0, 0.0, -14.0))
	var left_hand := _attachment("left_hand")
	_add_sphere(left_hand, Vector3.ZERO, Vector3(0.10, 0.10, 0.10), skin)

	var right_arm := _attachment("right_arm")
	_add_capsule(right_arm, 0.115, 0.48, Vector3(0.0, -0.12, 0.0), tunic_light, Vector3(0.0, 0.0, 14.0))
	var right_hand := _attachment("right_hand")
	_add_sphere(right_hand, Vector3.ZERO, Vector3(0.11, 0.11, 0.11), skin)

	var left_leg := _attachment("left_leg")
	_add_capsule(left_leg, 0.105, 0.46, Vector3.ZERO, Color("#e4c68f"))
	var left_foot := _attachment("left_foot")
	_add_box(left_foot, Vector3(0.27, 0.20, 0.40), Vector3.ZERO, leather)

	var right_leg := _attachment("right_leg")
	_add_capsule(right_leg, 0.105, 0.46, Vector3.ZERO, Color("#e4c68f"))
	var right_foot := _attachment("right_foot")
	_add_box(right_foot, Vector3(0.27, 0.20, 0.40), Vector3.ZERO, leather)

func _attachment(bone_name: String) -> BoneAttachment3D:
	return _attachments[bone_name] as BoneAttachment3D

func _set_bone_angle(bone_name: String, angle: float) -> void:
	skeleton.set_bone_pose_rotation(int(_bone_indices[bone_name]), Quaternion(JOINT_AXIS, angle))

func _add_box(parent: Node3D, size: Vector3, at: Vector3, color: Color, rotation_degrees: Vector3 = Vector3.ZERO) -> void:
	var mesh := BoxMesh.new()
	mesh.size = size
	_add_mesh(parent, mesh, at, color, rotation_degrees)

func _add_capsule(parent: Node3D, radius: float, height: float, at: Vector3, color: Color, rotation_degrees: Vector3 = Vector3.ZERO, mesh_scale: Vector3 = Vector3.ONE) -> void:
	var mesh := CapsuleMesh.new()
	mesh.radius = radius
	mesh.height = height
	_add_mesh(parent, mesh, at, color, rotation_degrees, mesh_scale)

func _add_sphere(parent: Node3D, at: Vector3, size: Vector3, color: Color) -> void:
	var mesh := SphereMesh.new()
	mesh.radius = 0.5
	mesh.height = 1.0
	_add_mesh(parent, mesh, at, color, Vector3.ZERO, size)

func _add_cylinder(parent: Node3D, top_radius: float, bottom_radius: float, height: float, at: Vector3, color: Color) -> void:
	var mesh := CylinderMesh.new()
	mesh.top_radius = top_radius
	mesh.bottom_radius = bottom_radius
	mesh.height = height
	_add_mesh(parent, mesh, at, color)

func _add_cone(parent: Node3D, radius: float, height: float, at: Vector3, color: Color, rotation_degrees: Vector3 = Vector3.ZERO) -> void:
	var mesh := CylinderMesh.new()
	mesh.top_radius = 0.0
	mesh.bottom_radius = radius
	mesh.height = height
	mesh.radial_segments = 4
	_add_mesh(parent, mesh, at, color, rotation_degrees)

func _add_mesh(parent: Node3D, mesh: Mesh, at: Vector3, color: Color, rotation_degrees: Vector3 = Vector3.ZERO, mesh_scale: Vector3 = Vector3.ONE) -> void:
	var visual := MeshInstance3D.new()
	visual.mesh = mesh
	visual.position = at
	visual.rotation_degrees = rotation_degrees
	visual.scale = mesh_scale
	visual.material_override = _material(color)
	parent.add_child(visual)

func _material(color: Color) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	material.roughness = 0.85
	return material
