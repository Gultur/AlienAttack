extends Area2D
class_name Enemy

@export var speed: int = 400
@export var score_value: int = 100

signal died(value: int)

func _physics_process(delta):
	global_position.x -= speed * delta

func die() -> void:
	died.emit(score_value)
	queue_free()
	
func evade() -> void:
	queue_free()


func _on_body_entered(body):
	if body is Player:
		body.take_damage()
		evade()
