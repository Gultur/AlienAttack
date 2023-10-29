extends Node2D

var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn") as PackedScene # for autocomplete

func _on_spawn_timer_timeout():
	var spawn_position: Marker2D = $SpawnPositions.get_children().pick_random() as Marker2D
	spawn_enemy(spawn_position)
	pass # Replace with function body.
	
func spawn_enemy(spawn_position: Marker2D) -> void:
	
	var enemy: Area2D = enemy_scene.instantiate() as Area2D
	enemy.global_position = spawn_position.global_position
	add_child(enemy)
