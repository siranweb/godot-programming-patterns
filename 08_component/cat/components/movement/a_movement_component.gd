@abstract
extends RefCounted
class_name AMovementComponent

const VELOCITY: int = 14_000
const JUMP_FORCE: int = -1200
const GRAVITY: int = 3300

@abstract func update(cat: Cat, delta: float) -> void