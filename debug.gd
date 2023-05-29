extends Node

@export var player: Node2D

@export var fps: Label
@export var speed: Label

var last_position
var last_frame_time

func _ready():
	last_position = player.position
	last_frame_time = Time.get_ticks_msec()

func _process(delta):
	var player_speed = calc_object_speed(player)
	
	fps.text = "FPS: " + str(Engine.get_frames_per_second())
	speed.text = "SPEED: " + str(roundf(player_speed))


func calc_object_speed(node: Node2D) -> float:
	var current_position = node.position
	var current_time = Time.get_ticks_msec()

	var velocity = (current_position - last_position) / ((current_time - last_frame_time) / 1000.0)  # Convert milliseconds to seconds

	last_position = current_position
	last_frame_time = current_time

	return velocity.length()
