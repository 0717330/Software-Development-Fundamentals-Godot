extends Node

var bulletInstanceCount = 0 # Keeps track of how many bullet instances are current
var enemyBulletInstanceCount = 0
var playerHealth = 2


var scoringInformation = {
	"currentScore": 0,
	"currentPlayer": "user",
	"highScore": 0,
	"highScorePlayerName" : "winner"
}
