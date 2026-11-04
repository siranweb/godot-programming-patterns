@abstract
extends RefCounted
class_name AHeroState

func handle_input(_hero: AHero, _event: InputEvent) -> void:
	pass

func update(_hero: AHero, _delta: float) -> void:
	pass

func enter(_hero: AHero) -> void:
	pass

func exit(_hero: AHero) -> void:
	pass