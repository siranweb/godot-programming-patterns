extends AHero
class_name FsmHero

## Finite State Machine Hero.
## Implements only movement states.

var _current_state: AHeroState = HeroStandingState.new()

func _physics_process(delta: float) -> void:
	_current_state.update(self, delta)
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	_current_state.handle_input(self, event)

func change_state(state: AHeroState) -> void:
	_current_state.exit(self)
	_current_state = state
	_current_state.enter(self)
