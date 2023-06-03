extends CharacterBody2D
class_name Player

@export var target_rotation: float = PI  # Set the target rotation for left side
@export var rotation_speed: float = 1.0  # Adjust the rotation speed as needed
@export var acceleration: float = 150.0  # Adjust the acceleration as needed
@export var deceleration: float = 2.0  # Adjust the deceleration as needed

@export var planet: Sprite2D
@export var thruster: Node2D
@export var thruster_audio: AudioStreamPlayer2D
@export var thruster_particles: GPUParticles2D
@export var thruster_particles_2: GPUParticles2D
@export var level_points: Node2D

var radius: float = 100.0 :
	get: return _get_radius()
var computed_velocity: Vector2 = Vector2.ZERO


func _ready():
	thruster.rotation = target_rotation
	thruster.position = Vector2(radius, 0).rotated(thruster.rotation) + planet.position
	level_points.position = Vector2(radius, 0).rotated(thruster.rotation + PI) + planet.position


func _process(delta):
	var input_direction = InputHandler.input_direction

	if input_direction != Vector2.ZERO:
		target_rotation = input_direction.angle() + PI
		
		thruster.position = Vector2(radius, 0).rotated(thruster.rotation) + planet.position
		thruster.rotation = lerp_angle(thruster.rotation, target_rotation, rotation_speed * delta)
		
		level_points.position = Vector2(radius + 10, 0).rotated(thruster.rotation + PI) + planet.position
		
		thruster_particles.emitting = true
		thruster_particles_2.emitting = true
		if not thruster_audio.playing:
			AudioHandler.fade_in(thruster_audio, -10)
	else:
		thruster_particles.emitting = false
		thruster_particles_2.emitting = false
		AudioHandler.fade_out(thruster_audio)
		
	var opposite_rotation = thruster.rotation - PI
	level_points.rotation = opposite_rotation

	if input_direction != Vector2.ZERO:
		var desired_velocity = -(thruster.position - planet.position).normalized() * acceleration
		velocity = velocity.lerp(desired_velocity, delta)
	else:
		velocity = velocity.lerp(Vector2.ZERO, deceleration * delta)
		
	move_and_slide()


func _get_radius():
	return planet.get_rect().size.x / 2 * 1.2
