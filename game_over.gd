extends Node2D

var score
# Called when the node enters the scene tree for the first time.
func _ready():
	score = Global.get_score()
	$score_label.text = "Score: " + str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
