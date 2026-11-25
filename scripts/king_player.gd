extends CharacterBody2D


@export var speed = 100
var v2 = Vector2.ZERO


func _physics_process(delta):
	if Input.is_action_pressed("up"):
		v2.y = -speed
		
	elif Input.is_action_pressed("down"):
		v2.y = speed
	
	else :
		v2.y = 0
		
	if Input.is_action_pressed("left"):
		v2.x = -speed
	
	elif Input.is_action_pressed("right"):
		v2.x = speed
	
	else :
		v2.x = 0		
		
	velocity = v2.normalized() * speed	
	move_and_slide()
