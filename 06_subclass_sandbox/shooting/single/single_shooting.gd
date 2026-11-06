extends AShooting
class_name SingleShooting

const _BULLET: PackedScene = preload('res://06_subclass_sandbox/bullet/bullet.tscn')
const _POWER: float = 800

func activate(start_pos: Vector2, aim_pos: Vector2) -> void:
	var direction: Vector2 = _get_direction(start_pos, aim_pos)
	var rotation: float = _get_rotation(direction)
	var bullet: Bullet = _BULLET.instantiate()
	bullet.rotation = rotation
	bullet.linear_velocity = direction * _POWER

	bullet.set_life_time(1.0)
	_spawn(bullet)
	bullet.global_position = start_pos
	_play_sound(AShooting.Sound.SHOT)