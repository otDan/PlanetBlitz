extends Node2D

var thruster: Sprite2D
@export var radius: float = 150.0  # Adjust the radius as needed
@export var targetRotation: float = PI  # Set the target rotation for left side
@export var rotationSpeed: float = 30.0  # Adjust the rotation speed as needed

func _ready():
	thruster = $Planet/Thruster
	thruster.rotation = targetRotation
	thruster.position = Vector2(radius, 0).rotated(thruster.rotation) + $Planet.position

func _process(delta):
	var inputDirection = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		inputDirection.y -= 1.0
	elif Input.is_action_pressed("ui_down"):
		inputDirection.y += 1.0
	if Input.is_action_pressed("ui_left"):
		inputDirection.x -= 1.0
	elif Input.is_action_pressed("ui_right"):
		inputDirection.x += 1.0

	if inputDirection != Vector2.ZERO:
		targetRotation = inputDirection.angle() + PI

	thruster.rotation = lerp_angle(thruster.rotation, targetRotation, rotationSpeed * delta)
	thruster.position = Vector2(radius, 0).rotated(thruster.rotation) + $Planet.position

func lerp_angle(start: float, end: float, weight: float) -> float:
	var difference = fmod(end - start + 3 * PI, 2 * PI) - PI
	return fmod(start + difference * weight + 2 * PI, 2 * PI) - PI
