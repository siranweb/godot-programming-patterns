@abstract
extends RefCounted
class_name AShooting

const _SHOT_SOUND: AudioStreamWAV = preload('res://06_subclass_sandbox/assets/shot.wav')

enum Sound {
	SHOT
}

# Private for AShooting
var _audio_player: AudioStreamPlayer
var _spawns_node: Node2D

func initialize(audio_player: AudioStreamPlayer, spawns_node: Node2D) -> void:
	_audio_player = audio_player
	_spawns_node = spawns_node
	
@abstract func activate(start_pos: Vector2, aim_pos: Vector2) -> void

func _spawn(node: Node2D) -> void:
	_spawns_node.add_child(node)

func _play_sound(sound: Sound) -> void:
	match sound:
		Sound.SHOT:
			_audio_player.stream = _SHOT_SOUND
		_:
			return
	_audio_player.play()

func _get_direction(start_pos: Vector2, aim_pos: Vector2) -> Vector2:
	return (aim_pos - start_pos).normalized()

func _get_rotation(direction: Vector2) -> float:
	return Vector2.RIGHT.angle_to(direction)