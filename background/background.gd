extends ParallaxBackground

@export var camera: Camera2D


func _ready():
	var gen_area = Rect2(0, 0, 3000, 3000)
	generate_stars($FarStars, 700, Vector2(1, 1.25), gen_area)
	generate_stars($Stars, 390, Vector2(1, 2.55), gen_area)
	generate_stars($CloseStars, 85, Vector2(1.5, 5), gen_area)
#	generate_stars($CloseStars, 1, Vector2(10, 15), gen_area)


func generate_stars(parallaxLayer: ParallaxLayer, star_count: int, star_size_range: Vector2, spawn_area: Rect2):
	for i in range(star_count):
		var starInstance := Star.new()
		starInstance.size = randf_range(star_size_range.x, star_size_range.y)
		
		var starPosition := Vector2(randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
									randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y))
		starInstance.position = starPosition
		
		parallaxLayer.add_child(starInstance)


#func _process(delta):	
#	var stars = []
#	stars.append_array($FarStars.get_children())
#	stars.append_array($Stars.get_children())
#	stars.append_array($CloseStars.get_children())
	
#	for star in stars:
#		var star_distance = camera.global_position.distance_to(star.global_position)
#		if star_distance < 100:
#		if star.to_update:
#			star.queue_redraw()
#		print("updating: %s" % [str(star_distance)])
