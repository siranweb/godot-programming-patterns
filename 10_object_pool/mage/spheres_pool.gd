extends Node2D
class_name SpheresPool

const _SPHERE_SCENE: PackedScene = preload("res://10_object_pool/mage/sphere/sphere.tscn")
const _SPHERES_AMOUNT: int = 8

var _available_pool: Array[RigidBody2D] = []

func _ready() -> void:
	for i in range(_SPHERES_AMOUNT):
		var sphere: RigidBody2D = _SPHERE_SCENE.instantiate()
		sphere.visible = false
		_available_pool.append(sphere)
		
		# Also can be added to some different node
		add_child(sphere)
		
func spawn_sphere(spawn_position: Vector2) -> Node2D:
	if _available_pool.is_empty():
		# Also we can dynamically add more spheres if it's not enough
		return null
	
	var sphere: RigidBody2D = _available_pool.pop_front()
	var new_transform: Transform2D = Transform2D(0, spawn_position)
	
	# RigidBody2D reset fix
	PhysicsServer2D.body_set_state(
		sphere.get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		new_transform
		)


	sphere.visible = true
	sphere.set_process(true)
	sphere.set_physics_process(true)
	
	return sphere

func return_to_pool(sphere: RigidBody2D) -> void:
	sphere.visible = false
	sphere.linear_velocity = Vector2.ZERO
	var new_transform: Transform2D = Transform2D(0, Vector2.ZERO)
	PhysicsServer2D.body_set_state(
			sphere.get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			new_transform
	)

	_available_pool.append(sphere)
