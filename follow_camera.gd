extends Camera2D

# Lower cap for the `_zoom_level`.
@export var min_zoom := 0.5
# Upper cap for the `_zoom_level`.
@export var max_zoom := 2.0
# Controls how much we increase or decrease the `_zoom_level` on every turn of the scroll wheel.
@export var zoom_factor := 0.1

@export var target: Node2D
@export var smoothness: float = 1.0

var _zoom_level: float = 1.0
var target_position: Vector2


func _ready() -> void:
	_set_zoom_level(_zoom_level)


func _process(delta: float) -> void:
	if target:
		var current_position = self.global_position
		var target_global_position = target.global_position
		var interpolated_position = current_position.lerp(target_global_position, smoothness * delta)
		self.global_position = interpolated_position


func _unhandled_input(event):
	if event.is_action_pressed("ui_zoom_in"):
		_set_zoom_level(_zoom_level + zoom_factor)
	if event.is_action_pressed("ui_zoom_out"):
		_set_zoom_level(_zoom_level - zoom_factor)


func set_target(new_target: Node2D) -> void:
	target = new_target


func _set_zoom_level(value: float) -> void:
	_zoom_level = clamp(value, min_zoom, max_zoom)
	_update_zoom()


func _update_zoom() -> void:
	self.zoom = Vector2(_zoom_level, _zoom_level)
