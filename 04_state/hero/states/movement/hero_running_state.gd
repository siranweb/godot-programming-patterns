extends AHeroState
class_name HeroRunningState

func handle_input(hero: AHero, event: InputEvent) -> void:
	if event.is_action_pressed("jump") and hero.is_on_floor():
		hero.change_state(HeroJumpingState.new())

func update(hero: AHero, delta: float) -> void:
	var direction: float = Input.get_axis("move_left", "move_right")
	
	if not hero.is_on_floor():
		hero.velocity.y += hero.GRAVITY * delta
	
	if direction == 0:
		hero.change_state(HeroStandingState.new())
	else:
		hero.velocity.x = direction * hero.SPEED * delta