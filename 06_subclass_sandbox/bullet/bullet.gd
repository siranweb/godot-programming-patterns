extends RigidBody2D
class_name Bullet

@onready var _timer: Timer = $Timer
var _life_time: float = 1.0

func _ready() -> void:
	_timer.timeout.connect(_destroy)
	_timer.wait_time = _life_time
	_timer.start()

func set_life_time(life_time: float) -> void:
	_life_time = clampf(life_time, 0.1, 10.0)
	
func _destroy() -> void:
	visible = false
	queue_free()
