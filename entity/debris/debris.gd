extends StaticBody2D
class_name Debris

@export var sprite: Sprite2D

var rotationSpeed = randf_range(-10, 10)


func _ready():
	self.scale = self.scale * randf_range(0.8, 1.2)
	sprite.rotation = randf_range(0, 360)


func _process(delta: float) -> void:
	sprite.rotation += rotationSpeed * delta
