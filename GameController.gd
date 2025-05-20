extends Node
var timer
var score: int = 0
var objectTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	#Load and spawn the player
	var scene = load("res://player.tscn")
	var player = scene.instantiate()
	add_child(player)

	timer = Timer.new()
	timer.timeout.connect(self._on_timer_timeout)
	timer.set_wait_time(0.1) #time in seconds
	timer.set_one_shot(false)
	add_child(timer)
	timer.start()
	
	objectTimer = Timer.new()
	objectTimer.timeout.connect(self._object_on_timer_timeout)
	objectTimer.set_wait_time(5) #time in seconds
	objectTimer.set_one_shot(false)
	add_child(objectTimer)
	objectTimer.start()
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_timer_timeout():
	score += 1 #score = score + 10
	$Label.set_text(str(score))
func _object_on_timer_timeout():
	var scene = load("res://object.tscn")
	var object = scene.instantiate()
	add_child(object)
	
func game_over():
	Global.set_score(score)
	get_tree().change_scene_to_file("res://game_over.tscn")
