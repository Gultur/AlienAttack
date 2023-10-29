extends CharacterBody2D
class_name Player

var speed:int = 300



func _physics_process(_delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed

	move_and_slide()
	clamp_position()

func clamp_position() -> void:
	var window_size: Vector2 = get_viewport_rect().size
#	if global_position.x < 0:
#		global_position.x = 0
#	if global_position.x > window_size.x:
#		global_position.x = window_size.x
#	if global_position.y < 0:
#		global_position.y = 0
#	if global_position.y > window_size.y:
#		global_position.y = window_size.y
		
#	global_position.x = clampf(global_position.x, 0, window_size.x)
#	global_position.y = clampf(global_position.y, 0, window_size.y)
	
	global_position = global_position.clamp(Vector2.ZERO, window_size)
