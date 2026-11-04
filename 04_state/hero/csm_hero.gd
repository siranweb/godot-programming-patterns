extends AHero
class_name CsmHero

## Concurrent State Machines Hero.
## Implements movement and weapon states.

@onready var _stick: Node2D = $Stick

var _movement_state: AHeroState = HeroStandingState.new()
var _weapon_state: AHeroState = HeroAttackReadyState.new()

func _physics_process(delta: float) -> void:
	_movement_state.update(self, delta)
	_weapon_state.update(self, delta)
	move_and_slide()

func _input(event: InputEvent) -> void:
	_movement_state.handle_input(self, event)
	_weapon_state.handle_input(self, event)
	
func attack() -> void:
	_stick.rotation_degrees = -30
	_stick.visible = true
	var tween: Tween = create_tween()
	tween.tween_property(_stick, "rotation_degrees", 30, 0.25)
	await tween.finished
	_stick.visible = false

func change_state(state: AHeroState) -> void:
	_movement_state.exit(self)
	_movement_state = state
	_movement_state.enter(self)

func change_weapon_state(state: AHeroState) -> void:
	_weapon_state.exit(self)
	_weapon_state = state
	_weapon_state.enter(self)
