extends KinematicBody2D

var speed := 200
var jumpForce := 500
var gravidade := 800

var velocity := Vector2.ZERO
var grounded := false
onready var Sprite := $Sprite



var screensize

func _ready():
	screensize = get_viewport_rect().size


func _physics_process(delta: float):
	velocity.x = 0
	if Input.is_action_pressed("d"):
		velocity.x += speed
	if Input.is_action_pressed("a"):
		velocity.x -= speed
	
	velocity.y += gravidade * delta
	
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y -= jumpForce
	if Input.is_action_just_pressed("w") and is_on_floor():
		velocity.y -= jumpForce
		
	if velocity.x > 0:
		Sprite.flip_h = false
	if velocity.x < 0:
		Sprite.flip_h = true
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
	position.x = clamp(position.x, 25, screensize.x - 25)
	#position.y = clamp(position.y, 25, screensize.y - 25)

func _on_Coins_body_entered(body):
	$coins.hide()
