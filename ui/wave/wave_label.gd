extends RichTextLabel


@export var wave_handler: WaveHandler


func _process(delta):
	text = "[center][u]Wave " + str(wave_handler.current_wave) + "[/u][/center]"
