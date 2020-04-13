extends Control

var can_change_key = false
var action_string

enum ACTIONS {player_up, player_down, player_left, player_right, player_fire}

func _ready():
	_set_keys()
	
func _set_keys():
	for i in ACTIONS:
		get_node("BackgroundPlaceholder/MarginContainer/ScrollContainer/VBoxContainer/VBoxContainer/HBox_" + str(i) + "/Button").set_pressed(false)
		if !InputMap.get_action_list(i).empty():
			get_node("BackgroundPlaceholder/MarginContainer/ScrollContainer/VBoxContainer/VBoxContainer/HBox_" + str(i) + "/Button").set_text(InputMap.get_action_list(i)[0].as_text())
		else:
			get_node("BackgroundPlaceholder/MarginContainer/ScrollContainer/VBoxContainer/VBoxContainer/HBox_" + str(i) + "/Button").set_text("Unassigned")
			
func _mark_button(string):
	can_change_key = true
	action_string = string
	
	for i in ACTIONS:
		if i != string:
			get_node("BackgroundPlaceholder/MarginContainer/ScrollContainer/VBoxContainer/VBoxContainer/HBox_" + str(i) + "/Button").set_pressed(false)
			
func _input(event):
	if event is InputEventKey:
		if can_change_key:
			_change_key(event)
			can_change_key = false
			
func _change_key(new_key):
	if !InputMap.get_action_list(action_string).empty():
		InputMap.action_erase_event(action_string, InputMap.get_action_list(action_string)[0])
		
	for i in ACTIONS:
		if InputMap.action_has_event(i, new_key):
			InputMap.action_erase_event(i, new_key)
	
	InputMap.action_add_event(action_string, new_key)
	
	_set_keys()


func b_change_key_player_up():
	_mark_button("player_up")


func b_change_key_player_down():
	_mark_button("player_down")


func b_change_key_player_left():
	_mark_button("player_left")


func b_change_key_player_right():
	_mark_button("player_right")


func b_change_key_player_fire():
	_mark_button("player_fire")


func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://scenes/menus/MainMenu.tscn")


func _on_ConfirmationDialog_confirmed():
	Global.high_score = 0
	Global._save()
