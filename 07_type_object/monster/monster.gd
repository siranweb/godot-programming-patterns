extends Node2D
class_name Monster

@export var breed: BreedResource

@onready var _sprite: Sprite2D = $Sprite2D
@onready var _name_label: Label = $NameLabel
@onready var _health_label: Label = $HealthLabel

func _ready() -> void:
	if not breed:
		return

	_sprite.texture = breed.texture
	_name_label.text = "Name: %s" % breed.name
	_health_label.text = "Health: %s" % breed.health