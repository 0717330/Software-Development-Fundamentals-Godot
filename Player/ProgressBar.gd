extends ProgressBar

func _ready():
	self.value = self.max_value


func _process(delta):
	self.value = GlobalVariables.playerHealth
