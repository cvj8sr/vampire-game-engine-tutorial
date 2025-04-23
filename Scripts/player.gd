extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D2
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var timer: Timer = $Timer

var blood_total = 0
var speed = 100.0
var jump_velocity = -200.0
var timer_count = 0
var floor_count = 0
var jump_count = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		if timer_count == 0:
			timer_count = 1
			timer.start()
 
	if is_on_floor():
		timer_count = 0
		floor_count = 0
		jump_count = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump") && floor_count == 0 && jump_count == 0:
		velocity.y = jump_velocity
		audio_stream_player_2d.play()
		jump_count = 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
func add_blood():
	speed = speed + 15
	jump_velocity = jump_velocity - 25


func _on_timer_timeout() -> void:
	floor_count = 1
