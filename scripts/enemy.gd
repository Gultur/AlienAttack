extends Area2D
class_name Enemy

@export var speed: int = 400

func _physics_process(delta):
	global_position.x -= speed * delta

func die() -> void:
	queue_free()
