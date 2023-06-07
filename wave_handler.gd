class_name WaveHandler
extends Node

@export var enemy_spawner: EnemySpawner
@export var wave_start_sound: Resource
@export var wave_player: AnimationPlayer

var running = false
var current_wave = 0

var random_spawn_timer: float = 0.0
var random_spawn_delay_min: float = 0.1
var random_spawn_delay_max: float = 2.0
 

func _ready():
	current_wave = 0
	

func _process(delta):
	if not running:
		return
	
	random_spawn_timer -= delta
	if random_spawn_timer <= 0.0:
		enemy_spawner.spawn_enemy()
		random_spawn_timer = randf_range(random_spawn_delay_min, random_spawn_delay_max)
	

func wave_start(wave: int):
	running = true
	current_wave = wave
	AudioHandler.play_sound(wave_start_sound)
	wave_player.play("wave_start")
	
	
func wave_end():
	running = false
