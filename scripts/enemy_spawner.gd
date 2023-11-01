extends Node2D

signal enemy_spawned(enemy_instance)
signal enemy_path_spawned(enemy_path_instance)

var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn") as PackedScene
var enemy_path_scene: PackedScene = preload("res://scenes/path_enemy.tscn") as PackedScene

func _on_spawn_timer_timeout() -> void:
	var spawn_position: Marker2D = $SpawnPositions.get_children().pick_random() as Marker2D
	spawn_enemy(spawn_position)
	
func spawn_enemy(spawn_position: Marker2D) -> void:
	var enemy: Area2D = enemy_scene.instantiate() as Area2D
	enemy.global_position = spawn_position.global_position
	enemy_spawned.emit(enemy)

func _on_enemypath_timer_timeout():
	spawn_path_enemy()
	
func spawn_path_enemy() -> void:
	var enemy_path: Path2D = enemy_path_scene.instantiate() as Path2D
	enemy_path_spawned.emit(enemy_path)
