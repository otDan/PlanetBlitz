class_name SoundButton
extends BaseButton

@export var focus_entered_sound: Resource = load("res://audio/ui/button/hover.mp3")
@export var pressed_sound: Resource = load("res://audio/ui/button/press.mp3")
@export var pitch_variation: = 0.2
@export var grab_focus_with_mouse: = true

var delay_timer: Timer
var is_delay_active: = false

var active: = true


func _ready():
	delay_timer = Timer.new()
	delay_timer.wait_time = 0.05
	delay_timer.one_shot = true
	delay_timer.connect("timeout", Callable(self, "_on_delay_timer_timeout"))
	add_child(delay_timer)
	
	connect("focus_entered", Callable(self, "on_focus_entered"))
	connect("pressed", Callable(self, "on_pressed"))
	connect("mouse_entered", Callable(self, "on_mouse_entered"))


func on_focus_entered():
	if active:
		AudioHandler.play_sound(focus_entered_sound, pitch_variation)


func on_pressed():
	if active and is_inside_tree():
		delay_timer.start()
		disabled = true
		is_delay_active = true
		AudioHandler.play_sound(pressed_sound, pitch_variation)


func on_mouse_entered():
	if active:
		if grab_focus_with_mouse:
			if focus_mode == FOCUS_NONE:
				focus_mode = FOCUS_ALL
			grab_focus()
		AudioHandler.play_sound(focus_entered_sound, pitch_variation)


func disable():
	disabled = true
	focus_mode = FOCUS_NONE
	active = false
	is_delay_active = false


func activate():
	disabled = false
	focus_mode = FOCUS_ALL
	active = true


func _on_delay_timer_timeout():
	if is_delay_active:
		disabled = false
		is_delay_active = false
