extends Control
class_name GameOverScreen

func set_score(final_score: int) -> void:
	$Panel/Score.text = "Score :" + str(final_score)

func _on_retry_button_pressed():
	get_tree().reload_current_scene()
