extends Node2D

@export var radius: float = 100.0  # Adjust the radius as needed
@export var target_rotation: float = PI  # Set the target rotation for left side
@export var rotation_speed: float = 1.0  # Adjust the rotation speed as needed
@export var acceleration: float = 150.0  # Adjust the acceleration as needed
@export var deceleration: float = 2.0  # Adjust the deceleration as needed

@export var thruster: Sprite2D
@export var thruster_audio: AudioStreamPlayer2D

var velocity: Vector2 = Vector2.ZERO


func _ready():
	thruster.rotation = target_rotation
	thruster.position = Vector2(radius, 0).rotated(thruster.rotation) + $Planet.position


func _process(delta):
	var input_direction = InputHandler.input_direction

	if input_direction != Vector2.ZERO:
		target_rotation = input_direction.angle() + PI
		thruster.rotation = lerp_angle(thruster.rotation, target_rotation, rotation_speed * delta)
		thruster.position = Vector2(radius, 0).rotated(thruster.rotation) + $Planet.position
		if not thruster_audio.playing:
			thruster_audio.play()
	else:
		thruster_audio.stop()
		

	if input_direction != Vector2.ZERO:
		var desired_velocity = (thruster.position - $Planet.position).normalized() * acceleration
		velocity = velocity.lerp(desired_velocity, delta)
	else:
		velocity = velocity.lerp(Vector2.ZERO, deceleration * delta)

	self.position -= velocity * delta
