extends Area2D

const MOVEMENT_LIMITS : Vector2 = Vector2(320, 180)

export var speed = 150
var can_shoot = true
export var max_health = 100
export var magazine_size = 5
var magazine
var shot_scene = preload("res://scenes/game/Shot.tscn")

func _ready():
	magazine = magazine_size
	
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
	
	position += velocity * delta
	position.x = clamp(position.x, 0, MOVEMENT_LIMITS.x)
	position.y = clamp(position.y, 0, MOVEMENT_LIMITS.y)
	
	if Input.is_action_pressed("player_fire") and can_shoot and magazine > 0:
		var shot_instance = shot_scene.instance()
		shot_instance.position = position + $CannonPosition.position
		get_parent().add_child(shot_instance)
		magazine -= 1
		print(magazine)
		can_shoot = false
		$Timer_Reload.start()
		if magazine <= 0:
			print("Mag Timer Started")
			$Timer_Magazine_Reload.start()

func _on_Timer_Reload_timeout():
	can_shoot = true

func _on_Timer_Magazine_Reload_timeout():
	print("Mag Timer Over")
	magazine = magazine_size
