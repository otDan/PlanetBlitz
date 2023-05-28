extends Camera2D

@export var smoothness: float = 1.0
@export var target: Node2D

var target_position: Vector2


func _process(delta: float) -> void:
	if target:
		var current_position = self.global_position
		var target_global_position = target.global_position
		var interpolated_position = current_position.lerp(target_global_position, smoothness * delta)
		self.global_position = interpolated_position


func set_target(new_target: Node2D) -> void:
	target = new_target
