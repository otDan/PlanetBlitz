extends RigidBody2D


var dead = false


func destroy():
	dead = true
	self.queue_free()


func _on_body_entered(body):
	if body is Enemy:
		body.destroy()
		self.destroy()
