extends Node2D
class_name Game

var lives: int = 2
var score: int = 0

@onready var player = $Player as Player
@onready var hud = $UI/HUD as HUD
@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_take_dommage_sound = $PlayerTakeDommageSound


var game_over_scene: PackedScene = preload("res://scenes/game_over_screen.tscn") as PackedScene # for autocomplete


func _ready() -> void:
	update_hud_score()
	update_hud_lives()

func _on_death_zone_area_entered(area: Area2D) -> void:
	if area is Enemy:
		area.evade()


func _on_player_took_damage() -> void:
	lives -= 1
	player_take_dommage_sound.play()
	update_hud_lives()
	if lives <= 0:
		player.die()
		
		await get_tree().create_timer(0.75).timeout
		var game_over_instance = game_over_scene.instantiate()
		game_over_instance.set_score(score)
		hud.add_child(game_over_instance)

func _on_enemy_spawner_enemy_spawned(enemy_instance: Enemy) -> void:
	enemy_instance.connect("died", _on_enemy_die)
	add_child(enemy_instance)

func _on_enemy_die(enemy_score_value: int) -> void:
	score += enemy_score_value
	enemy_hit_sound.pitch_scale = randf_range(0.7, 1.3)
	enemy_hit_sound.play()
	update_hud_score()
	
func update_hud_score() -> void:
	hud.set_score_label(score)

func update_hud_lives() -> void:
	hud.set_lives_label(lives)
