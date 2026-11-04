@abstract
extends CharacterBody2D
class_name AHero

## This class is designed to make it easy to reuse the Hero across different scenes,
## with various scripts attached. You likely won’t need it in an actual game.

const SPEED: float = 20_000.0
const JUMP_VELOCITY: float = -600.0
const GRAVITY: float = 2_000.0

func change_state(_state: AHeroState) -> void:
	pass

func attack() -> void:
	pass

func change_weapon_state(_state: AHeroState) -> void:
	pass