extends Node2D

var mouseOver : bool
var mousePos : Vector2 = Vector2.ZERO
var difference : Vector2
# comprobador si es una torre para posicionarla
var isTower : bool = true
# bloquear el movimiento
var inPlacement : bool = false

func _on_area_2d_mouse_entered() -> void:
	mouseOver = true

func _on_area_2d_mouse_exited() -> void:
	mouseOver = false
	
func _process(delta: float) -> void:
	difference = mousePos - get_global_mouse_position()
	
	if Input.is_action_pressed("Click") and mouseOver and difference != Vector2.ZERO and not inPlacement:
		global_position -= difference
	
	mousePos = get_global_mouse_position()
	
