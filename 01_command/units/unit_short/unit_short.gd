extends AUnit
class_name UnitShort

const _STEP: int = 16

func _init() -> void:
	_unit_name = "Red"

func move_up() -> void:
	position.y -= _STEP

func move_down() -> void:
	position.y += _STEP

func move_left() -> void:
	position.x -= _STEP

func move_right() -> void:
	position.x += _STEP