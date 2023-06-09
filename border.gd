class_name Border
extends Node2D

var color: Color = Color.ANTIQUE_WHITE

var border_radius = 300.0
var border_width = 5.0

var target_border_radius = 300.0
var target_border_width = 5.0

var expand_duration = 1.0
var expand_timer = 0.0


func _ready():
	# get_parent().get_node("Player").position = Vector2(30000, 0)
	pass


func _draw():
	draw_arc(position, border_radius, 0, TAU, 100, color, border_width, true)


func _process(delta):
	if expand_timer < expand_duration:
		expand_timer += delta
		var t = expand_timer / expand_duration
		border_radius = lerp(border_radius, target_border_radius, t)
		border_width = lerp(border_width, target_border_width, t)
		queue_redraw()


func expand_circle(new_radius: float, new_width: float, duration: float):
	target_border_radius = new_radius
	target_border_width = new_width
	expand_duration = duration
	expand_timer = 0.0
