extends Node

@export var fps: Label


func _ready():
	pass 


func _process(delta):
	fps.text = "FPS: " + str(Engine.get_frames_per_second())
	pass
