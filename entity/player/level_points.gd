extends Node2D

# Properties
@export var speed: float = 100.0
@export var distance_between_nodes: float = 50.0
@export var size_x: float = 50.0
var size_y: float = 50.0 :
	get:
		return size_x / 2

var nodes: Array = []
var time: float = 0.0


func _process(delta: float):
	var nodes = get_children()
	time += delta * speed

	for i in range(nodes.size()):
		var node = nodes[i]
		var t = time + i * distance_between_nodes

		var x = sin(t / size_x) * size_x
		var y = sin(t / size_y) * size_y

		node.position = Vector2(x, y)
