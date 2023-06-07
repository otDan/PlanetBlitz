class_name Weapon
extends Node2D

@export var player: Player
@export var bullet: PackedScene
@export var bullet_speed: float = 500
@export var shoot_posiiton: Node2D

@export var shoot_sound: Resource


func _process(delta: float) -> void:
	# Get the mouse position relative to the root node
	var mouse_position = get_global_mouse_position() - player.global_position

	# Calculate the angle between the mouse position and the x-axis
	var angle = mouse_position.angle()

	# Calculate the new position of the sprite based on the angle and radius
	var new_position = Vector2(cos(angle), sin(angle)) * (player.radius)

	# Update the position of the sprite
	self.position = new_position

	# Calculate the rotation angle based on the mouse position
	self.rotation = angle


func shoot() -> void:
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = shoot_posiiton.global_position
	bullet_instance.global_rotation = shoot_posiiton.global_rotation
	get_parent().get_parent().get_parent().add_child(bullet_instance)

	var velocity = Vector2(cos(self.rotation), sin(self.rotation)) * bullet_speed

	if bullet_instance is RigidBody2D:
		bullet_instance.linear_velocity = velocity

	AudioHandler.play_sound(shoot_sound)
