extends Node2D

const ANIM_SPEED : float = 15.0
const MOVE_SPEED : float = 50.0

onready var sprite = $Sprite
onready var particles = $Particles2D
onready var timer = $Timer_Expire

onready var anim_index : float = 0.0

func _process(delta : float) -> void:
	anim_index += delta * ANIM_SPEED
	sprite.frame = clamp(anim_index, 0.0, (sprite.hframes * sprite.vframes) - 1)
	global_position.x -= delta * MOVE_SPEED

func _on_Timer_Expire_timeout():
	queue_free()
	
func _ready() -> void:
	particles.emitting = true
	timer.start()
