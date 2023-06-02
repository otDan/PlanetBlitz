extends Node

@export var player: Player

@export var fps: Label
@export var memory: Label
@export var nodes: Label

@export var position: Label
@export var speed: Label

@export var debris: PackedScene

var debug_visible = true
var spawn_area = Vector2(800, 600)


func _process(delta):
	if Input.is_action_just_pressed("ui_debug"):
		debug_visible = !debug_visible
		get_child(0).visible = debug_visible
		
	fps.text = "Fps: " + str(Engine.get_frames_per_second())
	memory.text = "Memory: " + str(Performance.get_monitor(Performance.MEMORY_STATIC))
	nodes.text = "Nodes: " + str(Performance.get_monitor(Performance.OBJECT_NODE_COUNT))
	
	position.text = "Position: " + str(round(player.global_position))
	speed.text = "Speed: " + str(roundf(player.velocity.length()))


func _on_randomize_pressed():
	player.get_node("Planet/Planet")._ready()

	
func _on_drebis_pressed():
	var random_position = Vector2(randf_range(0, spawn_area.x), randf_range(0, spawn_area.y))
	var new_debris = debris.instantiate()
	new_debris.position = random_position
	player.get_node("DebrisHolder").add_child(new_debris)


func _on_add_level_point_pressed():
	var new_level_point = Sprite2D.new()
	new_level_point.texture = PlaceholderTexture2D.new()
	player.get_node("PointHolder/Level").add_child(new_level_point)
