extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	var gen_area = Rect2(0, 0, 4000, 4000)
	generate_stars($FarStars, 500, Vector2(0.5, 0.75), gen_area)
	generate_stars($Stars, 270, Vector2(1, 1.25), gen_area)
	generate_stars($CloseStars, 80, Vector2(2, 3), gen_area)


func generate_stars(parallaxLayer: ParallaxLayer, star_count: int, star_size_range: Vector2, spawn_area: Rect2):
	for i in range(star_count):
		var starInstance := Star.new()
		starInstance.size = randf_range(star_size_range.x, star_size_range.y)
		
		var starPosition := Vector2(randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
									randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y))
		starInstance.position = starPosition
		
		parallaxLayer.add_child(starInstance)
