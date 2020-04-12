extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/HighScore/HighScore.text = str(Global.high_score)
	

func _on_QuitButton_pressed():
	get_tree().quit()


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://scenes/menus/RebindMenu.tscn")


func _on_NewGameButton_pressed():
	get_tree().change_scene("res://scenes/game/Level.tscn")
