#this code is the code for the win game scene that shows your score
extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str((GlobalVariables.scoringInformation["currentScore"]))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
