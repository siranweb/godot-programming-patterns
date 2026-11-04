extends Node2D

const _GHOST_SCENE: PackedScene = preload("res://03_prototype/monsters/ghost/ghost.tscn")
const _DEMON_SCENE: PackedScene = preload("res://03_prototype/monsters/demon/demon.tscn")

@onready var _ghost_spawner: Spawner = $GhostSpawner
@onready var _demon_spawner: Spawner = $DemonSpawner

func _ready() -> void:
	var ghost: Ghost = _GHOST_SCENE.instantiate()
	ghost.hp = 10
	ghost.speed = 15
	
	var demon: Demon = _DEMON_SCENE.instantiate()
	demon.hp = 20
	demon.speed = 10
	
	_ghost_spawner.set_prototype(ghost)
	_ghost_spawner.set_spawns_node(self)

	_demon_spawner.set_prototype(demon)
	_demon_spawner.set_spawns_node(self)