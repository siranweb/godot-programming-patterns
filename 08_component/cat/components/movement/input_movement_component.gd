extends AMovementComponent
class_name InputMovementComponent

func update(cat: Cat, delta: float) -> void:
	var direction: float = Input.get_axis("move_left", "move_right")
	cat.velocity.x = direction * AMovementComponent.VELOCITY * delta
	
	if cat.is_on_floor():
		if Input.is_action_just_pressed("jump"):
			cat.velocity.y = AMovementComponent.JUMP_FORCE
	else:
		cat.velocity.y += AMovementComponent.GRAVITY * delta
	
	cat.move_and_slide()