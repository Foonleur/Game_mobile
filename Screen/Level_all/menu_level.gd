extends Control

onready var sound_click = $Game_audio/Efftect/Select



func _on_level_1_pressed():
	sound_click.play()
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().change_scene("res://Screen/Level_all/Level1.tscn")




