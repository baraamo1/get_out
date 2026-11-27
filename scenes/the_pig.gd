extends CharacterBody2D

@export var speed = 50
@export var dir_range = 200

var player = null
@onready var animated_pig: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	player = get_tree().get_first_node_in_group("player")
	
	if player == null:
		return
	
	var distance = global_position.distance_to(player.global_position)
	if distance < dir_range:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		animated_pig.play("run")
		
		if direction.x < 0:
			animated_pig.flip_h = true
		elif direction.x > 0:
			animated_pig.flip_h = false
	else : 
		velocity = Vector2.ZERO
		animated_pig.play("idle")
	move_and_slide()
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
