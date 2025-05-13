extends CharacterBody2D

@export var speed = 400 #need to figure out why this is not working
@onready var animationSprite = $AnimatedSprite2D
var jump_speed = -250000
const GRAVITY = 200.0

# Called when the node enters the scene tree for the first time.
func _ready():
	animationSprite.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		animationSprite.flip_h = true
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		animationSprite.flip_h = false
		velocity.x -= speed
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = delta * jump_speed
		
		
	position += velocity * delta
	
func _physics_process(delta):
	velocity.y += delta * GRAVITY
	move_and_slide()
	
	
