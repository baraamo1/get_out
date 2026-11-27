
extends CharacterBody2D

@onready var playeranimation: AnimatedSprite2D = $AnimatedSprite2D

@export var speed = 100
var v2 = Vector2.ZERO


func _physics_process(delta):
	if is_dead:
		return
	v2 = Vector2.ZERO

	if Input.is_action_pressed("up"):
		v2.y = -speed

	elif Input.is_action_pressed("down"):
		v2.y = speed

	if Input.is_action_pressed("left"):
		v2.x = -speed
		playeranimation.flip_h = true
	elif Input.is_action_pressed("right"):
		v2.x = speed
		playeranimation.flip_h = false
	velocity = v2.normalized() * speed
	move_and_slide()

	if v2 != Vector2.ZERO:
		if playeranimation.animation != "run":
			playeranimation.play("run")
	else:
		if playeranimation.animation != "idle":
			playeranimation.play("idle")
			
var is_dead = false
func die():
	if is_dead:
		return
	is_dead = true
	playeranimation.play("dead")
