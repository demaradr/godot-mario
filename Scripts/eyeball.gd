extends Node2D


const SPEED = 30
var direction = 1
var player_chase = false
var player = null

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _process(delta: float):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
		
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
		
	if player_chase:
		position += (player.position - position)/SPEED
		
		animated_sprite_2d.play("flying")
		
		if(player.position.x - position.x) < 0:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
	else:
		animated_sprite_2d.play("idle")
		


func _on_detection_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true
	


func _on_detection_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false
