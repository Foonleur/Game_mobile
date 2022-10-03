extends KinematicBody2D

var direction = Vector2.ZERO
var speed = 300

signal shoot
signal health_changed
signal dead

export (PackedScene) var Bullet
export (float) var gun_cooldown
export (int) var health

var can_shoot = true
var alive = true

func _ready():
	$gun_time.wait_time = gun_cooldown


func _process(delta: float) -> void:
	move_and_slide(direction * speed)


func _on_joystick_002_swipe_detect(swipe_direction):
	direction = swipe_direction.normalized()
	$".".rotation_degrees = rad2deg(swipe_direction.angle())

func _on_joystick_002_swipe_end():
	direction = Vector2.ZERO


