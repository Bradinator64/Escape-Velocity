extends Area2D

export var speed = 400
var screen_size



# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("player_right"):
		velocity.x += 1
	if Input.is_action_pressed("player_left"):
		velocity.x -= 1
	if Input.is_action_pressed("player_up"):
		velocity.y -= 1
	if Input.is_action_pressed("player_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		#$AnimatedSprite.play()
	#else:
		#$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	#if velocity.x != 0:
		#if velocity.x >= 0:
			#$AnimatedSprite.animation = "right"
		#else:
			#$AnimatedSprite.animation = "left"
	#if velocity.y != 0:
		#if velocity.y < 0:
			#$AnimatedSprite.animation = "up"
		#else:
			#$AnimatedSprite.animation = "down"
			
