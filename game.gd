extends Node

@export var animation_player: AnimationPlayer

@export var main_menu: Control
@export var game_type_menu: Control


func _ready():
	animation_player.play("loading_main_screen")


func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	main_menu.hide()
	game_type_menu.show()


func _on_discord_pressed():
	OS.shell_open("https://discord.gg/cE955uZ34z")


func _on_back_pressed():
	game_type_menu.hide()
	main_menu.show()


func _on_endless_pressed():
	animation_player.play("play")
	pass # Replace with function body.
