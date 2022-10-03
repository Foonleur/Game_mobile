extends Node2D

signal move(target)

func move(target):
	var move_tween = get_node("move_tween")
	move_tween.interpolate_property(self, "position", position, target, 3, Tween.TRANS_QUINT, Tween.EASE_OUT)
	move_tween.start()
