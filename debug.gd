extends Node

@export var player: Node2D

@export var fps: Label
@export var speed: Label


func _ready():
	pass


func _process(delta):
	fps.text = "Fps: " + str(Engine.get_frames_per_second())
	speed.text = "Speed: " + str(roundf(player.velocity.length()))


func _on_randomize_button_pressed():
	player.get_node("Planet")._ready()
