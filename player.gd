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
	var inputDirection = Vector2.ZERO

#	var stickInput = Vector2(Input.get_joy_axis(0, JOY_AXIS_LEFT_X), Input.get_joy_axis(0, JOY_AXIS_LEFT_Y))
#	inputDirection = stickInput.normalized()

	if Input.is_action_pressed("ui_up"):
		inputDirection.y -= 1.0
	elif Input.is_action_pressed("ui_down"):
		inputDirection.y += 1.0
	if Input.is_action_pressed("ui_left"):
		inputDirection.x -= 1.0
	elif Input.is_action_pressed("ui_right"):
		inputDirection.x += 1.0

	if inputDirection != Vector2.ZERO:
		target_rotation = inputDirection.angle() + PI
		thruster.rotation = lerp_angle(thruster.rotation, target_rotation, rotation_speed * delta)
		thruster.position = Vector2(radius, 0).rotated(thruster.rotation) + $Planet.position
		if not thruster_audio.playing:
			thruster_audio.play()
	else:
		thruster_audio.stop()
		

	if inputDirection != Vector2.ZERO:
		var desiredVelocity = (thruster.position - $Planet.position).normalized() * acceleration
		velocity = velocity.lerp(desiredVelocity, delta)
	else:
		velocity = velocity.lerp(Vector2.ZERO, deceleration * delta)

	position -= velocity * delta
