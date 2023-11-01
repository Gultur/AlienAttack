extends Node2D

signal enemy_spawned(enemy_instance)

var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn") as PackedScene # for autocomplete

func _on_spawn_timer_timeout() -> void:
	var spawn_position: Marker2D = $SpawnPositions.get_children().pick_random() as Marker2D
	spawn_enemy(spawn_position)
	
func spawn_enemy(spawn_position: Marker2D) -> void:
	
	var enemy: Area2D = enemy_scene.instantiate() as Area2D
	enemy.global_position = spawn_position.global_position
	enemy_spawned.emit(enemy)
