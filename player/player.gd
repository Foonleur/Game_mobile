extends Area2D

export var rot_speed = 2.6
export var thrust = 500
export var max_vel = 400
export var friction = 0.65


var screen_size = Vector2(0,0)
var pos = Vector2(0,0)
var vel = Vector2(0,0)
var acc = Vector2(0,0)
var rot = 0

func _ready():
	screen_size = get_viewport_rect().size
	pos = screen_size / 2
	set_process(true)




func _on_up_pressed():
	pass # Replace with function body.


func _on_down_pressed():
	pass # Replace with function body.




func _on_rigth_pressed():
	pass # Replace with function body.
