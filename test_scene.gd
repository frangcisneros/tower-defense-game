extends Node2D

@onready var basicEnemy = preload("res://basic-enemy/basic-enemy.tscn")
@onready var lvlPath = $"lvl-1-path"
@onready var timerBasicEnemy : Timer = $Timer
# cambiarlo posiblemente por un diccionario, para obtener las torres por identificadores unicos
# una funcion global donde en cada nivel yo pueda poner rapidamente las torres que quiero disponibles
@export var avaiableTowers = ["res://torre-aceite/"]

func _on_timer_timeout() -> void:
	var tempBasicEnemy = basicEnemy.instantiate()
	lvlPath.add_child(tempBasicEnemy)
