extends Node2D
class_name Star

var size = 1
var brightness = 1.0
var blinkSpeed = 1.0
var timer = 0.0
var blinkOffset = 0.0


func _ready():
	blinkOffset = randf() * 100


func _draw():
	draw_circle(Vector2.ZERO, size, Color(1, 1, 1) * brightness)


func _process(delta):
	timer += delta
	brightness = (sin((timer * blinkSpeed) + blinkOffset) + 1) / 2
	queue_redraw()
