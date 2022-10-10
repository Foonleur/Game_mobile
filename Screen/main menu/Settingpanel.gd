extends Panel

onready var tween =$move_tween
onready var startPos = get_node("StartPos")
onready var destinationPos = get_node("DestinationPos")

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_down") and !tween.is_active():
		tween.interpolate_property(self, "global_position", startPos.global_position,
				destinationPos.global_position, 3, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
