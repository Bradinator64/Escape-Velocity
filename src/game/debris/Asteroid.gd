extends Area2D

export var velocity = Vector2()
var screen_size

func _ready():
	#print("Working")
	screen_size = get_viewport_rect().size

func _process(delta):
	translate(-velocity * delta)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	#print("Queue Free")
