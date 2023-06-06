extends Node

@export var animation_player: AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("loading_main_screen")


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_play_pressed():
	animation_player.play("play")
	pass # Replace with function body.


func _on_discord_pressed():
	OS.shell_open("https://discord.gg/cE955uZ34z")
	pass # Replace with function body.
