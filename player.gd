extends Node2D

@export var radius: float = 100.0  # Adjust the radius as needed
@export var targetRotation: float = PI  # Set the target rotation for left side
@export var rotationSpeed: float = 15.0  # Adjust the rotation speed as needed
@export var acceleration: float = 150.0  # Adjust the acceleration as needed
@export var deceleration: float = 2.0  # Adjust the deceleration as needed

var thruster: Sprite2D
var velocity: Vector2 = Vector2.ZERO


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

	if inputDirection != Vector2.ZERO:
		var desiredVelocity = (thruster.position - $Planet.position).normalized() * acceleration
		velocity = velocity.lerp(desiredVelocity, delta)
	else:
		velocity = velocity.lerp(Vector2.ZERO, deceleration * delta)

	position -= velocity * delta
