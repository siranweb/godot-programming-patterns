extends AShooting
class_name ShotgunShooting

const _BULLET: PackedScene = preload('res://06_subclass_sandbox/bullet/bullet.tscn')
const _POWER: float = 800

func activate(start_pos: Vector2, aim_pos: Vector2) -> void:
	var direction: Vector2 = _get_direction(start_pos, aim_pos)
	var rotation: float = _get_rotation(direction)
	
	var bullet1: Bullet = _BULLET.instantiate()
	bullet1.rotation = rotation
	bullet1.linear_velocity = direction * _POWER

	var bullet2: Bullet = _BULLET.instantiate()
	bullet2.rotation = rotation - 0.5
	bullet2.linear_velocity = direction.rotated(-0.5) * _POWER

	var bullet3: Bullet = _BULLET.instantiate()
	bullet3.rotation = rotation + 0.5
	bullet3.linear_velocity = direction.rotated(0.5) * _POWER

	bullet1.set_life_time(0.25)
	bullet2.set_life_time(0.25)
	bullet3.set_life_time(0.25)

	_spawn(bullet1)
	bullet1.global_position = start_pos
	_spawn(bullet2)
	bullet2.global_position = start_pos
	_spawn(bullet3)
	bullet3.global_position = start_pos
	
	
	_play_sound(AShooting.Sound.SHOT)
		
