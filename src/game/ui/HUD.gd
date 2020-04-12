extends CanvasLayer

var screen_size

func _ready():
	pass

func update_score(score):
	$MainHBoxContainer/ScoreHBoxContainer/Score.text = str(score)
