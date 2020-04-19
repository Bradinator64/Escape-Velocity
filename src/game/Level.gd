extends Node

const ASTEROID_SPAWN_POS_X : float = 360.0
const ASTEROID_SPAWN_RANGE_Y : float = 180.0

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
	yield(get_tree().create_timer(1), "timeout")
	get_node("/root/MusicScene/GameMusic").play()
	$ScoreTimer.start()
	$AsteroidTimer.start()
	$HUD/MainHBoxContainer/HealthHBoxContainer/Health.text = str(player_health)
	
	
func _process(delta):
	$HUD/MainHBoxContainer/MagHBoxContainer/Mag.text = str($Player.magazine)
	if player_health <= 0:
		get_node("/root/MusicScene/GameMusic").stop()
		if score > Global.high_score:
			Global.high_score = score
		Global._save()
		get_tree().change_scene("res://scenes/menus/MainMenu.tscn")


func spawn_asteroid():
	var asteroid_instance = asteroid.instance()
	var pos = Vector2()
	pos.x = ASTEROID_SPAWN_POS_X
	pos.y = rand_range(0, ASTEROID_SPAWN_RANGE_Y)
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
		
