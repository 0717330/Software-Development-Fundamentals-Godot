#this script runs for each enemy bullet that has been shot by the enemy
#shoots bullet down
#detects collisions. If enemy object - ignore
#if the enemy bullet goes off the screen it deletes itself
#if the enemy bullet is colided with the player it with delete and deal damage to the player

extends KinematicBody2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.enemyBulletInstanceCount += 1
	set_physics_process(true)


func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, +speed*delta*0.4))
	if (collidedObject):
		if "Enemy" in collidedObject.collider.name:
			pass
		elif "Player" in collidedObject.collider.name:
			GlobalVariables.playerHealth -= 1
			print(GlobalVariables.playerHealth)
			queue_free()

		else:
			queue_free()
			GlobalVariables.enemyBulletInstanceCount -= 1
			print("Enemy Bullets: ", GlobalVariables.enemyBulletInstanceCount)
