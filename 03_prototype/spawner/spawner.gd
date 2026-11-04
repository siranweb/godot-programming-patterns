extends Node2D
class_name Spawner

@export var wait_time: float = 1.0
@onready var _timer: Timer = $Timer

const _MAX_SPAWN_DISTANCE: int = 200

var _monster_prototype: AMonster
var _spawns_node: Node2D

func _ready() -> void:
	_timer.wait_time = wait_time
	_timer.timeout.connect(_spawn)

func set_prototype(monster: AMonster) -> void:
	_monster_prototype = monster
	
func set_spawns_node(spawns_node: Node2D) -> void:
	_spawns_node = spawns_node

func _spawn() -> void:
	if not _monster_prototype or not _spawns_node:
		return
	var duplicated: AMonster = _monster_prototype.duplicate()
	_spawns_node.add_child(duplicated)
	duplicated.global_position.x = global_position.x + randi_range(-_MAX_SPAWN_DISTANCE, _MAX_SPAWN_DISTANCE)
	duplicated.global_position.y = global_position.y + randi_range(-_MAX_SPAWN_DISTANCE, _MAX_SPAWN_DISTANCE)
