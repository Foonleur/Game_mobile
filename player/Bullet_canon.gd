extends RigidBody2D

onready var Kill_time =$killtime



func _on_Bullet_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
		queue_free()


func _on_killtime_timeout():
	queue_free()
