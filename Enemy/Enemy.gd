#this is the enemy.gd
#this is the code for the enemies to be able to work
#this code consists of enemy movement
#enemy shooting
#how many bullets can be on the screen at a time
extends KinematicBody2D

var bullet = preload("res://Bullet-Enemy/Bullet-Enemy.tscn")


	
func _ready():
	$Area2D.connect("area_entered", self, "_colliding")
	

func _colliding(area):
	if area.is_in_group("right"):
		#print("emenies collide right")
		get_parent().global_position.y += 10
		get_parent().speed = -200
	if area.is_in_group("left"):
		#print("emenies collide left")
		get_parent().global_position.y += 10
		get_parent().speed = 200

func _process(delta):
#	while (true):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(0.5, 1)
	#print("time: ",my_random_number)
	yield(get_tree().create_timer(my_random_number), "timeout")
	if GlobalVariables.enemyBulletInstanceCount < 50:
		var bulletInstance = bullet.instance()
		
		bulletInstance.position = Vector2(global_position.x, global_position.y+20)
		get_tree().get_root().add_child(bulletInstance)
