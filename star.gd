extends Node2D
class_name Star
	
var size = 1


func _draw():
	var starSize = size * 2
	draw_circle(Vector2.ZERO, starSize, Color(1, 1, 1))
