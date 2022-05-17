extends Control

export(int) var countdownmax
var currentTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.scoringInformation["currentScore"] = 0
	GlobalVariables.enemyBulletInstanceCount = 0
	GlobalVariables.playerHealth = 2
	currentTimer = countdownmax
	$HUD/Countdown.text = str(currentTimer)
	
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		$HUD/CurrentScoreLabel.text = ("Score: " + str(GlobalVariables.scoringInformation["currentScore"]))
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("GameOver")


func _process(delta):
	if get_tree().get_nodes_in_group("enemy").size() == 0:
		print("Win")
		get_tree().change_scene("res://Win.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
