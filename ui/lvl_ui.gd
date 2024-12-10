extends Control

@onready var lvlScene : Node2D = self.get_parent()
@onready var towerButton = preload("res://ui/buttons/tower-button.tscn")
@onready var hTowerContainer = $"h-tower-container"
var avaiableTowers : Array

func _ready() -> void:
	avaiableTowers = get_towers(lvlScene)
	for tower in avaiableTowers:
		var tempTower = towerButton.instantiate()
		hTowerContainer.add_child(tempTower)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# funcion para obtener las torres disponibles en el nivel
func get_towers(lvlSceneVar):
	return lvlSceneVar.avaiableTowers
