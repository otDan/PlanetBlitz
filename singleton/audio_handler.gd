extends Node


func play_sound(audio: AudioStream, pitch_variation: float = 0.0):
	var audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.stream = audio
	audio_player.pitch_scale = 1.0 + randf_range(-pitch_variation, pitch_variation)
	audio_player.play()
	var audio_callable = Callable(self, "audio_finished")
	audio_callable.bind(audio_player)
	audio_player.connect("finished", audio_callable)
	

func audio_finished(audio_player: AudioStreamPlayer):
	remove_child(audio_player)


func fade_in(stream_player: AudioStreamPlayer2D, volume):
	stream_player.play()
	
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	tween.tween_property(stream_player, "volume_db", -10, 0.25)
	

func fade_out(stream_player: AudioStreamPlayer2D):
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(stream_player, "volume_db", -25, 0.25)
	tween.tween_callback(Callable(stream_player, "stop"))
