extends Node2D

## Flyweight implemented using multimesh with 100k instances.
## Launch scene and open debugger -> monitoring.
## If needed, change Instance Count in MultiMeshInstance2D.

@onready var multi_mesh_instance: MultiMeshInstance2D = $MultiMeshInstance2D

const _AREA_SIZE: Vector2i = Vector2i(1280, 720)

func _ready() -> void:
	multi_mesh_instance.visible = true
	for i in multi_mesh_instance.multimesh.instance_count:
		var angle: float = randf_range(0, 2 * PI)
		var pos: Vector2i = Vector2i(randi_range(0, _AREA_SIZE.x), randi_range(0, _AREA_SIZE.y))
		multi_mesh_instance.multimesh.set_instance_transform_2d(i, Transform2D(angle, pos))
