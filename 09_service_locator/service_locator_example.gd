extends Node2D
class_name ServiceLocatorExample

const _AUDIO_SERVICE_SCENE: PackedScene = preload("res://09_service_locator/systems/audio_service/audio_service.tscn")
const _DUMMY_AUDIO_SERVICE_SCENE: PackedScene = preload("res://09_service_locator/systems/audio_service/dummy/dummy_audio_service.tscn")

const _USE_AUDIO: bool = true

func _ready() -> void:
	var audio_service: AAudioService
	if _USE_AUDIO:
		audio_service = _AUDIO_SERVICE_SCENE.instantiate()
	else:
		audio_service = _DUMMY_AUDIO_SERVICE_SCENE.instantiate()
	
	add_child(audio_service)
	ServiceLocator.set_audio_service(audio_service)
	
	# Call ServiceLocator.audio_service somewhere else 
