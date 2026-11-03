extends Node2D
class_name CommandExample

@onready var _current_unit_label: Label = $CurrentUnitLabel
@onready var _unit_short: AUnit = $UnitShort
@onready var _unit_long: AUnit = $UnitLong
@onready var _current_unit: AUnit = _unit_short

var _commands_history: Array[AUnitCommand] = []

func _ready() -> void:
	_update_current_unit_label()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('move_up'):
		var command: AUnitCommand = UnitMoveUpCommand.new(_current_unit);
		command.execute()
		_commands_history.append(command);
	elif event.is_action_pressed('move_down'):
		var command: AUnitCommand = UnitMoveDownCommand.new(_current_unit)
		command.execute()
		_commands_history.append(command);
	elif event.is_action_pressed('move_left'):
		var command: AUnitCommand = UnitMoveLeftCommand.new(_current_unit)
		command.execute()
		_commands_history.append(command);
	elif event.is_action_pressed('move_right'):
		var command: AUnitCommand = UnitMoveRightCommand.new(_current_unit)
		command.execute()
		_commands_history.append(command);
	elif event.is_action_pressed('special'):
		_switch_unit()
	elif event.is_action_pressed('cancel'):
		_cancel_command()
	
func _switch_unit() -> void:
	_current_unit = _unit_long if _current_unit == _unit_short else _unit_short
	_update_current_unit_label()
	
func _cancel_command() -> void:
	var command: AUnitCommand = _commands_history.pop_back()
	if not command:
		return
	command.undo()
	
func _update_current_unit_label() -> void:
	_current_unit_label.text = "Current unit: %s" % _current_unit.unit_name