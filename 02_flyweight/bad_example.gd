extends Node2D

## No Flyweight. Just spawns 100k nodes.
## Launch scene and open debugger -> monitoring.
## If needed, change _COUNT below.

const _TEXTURE: CompressedTexture2D = preload('res://icon.svg')
const _SHADER: Shader = preload('res://02_flyweight/animated.gdshader')
const _AREA_SIZE: Vector2i = Vector2i(1280, 720)
const _COUNT: int = 100_000

func _ready() -> void:
	var shader_material: ShaderMaterial = ShaderMaterial.new()
	shader_material.shader = _SHADER
	
	for i in range(_COUNT):
		var angle: float = randf_range(0, 2 * PI)
		var pos: Vector2i = Vector2i(randi_range(0, _AREA_SIZE.x), randi_range(0, _AREA_SIZE.y))
		var sprite: Sprite2D = Sprite2D.new()
		sprite.texture = _TEXTURE
		sprite.scale = Vector2(0.25, 0.25)
		sprite.material = shader_material
		sprite.rotation = angle
		add_child(sprite)
		sprite.global_position = pos