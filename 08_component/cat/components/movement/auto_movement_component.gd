extends AMovementComponent
class_name AutoMovementComponent

func update(cat: Cat, delta: float) -> void:
	if cat.global_position.x <= 870 or cat.velocity.x == 0:
		cat.velocity.x = AMovementComponent.VELOCITY * delta
	elif cat.global_position.x >= 1070:
		cat.velocity.x = -AMovementComponent.VELOCITY * delta

	cat.move_and_slide()