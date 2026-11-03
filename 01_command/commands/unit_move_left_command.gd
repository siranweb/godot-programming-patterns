extends AUnitCommand
class_name UnitMoveLeftCommand

var _unit: AUnit
var _init_pos: Vector2

func _init(unit: AUnit) -> void:
	_unit = unit
	_init_pos = Vector2(_unit.position)

func execute() -> void:
	_unit.move_left()

func undo() -> void:
	_unit.position = _init_pos