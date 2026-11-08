extends Node

# Service Locator is autoloaded singleton (!)

var _audio_service: AAudioService
var audio_service: AAudioService:
	get:
		return _audio_service

func set_audio_service(service: AAudioService) -> void:
	_audio_service = service
