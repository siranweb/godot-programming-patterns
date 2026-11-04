extends AHeroState
class_name HeroAttackReadyState

func handle_input(hero: AHero, event: InputEvent) -> void:
	if event.is_action_pressed("primary_action"):
		hero.attack()
		hero.change_weapon_state(HeroAttackPauseState.new())