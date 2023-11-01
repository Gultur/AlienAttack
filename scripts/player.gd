extends CharacterBody2D
class_name Player

var speed:int = 300
var rocket_scene: PackedScene = preload("res://scenes/rocket.tscn") as PackedScene # for autocomplete

@onready var rocket_spawn_point: Marker2D = $RocketSpawnPoint

# using a Node container to avoid rocket movin g when player is moving . No "transform" property
# could be in the level node
@onready var rocket_container: Node = $RocketContainer 


signal took_damage

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()


func _physics_process(_delta):
	velocity = Vector2.ZERO
	move()
	clamp_position()

func shoot() -> void:
	var rocket: Area2D = rocket_scene.instantiate()
	
	rocket.global_position = rocket_spawn_point.global_position
	rocket_container.add_child(rocket)

func move() -> void:
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed

	move_and_slide()


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

func take_damage() -> void:
	took_damage.emit()

func die() -> void:
	queue_free()
