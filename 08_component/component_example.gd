extends Node2D
class_name ComponentExample

@onready var _input_cat: Cat = $InputCat
@onready var _auto_cat: Cat = $AutoCat

func _ready() -> void:
	var input_cat_movement_component: AMovementComponent = InputMovementComponent.new()
	var input_cat_graphics_component: GraphicsComponent = GraphicsComponent.new()
	_input_cat.attach_components(input_cat_movement_component, input_cat_graphics_component)
	
	var auto_cat_movement_component: AMovementComponent = AutoMovementComponent.new()
	var auto_cat_graphics_component: GraphicsComponent = GraphicsComponent.new()
	_auto_cat.attach_components(auto_cat_movement_component, auto_cat_graphics_component)
