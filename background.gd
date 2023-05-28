extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_stars(100, Vector2(0.5, 0.75), Rect2(Vector2(0, 0), DisplayServer.screen_get_size()))
	pass # Replace with function body.


func generate_stars(star_count: int, star_size_range: Vector2, spawn_area: Rect2):
	var parallaxLayer := $ParallaxLayer  # Reference to the ParallaxLayer node
	
	for i in range(star_count):
		var starInstance := Star.new()
		starInstance.size = randf_range(star_size_range.x, star_size_range.y)
		
		var starPosition := Vector2(randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
									randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y))
		starInstance.position = starPosition
		
		parallaxLayer.add_child(starInstance)
