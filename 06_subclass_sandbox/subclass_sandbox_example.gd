extends Node2D
class_name SubclassSandboxExample

@onready var _shooter: Node2D = $Shooter
@onready var _audio_player: AudioStreamPlayer = $AudioStreamPlayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("primary_action"):
		var single_shooting: AShooting = SingleShooting.new()
		single_shooting.initialize(_audio_player, self)
		single_shooting.activate(_shooter.global_position, get_global_mouse_position())
	elif event.is_action_pressed("secondary_action"):
		var burst_shooting: AShooting = ShotgunShooting.new()
		burst_shooting.initialize(_audio_player, self)
		burst_shooting.activate(_shooter.global_position, get_global_mouse_position())