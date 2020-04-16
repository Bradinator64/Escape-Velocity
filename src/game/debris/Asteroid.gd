extends Area2D

const OBJ_EXPLOSION = preload("res://scenes/game/Explosion.tscn")

onready var sprite = $Sprite

export var velocity = Vector2()

func _process(delta):
	translate(-velocity * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Asteroid_area_entered(area):
	if area.is_in_group("shot") or area.is_in_group("player"):
		var explosion = OBJ_EXPLOSION.instance()
		get_parent().add_child(explosion)
		explosion.global_position = global_position
		queue_free()

func _ready():
	sprite.frame = rand_range(0, sprite.hframes)
