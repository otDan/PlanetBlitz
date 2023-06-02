extends Node2D

@export var additional_radius: float = 200
@export var speed: float = 100


func _process(delta: float):
	var debris = get_children()
	var radius = get_parent()._get_radius() + additional_radius
	var angle_step = TAU / debris.size()
	var current_time = Time.get_ticks_msec() / 1000.0
	
	for i in range(debris.size()):
		var angle = angle_step * i
		var target_pos = Vector2(radius * cos(angle), radius * sin(angle))

		var scrap = debris[i]
		var current_position = scrap.position
		var distance_to_target = current_position.distance_to(target_pos)

		if distance_to_target > 1:
			var direction = (target_pos - current_position).normalized()
			scrap.position += direction * speed * delta

		# Wrap around the circle if the sprite goes beyond 2*PI
		if angle > TAU:
			angle -= TAU

		# Calculate the previous position based on the current time
		var previous_pos = Vector2(radius * cos(angle - current_time), radius * sin(angle - current_time))
		
		# Interpolate the sprite's position towards the previous position
		scrap.position = scrap.position.lerp(previous_pos, delta * speed)
