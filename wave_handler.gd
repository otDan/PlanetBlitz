class_name WaveHandler
extends Node

@export var wave_start_sound: Resource
@export var wave_player: AnimationPlayer

var running = false
var current_wave = 0
 

func _ready():
	current_wave = 0
	

func _process(delta):
	if not running:
		return
	

func wave_start(wave: int):
	running = true
	current_wave = wave
	AudioHandler.play_sound(wave_start_sound)
	wave_player.play("wave_start")
	
	
func wave_end():
	running = false
	
