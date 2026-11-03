extends AUnit
class_name UnitLong

const _STEP: int = 48

func _init() -> void:
	_unit_name = "Blue"

func move_up() -> void:
	position.y -= _STEP

func move_down() -> void:
	position.y += _STEP

func move_left() -> void:
	position.x -= _STEP

func move_right() -> void:
	position.x += _STEP