extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer

var can_coyote_jump = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() && (can_coyote_jump == false):
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() || can_coyote_jump:
			velocity.y = JUMP_VELOCITY
			if can_coyote_jump:
				can_coyote_jump = false
				
		
	# Get the input direction and handle the movement/deceleration.
	#Get the input direction: -1, 0, 1# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	#Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var was_on_floor = is_on_floor()
	move_and_slide()
	if was_on_floor and !is_on_floor() and velocity.y >=0:
		can_coyote_jump = true
		coyote_timer.start()
	
func _on_coyote_timer_timeout() -> void:
	can_coyote_jump = false
