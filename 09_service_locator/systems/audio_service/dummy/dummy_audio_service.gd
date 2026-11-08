extends AAudioService
class_name DummyAudioService

func play_audio(sound: String) -> void:
	print("Dummy audio service called %s" % sound)