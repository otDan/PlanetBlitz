extends ParallaxBackground


func _ready():
	var gen_area = Rect2(0, 0, 3000, 3000)
	generate_stars($FarStars, 650, Vector2(1, 1.25), gen_area)
	generate_stars($Stars, 220, Vector2(1, 2.55), gen_area)
	generate_stars($CloseStars, 95, Vector2(1.5, 5), gen_area)


func generate_stars(parallaxLayer: ParallaxLayer, star_count: int, star_size_range: Vector2, spawn_area: Rect2):
	for i in range(star_count):
		var starInstance := Star.new()
		starInstance.size = randf_range(star_size_range.x, star_size_range.y)
		
		var starPosition := Vector2(randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
									randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y))
		starInstance.position = starPosition
		
		parallaxLayer.add_child(starInstance)


func _process(delta):
	var viewportRect = Rect2(Vector2.ZERO, get_viewport().get_visible_rect().size)
	
	var stars = []
	stars.append_array($FarStars.get_children())
	stars.append_array($Stars.get_children())
	stars.append_array($CloseStars.get_children())
	
	for star in stars:
		var starPosition = star.global_position
		if viewportRect.has_point(starPosition):
			star.queue_redraw()
