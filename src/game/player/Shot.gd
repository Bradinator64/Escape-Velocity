extends Area2D

onready var sprite = $Sprite

const ANIM_SPEED : float = 15.0

var screen_size
export var speed = 500

onready var anim_index : float = 0.0

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	anim_index += delta * ANIM_SPEED
	sprite.frame = int(fmod(anim_index, sprite.hframes))
	position += Vector2(speed * delta, 0)
	if position.x >= screen_size.x:
		queue_free()
