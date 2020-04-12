extends Area2D

var screen_size
export var speed = 500

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	position += Vector2(speed * delta, 0)
	if position.x >= screen_size.x:
		queue_free()
