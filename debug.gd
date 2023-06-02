extends Node

@export var player: Node2D

@export var fps: Label
@export var memory: Label

@export var position: Label
@export var speed: Label


func _ready():
	pass


func _process(delta):
	fps.text = "Fps: " + str(Engine.get_frames_per_second())
	memory.text = "Memory: " + str(Performance.get_monitor(Performance.MEMORY_STATIC))
	
	position.text = "Position: " + str(round(player.global_position))
	speed.text = "Speed: " + str(roundf(player.velocity.length()))


func _on_randomize_button_pressed():
	player.get_node("Planet/Planet")._ready()
