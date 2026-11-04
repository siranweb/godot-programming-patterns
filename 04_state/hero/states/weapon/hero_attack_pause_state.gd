extends AHeroState
class_name HeroAttackPauseState

const _MAX_PAUSE_TIME: float = 0.5
var _pause_time: float = 0.0

func update(hero: AHero, delta: float) -> void:
	if _pause_time < _MAX_PAUSE_TIME:
		_pause_time += delta
	else:
		hero.change_weapon_state(HeroAttackReadyState.new())

func enter(_hero: AHero) -> void:
	_pause_time = 0.0