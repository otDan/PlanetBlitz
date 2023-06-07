extends Node

var input_direction = Vector2.ZERO


func _process(delta):
	input_direction = Vector2.ZERO

#	var stickInput = Vector2(Input.get_joy_axis(0, JOY_AXIS_LEFT_X), Input.get_joy_axis(0, JOY_AXIS_LEFT_Y))
#	input_direction = stickInput.normalized()

	if Input.is_action_pressed("ui_up"):
		input_direction.y -= 1.0
	elif Input.is_action_pressed("ui_down"):
		input_direction.y += 1.0
	if Input.is_action_pressed("ui_left"):
		input_direction.x -= 1.0
	elif Input.is_action_pressed("ui_right"):
		input_direction.x += 1.0
