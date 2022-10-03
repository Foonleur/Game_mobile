extends KinematicBody2D



onready var joystick = get_parent().get_node("joystick_button")

func _process(delta):
	move_and_slide(joystick.get_value() * 300)

