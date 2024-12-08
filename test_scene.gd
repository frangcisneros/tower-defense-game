extends Node2D

@onready var basicEnemy = preload("res://basic-enemy/basic-enemy.tscn")

@onready var lvlPath = $"lvl-1-path"
@onready var timerBasicEnemy : Timer = $Timer

func _on_timer_timeout() -> void:
	var tempBasicEnemy = basicEnemy.instantiate()
	lvlPath.add_child(tempBasicEnemy)
