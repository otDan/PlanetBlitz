class_name Enemy
extends RigidBody2D


var dead = false


func die():
	dead = true
	queue_free()
