extends CanvasLayer

@export var animation_player: AnimationPlayer

@export var main_menu: Control
@export var game_type_menu: Control
@export var options_menu: Control

@export var wave_handler: WaveHandler
@export var border: Border


func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	main_menu.hide()
	game_type_menu.show()


func _on_options_pressed():
	main_menu.hide()
	options_menu.show()
#	get_tree().paused = true
	

func _on_discord_pressed():
	OS.shell_open("https://discord.gg/cE955uZ34z")
	

func _on_game_type_endless_pressed():
	animation_player.play("play")
	wave_handler.wave_start(1)
#	border.expand_circle(5000, 2000, 1500.0)


func _on_game_type_back_pressed():
	game_type_menu.hide()
	main_menu.show()


func _on_options_back_pressed():
	options_menu.hide()
	main_menu.show()
