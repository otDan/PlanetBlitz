extends Control


@export var player: Player

@export var progress_bar: TextureProgressBar
@export var level_label: Label


func _process(delta):
	level_label.text = str(player.level)
	progress_bar.value = remap(player.xp, 0, player.next_level_xp, 0, 100)
	pass
