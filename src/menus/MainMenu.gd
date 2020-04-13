extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/HighScore/HighScore.text = str(Global.high_score)
	if not get_node("/root/MusicScene/MenuMusic").is_playing():
		yield(get_tree().create_timer(1), "timeout")
		get_node("/root/MusicScene/MenuMusic").play()

func _on_QuitButton_pressed():
	get_tree().quit()


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://scenes/menus/RebindMenu.tscn")


func _on_NewGameButton_pressed():
	get_node("/root/MusicScene/MenuMusic").stop()
	get_tree().change_scene("res://scenes/game/Level.tscn")


func _on_StoryButton_pressed():
	get_tree().change_scene("res://scenes/menus/Story.tscn")
