extends Node

var high_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _load():
	var load_file = File.new()
	if not load_file.file_exists("res://EscapeVelocityHighScore.txt"):
		return
	load_file.open("res://EscapeVelocityHighScore.txt", File.READ)
	var data = load_file.get_as_text()
	load_file.close()
	var data_array = data.split(" ")
	high_score = int(data_array[2])

func _save():
	var data = ""
	data += "High Score: " + str(high_score)
	var save_file = File.new()
	save_file.open("res://EscapeVelocityHighScore.txt", File.WRITE)
	save_file.store_line(data)
	save_file.close()
	print("High Score Saved!")
