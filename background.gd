extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_stars($FarStars, 150, Vector2(0.5, 0.75), Rect2(Vector2(0, 0), DisplayServer.screen_get_size()))
	generate_stars($Stars, 70, Vector2(1, 1.25), Rect2(Vector2(0, 0), DisplayServer.screen_get_size()))
	generate_stars($CloseStars, 20, Vector2(2, 2.5), Rect2(Vector2(0, 0), DisplayServer.screen_get_size()))


func generate_stars(parallaxLayer: ParallaxLayer, star_count: int, star_size_range: Vector2, spawn_area: Rect2):
	for i in range(star_count):
		var starInstance := Star.new()
		starInstance.size = randf_range(star_size_range.x, star_size_range.y)
		
		var starPosition := Vector2(randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
									randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y))
		starInstance.position = starPosition
		
		parallaxLayer.add_child(starInstance)
