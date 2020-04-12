extends Node

export var score_mod = 100
var score

var player_health
export var player_health_loss = 10

func _ready():
	score = 0
	player_health = $Player.max_health
	$ScoreTimer.start()
	$HUD/MainHBoxContainer/HealthHBoxContainer/Health.text = str(player_health)
	
func _process(delta):
	if player_health <= 0:
		if score > get_node("/root/Global").high_score:
			get_node("/root/Global").high_score = score
		get_tree().change_scene("res://scenes/menus/MainMenu.tscn")

func _on_ScoreTimer_timeout():
	score += score_mod
	$HUD.update_score(score)


func _on_Player_area_entered(area):
	if area.is_in_group("debris"):
		player_health -= player_health_loss
		$HUD/MainHBoxContainer/HealthHBoxContainer/Health.text = str(player_health)
