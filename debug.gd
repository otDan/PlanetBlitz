extends Node

@export var player: Node2D

@export var fps: Label
@export var speed: Label


func _ready():
	pass


func _process(delta):
	fps.text = "FPS: " + str(Engine.get_frames_per_second())
	speed.text = "SPEED: " + str(roundf(player.velocity.length()))
