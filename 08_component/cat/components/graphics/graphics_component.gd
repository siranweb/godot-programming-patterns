extends RefCounted
class_name GraphicsComponent

func update(cat: Cat, sprite: AnimatedSprite2D) -> void:
	var direction: int = clampi(ceili(cat.velocity.x),-1, 1)
	if direction == 1:
		sprite.flip_h = false
	elif direction == -1:
		sprite.flip_h = true

	if not cat.is_on_floor():
		sprite.play("air")
		return
	
	if cat.velocity == Vector2.ZERO:
		sprite.play("idle")
		return
	
	sprite.play("running")