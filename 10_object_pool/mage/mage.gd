extends Node2D
class_name Mage

const _POWER: float = 800.0
const _LIFETIME: float = 2.0

@onready var _spheres_pool: SpheresPool = $SpheresPool

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("primary_action"):
		var start_pos: Vector2 = global_position
		var aim_pos: Vector2 = get_global_mouse_position()
	
		var direction: Vector2 = (aim_pos - start_pos).normalized()
		var sphere: RigidBody2D = _spheres_pool.spawn_sphere(start_pos)
		if not sphere:
			return
		
		sphere.linear_velocity = direction * _POWER
		_lifetime_destroy_sphere(sphere)

func _lifetime_destroy_sphere(sphere: RigidBody2D) -> void:
	await get_tree().create_timer(_LIFETIME).timeout
	_spheres_pool.return_to_pool(sphere)