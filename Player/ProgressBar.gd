#the progress bar is the bar on the player. and it shows what health you are on
extends ProgressBar

func _ready():
	self.value = self.max_value


func _process(delta):
	self.value = GlobalVariables.playerHealth
