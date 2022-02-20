extends KinematicBody2D

var movement_speed = 750 
var bulletSource = preload ("res://Bullet/Bullet.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)

func _physics_process(delta):
	if Input. is_action_pressed("ui_left"):
		if position.x > 10:
			move_and_collide(Vector2(-movement_speed *delta, 0))
	if Input. is_action_pressed("ui_right"):
		if position.x < 1250 :
			move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_up"):
		if postion.y > 10:
			mover_and_collide(Vector2(0, -movement_speed * deelta))
	if INput.is_astion_pressed("ui_down"):
		if position.y <640:
			move_and_collide(Vector2(0, movement_speed * delta))
			
>func _process(delta):
