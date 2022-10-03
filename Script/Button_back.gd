extends Control
 
onready var sound_back = $Back_button


func _on_TextureButton_pressed():
	sound_back.play()
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().change_scene("res://Screen/main menu/main_menu.tscn")
	


