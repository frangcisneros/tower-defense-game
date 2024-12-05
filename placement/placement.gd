extends Node2D

var busy : bool = false
var coordinates : Vector2 = Vector2(self.position.x,self.position.y)
var tower



func _on_area_2d_area_entered(area: Area2D) -> void:
	tower = area.get_parent()
	if "isTower" in tower:
		tower.inPlacement = true
		tower.position = coordinates
