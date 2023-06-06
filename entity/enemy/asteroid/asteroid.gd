extends RigidBody2D

@export var attraction_force = 100.0
@export var asteroid_type = "asteroid"

var asteroids

func _ready():
	asteroids = get_tree().get_nodes_in_group(asteroid_type)

func _physics_process(delta):
	var direction_to_player = PlayerHandler.player.global_position - global_position
	var distance = direction_to_player.length()
	direction_to_player = direction_to_player.normalized()
	
	var gravity_force = Vector2.ZERO
	for asteroid in asteroids:
		if asteroid != self:
			var direction_to_asteroid = asteroid.global_position - global_position
			var asteroid_distance = direction_to_asteroid.length()
			direction_to_asteroid = direction_to_asteroid.normalized()
			
			if asteroid_distance > 0:
				gravity_force += direction_to_asteroid * (attraction_force / asteroid_distance)
	
	apply_central_force(gravity_force)
	
	var move_force = direction_to_player * attraction_force
	apply_central_force(move_force)
