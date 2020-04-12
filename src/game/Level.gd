extends Node


var score
var player_health
var screen_size
var asteroid = preload("res://scenes/game/Asteroid.tscn")

export var player_health_loss = 10
export var score_mod = 100



func _ready():
	score = 0
	$Player.position = $StartPosition.position
	screen_size = OS.get_real_window_size()
	player_health = $Player.max_health
	$ScoreTimer.start()
	$AsteroidTimer.start()
	$HUD/MainHBoxContainer/HealthHBoxContainer/Health.text = str(player_health)
	
	
func _process(delta):
	if player_health <= 0:
		if score > get_node("/root/Global").high_score:
			get_node("/root/Global").high_score = score
		get_tree().change_scene("res://scenes/menus/MainMenu.tscn")


func spawn_asteroid():
	var asteroid_instance = asteroid.instance()
	var pos = Vector2()
	pos.x = screen_size.x
	pos.y = rand_range(0, screen_size.y)
	asteroid_instance.position = pos
	asteroid_instance.add_to_group("debris")
	add_child(asteroid_instance)

func _on_ScoreTimer_timeout():
	score += score_mod
	$HUD.update_score(score)



func _on_AsteroidTimer_timeout():
	spawn_asteroid()


func _on_Player_area_entered(area):
	if area.is_in_group("debris"):
		player_health -= player_health_loss
		$HUD/MainHBoxContainer/HealthHBoxContainer/Health.text = str(player_health)
