
extends CharacterBody2D

@onready var playeranimation: AnimatedSprite2D = $AnimatedSprite2D
@export var speed = 100
var v2 = Vector2.ZERO


func _physics_process(delta):
	if Input.is_action_pressed("up"):
		v2.y = -speed
		playeranimation.animation_finished.connect(_on_animation_finished)
		playeranimation.play("run")
		
	elif Input.is_action_pressed("down"):
		v2.y = speed
		playeranimation.play("run")
	
	else :
		v2.y = 0
		playeranimation.play("idle")
		
	if Input.is_action_pressed("left"):
		v2.x = -speed
		playeranimation.play("run")
		
	elif Input.is_action_pressed("right"):
		v2.x = speed
		playeranimation.play("run")
		
	else :
		v2.x = 0		
		playeranimation.play("idle")
		
	velocity = v2.normalized() * speed	
	move_and_slide()
