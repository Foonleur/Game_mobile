extends Node2D

onready var Animaton_text = $AnimationPlayer

func _ready():
	Animaton_text.play("Text_UP_Down")
