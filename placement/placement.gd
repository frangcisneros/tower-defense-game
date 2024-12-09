extends Node2D

var busy : bool = false
var coordinates : Vector2 
var tower

func _ready() -> void:
	coordinates = self.global_position

func _on_area_2d_area_entered(area: Area2D) -> void:
	tower = area.get_parent()
	if "isTower" in tower:
		tower.inPlacement = true
		tower.global_position = coordinates
