extends CanvasLayer

var direction = Vector2.ZERO
var Bullet
var can_shoot = true
var start_pos: Vector2 = Vector2.ZERO
var end_pos: Vector2 = Vector2.ZERO
var valid_pos = false

signal swipe_detect(swipe_direction)
signal swipe_end
signal shoot

onready var js_pos = get_node("background").rect_position
onready var js_bg = get_node("background")
onready var js_handle = get_node("background/handle")


func _input(event: InputEvent) -> void:
	if valid_pos:
		if event is InputEventScreenDrag:
			if start_pos == Vector2.ZERO:
				start_pos =event.position
				
			end_pos = event.position
			var direction = (end_pos - start_pos)
			if direction.length() < 85:
				js_handle.rect_position.x = 65 + direction.length()
				js_handle.rect_pivot_offset.x = 25 - direction.length()
			js_handle.rect_rotation = rad2deg(direction.angle())
			emit_signal("swipe_detect",direction)

func _on_TextureButton_button_down():
	valid_pos = true


func _on_TextureButton_button_up():
	emit_signal("swipe_end")
	js_bg = js_pos
	start_pos = Vector2.ZERO
	end_pos = Vector2.ZERO
	valid_pos = false
	js_handle.rect_position.x = 65
	js_handle.rect_pivot_offset.x = 25

func shoot():
	if can_shoot:
		can_shoot = false
		$gun_time.start()
		emit_signal('shoot', Bullet, direction)

	
func _on_shoot_pressed():
	shoot()
