extends Control

onready var sound_click = $Game_audio/Efftect/Select
onready var sound_back = $Game_audio/Efftect/Back



func _on_exit_TouchScreenButton_pressed():
	sound_back.play()
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().quit()


	

func _on_infor_TouchScreenButton_pressed():
	sound_click.play()
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://Screen/main menu/infor.tscn")


func _on_TouchScreenButton_pressed():
	pass


func _on_play_pressed():
	sound_click.play()
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://Screen/Level_all/menu_level.tscn")


func _on_sond_change_screen_timeout():
	pass

