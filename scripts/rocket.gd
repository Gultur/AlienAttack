extends Area2D
class_name Rocket

@export var speed: int = 400
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position.x += speed * delta


func _on_visible_notifier_screen_exited():
	queue_free() # Replace with function body.
