extends CharacterBody2D

@onready var king_player: CharacterBody2D = $"../king_player"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var speed = 50
@export var dir_range = 200
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var ray_cast_2d: RayCast2D = $RayCast2D
var is_attacking = false
var player = null
@onready var animated_pig: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	player = get_tree().get_first_node_in_group("player")
	
	if player == null:
		return
	if is_attacking:
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
				
	if ray_cast_2d.is_colliding():
		var targer = ray_cast_2d.get_collider()
		
		if targer is CharacterBody2D:
			king_player.die()
			attack()

	if ray_cast_2d_2.is_colliding():
		var targer = ray_cast_2d_2.get_collider()
		
		if targer is CharacterBody2D:
			attack()
			king_player.die()
func attack():
	if is_attacking:
		return

	is_attacking = true
	animated_pig.play("attack")
