extends Area2D
var speed = 1
var xPos = 600
var yPos = 320

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	xPos -= speed
	position = Vector2(xPos,yPos)
	if (xPos <= -100):
		queue_free()


func _on_body_entered(body):
	get_tree().call_group("game", "game_over")
