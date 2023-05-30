extends Sprite2D

var noise_texture: NoiseTexture2D
var noise_offset: Vector3 = Vector3.ZERO


func _ready():
	$Clouds.texture.noise.seed = randi_range(0, 100000)
	$Mountains.texture.noise.seed = randi_range(0, 100000)
	$Water.texture.noise.seed = randi_range(0, 100000)
	noise_texture = $Clouds.texture

func _process(delta: float):
	# Update the offset based on time or other variables
	noise_offset += Vector3.ONE * delta

	# Set the offset in the noise texture
	noise_texture.noise.offset = noise_offset
	print(noise_texture.noise.offset)
