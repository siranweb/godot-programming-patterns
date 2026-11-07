extends CharacterBody2D
class_name Cat

@export var sprite_frames: SpriteFrames
@onready var _sprite: AnimatedSprite2D = $AnimatedSprite2D

var _movement_component: AMovementComponent
var _graphics_component: GraphicsComponent

func _ready() -> void:
	if sprite_frames:
		_sprite.sprite_frames = sprite_frames

func attach_components(movement_component: AMovementComponent, graphics_component: GraphicsComponent) -> void:
	_movement_component = movement_component
	_graphics_component = graphics_component
	
func _physics_process(delta: float) -> void:
	if not _movement_component or not _graphics_component:
		return
	
	_movement_component.update(self, delta)
	_graphics_component.update(self, _sprite)