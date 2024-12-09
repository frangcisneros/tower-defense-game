extends Node2D

var mouseOver : bool
var mousePos : Vector2 = Vector2.ZERO
var difference : Vector2
# comprobador si es una torre para posicionarla
var isTower : bool = true
# bloquear el movimiento
var inPlacement : bool = false
# atacar
var attackBool : bool = false
# enemigo objetivo
var targetEnemy 
var targetEnemyRID
# raycast de prueba
@onready var testRayCast : RayCast2D = $RayCast2D
@onready var towerAttack : Area2D = $"tower-attack"
@onready var attackArea : Area2D = $"attack-area"
@onready var attackTimer : Timer = $"attack-timer"


func _on_area_2d_mouse_entered() -> void:
	mouseOver = true

func _on_area_2d_mouse_exited() -> void:
	mouseOver = false
	
func _process(_delta: float) -> void:
	print(attackArea.get_overlapping_areas())
	if attackBool:
		attack(targetEnemy)
	
	difference = mousePos - get_global_mouse_position()
	
	if Input.is_action_pressed("Click") and mouseOver and difference != Vector2.ZERO and not inPlacement:
		global_position -= difference
	
	mousePos = get_global_mouse_position()
	
func _on_attackarea_area_entered(area: Area2D) -> void:
	if "isEnemy" in area.get_parent() and attackBool == false:
		#attackArea.set_deferred("monitoring", true)
		targetEnemy = attackArea.get_overlapping_areas()[0]
		targetEnemyRID = area.get_rid()
		attackBool = true


func _on_attackarea_area_exited(area: Area2D) -> void:
	if "isEnemy" in area.get_parent() and area.get_rid() == targetEnemyRID:
		attackBool = false
		attackArea.set_deferred("monitoring", false)
		attackArea.set_deferred("monitoring", true)

func attack(target):
	towerAttack.global_position = target.global_position
