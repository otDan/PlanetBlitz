extends Node

@export var animation_player: AnimationPlayer


func _ready():
	animation_player.play("loading_main_screen")
