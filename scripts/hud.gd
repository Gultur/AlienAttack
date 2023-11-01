extends Control
class_name HUD

@onready var score = $Score
@onready var lives = $Lives


func set_score_label(new_score :int) -> void:
	score.text = "SCORE:" + str(new_score)
	
func set_lives_label(new_lives :int) -> void:
	lives.text = str(new_lives)
