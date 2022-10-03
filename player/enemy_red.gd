extends KinematicBody2D

signal health_changed
signal dead

var direction = Vector2.ZERO

onready var parent = get_parent()

export (PackedScene) var Bullet
export (int) var speed
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var health
export (int) var detect_radius


var velocity = Vector2()
var can_shoot = true
var alive = true
var target = null

func _ready():
	$gun_time.wait_time = gun_cooldown
	$detect_Radius/CollisionShape2D.shape.radius = detect_radius


func control(detal):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * detal)
		position = Vector2()
	else:
		pass

func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		

func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)


func _on_detect_Radius_body_entered(body):
	target = body


func _on_detect_Radius_body_exited(body):
	if body == target:
		target = null
