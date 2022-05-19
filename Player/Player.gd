#player.gd is that code that runs the player in the game
#it consists of control imputs such as left, right, fire, and switch firing modes
#in the code it also has a bit of health code such as max health
#the player.gd also controls what direction the bullet goes and how its fired
#also controls movement speed
extends KinematicBody2D

var movement_speed = 750 
var bulletSource = preload ("res://Bullet/Bullet.tscn")
var rapidFire = false

func _ready():
	set_process(true)
	set_physics_process(true)
onready var CooldownTimer : = $CooldownTimer
func _physics_process(delta):
	if Input. is_action_pressed("ui_left"):
		if position.x > 10:
			move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input. is_action_pressed("ui_right"):
		if position.x < 1250:
			move_and_collide(Vector2(movement_speed * delta, 0))
			
func _process(delta):
	if GlobalVariables.playerHealth == 0:
		get_tree().change_scene("res://Lose.tscn")

	if Input.is_action_just_pressed("ui_Ctrl"):
		rapidFire = !rapidFire
	if rapidFire:
		if Input.is_action_pressed("fire") and CooldownTimer.is_stopped():
			var bulletInstance = bulletSource.instance()
			bulletInstance.position = Vector2(position.x, position.y-20)
			get_tree().get_root().add_child(bulletInstance)
			CooldownTimer.start()
	else:
		if Input.is_action_just_pressed("fire"):
			var bulletInstance = bulletSource.instance()
			bulletInstance.position = Vector2(position.x, position.y-20)
			get_tree().get_root().add_child(bulletInstance)
