extends Node

@export var border: Border
@export var avoid_radius: float = 50.0
@export var enemy_scene: PackedScene
@export var player: Node2D
@export var max_attempts: int = 10
@export var delay_between_attempts: float = 0.5


func _ready():
	randomize()


func spawn_enemy():
	var spawn_position = Vector2.ZERO
	var spawn_valid = false
	var attempt_count = 0

	while not spawn_valid and attempt_count < max_attempts:
		spawn_position = Vector2(randf_range(-border.border_radius, border.border_radius),
								randf_range(-border.border_radius, border.border_radius))

		var distance_to_player = spawn_position.distance_to(player.position)
		if distance_to_player > avoid_radius:
			spawn_valid = true

		attempt_count += 1

		if not spawn_valid and attempt_count < max_attempts:
			await(get_tree().create_timer(delay_between_attempts))

	if spawn_valid:
		var enemy_instance = enemy_scene.instantiate()
		enemy_instance.position = spawn_position
		add_child(enemy_instance)
	else:
		print("Failed to find a valid position for enemy spawn.")
