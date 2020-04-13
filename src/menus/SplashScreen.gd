extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	#Play SplashScreenAudio
	#Play SplashScreenAnimation
	_load()
	$SplashScreenAudio.play()

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://scenes/menus/MainMenu.tscn")
		

func _load():
	var load_file = File.new()
	if not load_file.file_exists("res://EscapeVelocityHighScore.txt"):
		return
	load_file.open("res://EscapeVelocityHighScore.txt", File.READ)
	var data = load_file.get_as_text()
	load_file.close()
	var data_array = data.split(" ")
	Global.high_score = int(data_array[2])
