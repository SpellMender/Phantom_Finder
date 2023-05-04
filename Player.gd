extends Area2D


export var speed = 400
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	set_screen_size(get_viewport_rect().size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_player(get_move_vector(), delta)


func move_player(velocity, delta):
	if velocity.length() > 0:
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
		
		#$AnimatedSprite.play()
		
	#else:
		#$AnimatedSprite.stop()


func set_screen_size(size):
	screen_size = size


func get_move_vector():
	var velocity = Vector2.ZERO
	var anim = ""
	var flip_h = false

	# prepare velocity and animation data
	if Input.is_action_pressed("move_up"):
		anim = "move_up"
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		anim = "move_down"
		velocity.y += 1		
	if Input.is_action_pressed("move_left"):
		flip_h = true
		anim = "move_horizontal"
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		flip_h = false
		anim = "move_horizontal"
		velocity.x += 1
	
	# normalize velocity if we are moving
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	# set idle animation state if we are not moving
	elif $AnimatedSprite.animation != "idle":
		flip_h = false
		anim = "idle"
	
	# assign animation states
	if $AnimatedSprite.flip_h != flip_h:
		$AnimatedSprite.flip_h = flip_h
	if $AnimatedSprite.animation != anim:
		$AnimatedSprite.play(anim) # call play() only once at the end to prevent frame locking
	
	return velocity


