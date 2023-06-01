extends Node


func fade_in(stream_player: AudioStreamPlayer2D, volume):
	stream_player.play()
	
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	tween.tween_property(stream_player, "volume_db", -10, 0.25)
	

func fade_out(stream_player: AudioStreamPlayer2D):
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(stream_player, "volume_db", -25, 0.25)
	tween.tween_callback(Callable(stream_player, "stop"))
