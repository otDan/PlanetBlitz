extends CharacterBody2D
class_name Player

@export var target_rotation: float = PI  # Set the target rotation for left side
@export var rotation_speed: float = 1.0  # Adjust the rotation speed as needed
@export var base_acceleration: float = 150.0  # Adjust the acceleration as needed
@export var deceleration: float = 2.0  # Adjust the deceleration as needed

@export var planet: Sprite2D
@export var weapon: Weapon
@export var thruster: Node2D
@export var thruster_audio: AudioStreamPlayer2D
@export var thruster_particles: GPUParticles2D
@export var thruster_particles_2: GPUParticles2D
@export var level_points: Node2D
@export var border: Border

@export var controllable = false

var radius: float = 100.0 :
	get: return _get_radius()
var computed_velocity: Vector2 = Vector2.ZERO

var health = 3
var level = 1
var xp = 0
var next_level_xp = 100
var speed = 1
var fire_rate = 1

var _speed_gain_per_level = 10
var _fire_rate_per_level = 1

var acceleration: float = 1.0:
	get:
		return base_acceleration + (speed * _speed_gain_per_level)

var shooting_cooldown: float = 0.0


func _ready():
	PlayerHandler.player = self
	thruster.rotation = target_rotation
	thruster.position = Vector2(radius, 0).rotated(thruster.rotation) + planet.position
	level_points.position = Vector2(radius, 0).rotated(thruster.rotation + PI) + planet.position


func _process(delta):
	if not controllable:
		thruster_particles.emitting = false
		thruster_particles_2.emitting = false
		return
	
	# TODO: Add cooldown to shooting automatically using the fire_rate
	if shooting_cooldown > 0:
		shooting_cooldown -= delta
	else:
		weapon.shoot()
		shooting_cooldown = 1.0 / fire_rate
		
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
		self.velocity = self.velocity.lerp(desired_velocity, delta)
	else:
		self.velocity = self.velocity.lerp(Vector2.ZERO, deceleration * delta)
	
	if circle_intersects_ring(self.position, radius, border.position, border.border_radius - (border.border_width / 2) + 10):
		velocity *= -1.1
	
	move_and_slide()
	

func damage():
	if health - 1 > 0:
		health -= 1
		return
	
	# TODO: Handle death
	
	
func circle_intersects_ring(circle_center, circle_radius, ring_center, ring_radius):
	var distance = sqrt((ring_center[0] - circle_center[0]) ** 2 + (ring_center[1] - circle_center[1]) ** 2)

	if distance < circle_radius + ring_radius and distance + circle_radius > ring_radius and distance - circle_radius < ring_radius:
		return true
	else:
		return false
		

func add_xp(amount: int):
	if xp + amount > next_level_xp:
		level+=1
		add_xp(amount)
	elif xp + amount == next_level_xp:
		level+=1
	else:
		xp += amount


func _get_radius():
	return planet.get_rect().size.x / 2 * 1.2
