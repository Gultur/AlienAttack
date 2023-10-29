extends Node2D
class_name Game

func _on_death_zone_area_entered(area):
	if area is Enemy:
		(area as Enemy).die()
