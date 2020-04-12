extends Area2D

export var velocity = Vector2()


func _ready():
	pass
func _process(delta):
	translate(-velocity * delta)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	#print("Queue Free")



func _on_Asteroid_area_entered(area):
	if area.is_in_group("shot") or area.is_in_group("player"):
		queue_free()
