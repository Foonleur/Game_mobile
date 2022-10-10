extends KinematicBody2D

export (PackedScene) var Bullet

var direction = Vector2.ZERO
var speed = 300
var health: int = 100

signal dead

onready var end_of_gun = $Endofgun
onready var shoot_cooldown = $shootcooldown

export var bullet_speed = 1000
export var fire_rate = 20

export (float) var gun_cooldown


var can_shoot = true
var alive = true

func _ready():
	$joystick_002.connect("Bullet",self,"shoot_ready")

func shoot_ready():
	if shoot_cooldown.is_stopped():
		var bullet_instance =  Bullet.instance()
		bullet_instance.position =$Endofgun.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		shoot_cooldown.start()



func _process(delta: float) -> void:
	move_and_slide(direction * speed)


func _on_joystick_002_swipe_detect(swipe_direction):
	direction = swipe_direction.normalized()
	$".".rotation_degrees = rad2deg(swipe_direction.angle())

func _on_joystick_002_swipe_end():
	direction = Vector2.ZERO

func handle_hit():
	health -=20
	print("player hit!" , health)
