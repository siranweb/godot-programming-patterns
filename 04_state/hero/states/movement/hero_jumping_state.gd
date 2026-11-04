extends AHeroState
class_name HeroJumpingState

const _MAX_JUMP_TIME: float = 0.3
var _jump_time: float = 0.0

func handle_input(_hero: AHero, event: InputEvent) -> void:
	if event.is_action_released("jump"):
		_jump_time = _MAX_JUMP_TIME

func update(hero: AHero, delta: float) -> void:
	if hero.velocity.y < 0 and Input.is_action_pressed("jump") and _jump_time < _MAX_JUMP_TIME:
		_jump_time += delta
	else:
		hero.velocity.y += hero.GRAVITY * delta
	
	var direction: float = Input.get_axis("move_left", "move_right")
	hero.velocity.x = direction * hero.SPEED * delta
	
	if hero.is_on_floor() and hero.velocity.y >= 0:
		hero.change_state(HeroStandingState.new())
		
func enter(hero: AHero) -> void:
	hero.velocity.y = hero.JUMP_VELOCITY
	_jump_time = 0.0