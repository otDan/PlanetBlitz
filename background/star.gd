extends Node2D
class_name Star

var color = Color(1, 1, 1)
var size = 1
var brightness = 1.0
var min_brightness = 0.75
var blink_speed = 1.0
var timer = 0.0
var blink_offset = 0.0


func _ready():
	blink_offset = randf() * 100
	
	var deviation = 0.15  # Maximum deviation from white
	var red_deviation = randf_range(0, deviation)
	var green_deviation = randf_range(0, deviation)
	var blue_deviation = randf_range(0, deviation)

	color.r -= red_deviation
	color.g -= green_deviation
	color.b -= blue_deviation


func _draw():
	draw_circle(Vector2.ZERO, size, color * brightness)


func _process(delta):
	timer += delta
	brightness = (sin((timer * blink_speed) + blink_offset) + 1) / 2
	brightness = brightness * (1.0 - min_brightness) + min_brightness
