extends Node2D

var color: Color = Color.ANTIQUE_WHITE
var last_alpha = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
#	get_parent().get_node("Player").position = Vector2(30000, 0)
	pass


func _draw():
	draw_arc(position, 300, 0, TAU, 100, Color.ANTIQUE_WHITE, 5, true)
#	draw_arc(position, 1000, 0, TAU, 1000, Color.ANTIQUE_WHITE, 20, true)
#	draw_arc(position, 30000, 0, TAU, 1000, Color.ANTIQUE_WHITE, 20, true)
#	draw_arc(position, 30100, 0, TAU, 1000, color, 200, true)
#	draw_arc(position, 100000, 0, TAU, 100000, Color.ANTIQUE_WHITE, 20, true)
#	draw_arc(position, 300000, 0, TAU, 300, Color.ANTIQUE_WHITE, 20, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	color.a = 0.1
	if color.a != last_alpha:
		last_alpha = color.a
		queue_redraw()
