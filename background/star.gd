extends Node2D
class_name Star

var color = Color(1, 1, 1)
var size = 1
var brightness = 1.0
#var min_brightness = 0.65
#var blink_speed = 10.0
#var timer = 0.0
#var blink_offset = 0.0
#var frame_counter = 0
#var frame_update_count = 15
var to_update = false


func _ready():
#	blink_offset = randf() * 100

	var deviation = 0.25  # Maximum deviation from white
	var red_deviation = randf_range(0, deviation)
	var green_deviation = randf_range(0, deviation)
	var blue_deviation = randf_range(0, deviation)

	color.r -= red_deviation
	color.g -= green_deviation
	color.b -= blue_deviation


func _draw():
#	if to_update:
#		draw_circle(Vector2.ZERO, size, Color(1, 0, 0) * brightness)
#	else:
	draw_circle(Vector2.ZERO, size, color * brightness)


#func _process(delta):
#	frame_counter += 1
#
#	# Update the brightness every couple of frames (e.g., every 2 frames)
#	if frame_counter % frame_update_count == 0:
#		timer += delta
#		brightness = (sin((timer * blink_speed) + blink_offset) + 1) / 2
#		brightness = brightness * (1.0 - min_brightness) + min_brightness
#		to_update = true
