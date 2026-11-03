@abstract
extends Node2D
class_name AUnit

@abstract func move_up() -> void
@abstract func move_down() -> void
@abstract func move_left() -> void
@abstract func move_right() -> void

var _unit_name: String = ""
var unit_name: String:
	get:
		return _unit_name