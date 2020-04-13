extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	#Play SplashScreenAudio
	#Play SplashScreenAnimation
	Global._load()
	$SplashScreenAudio.play()

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://scenes/menus/MainMenu.tscn")
		
