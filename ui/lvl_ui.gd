extends Control

@onready var lvlScene : Node2D = self.get_parent()
@onready var towerButton = preload("res://ui/buttons/tower-button.tscn")

@onready var hTowerContainer = $"h-tower-container"
var avaiableTowers : Array
@export var avaiableButtons: Dictionary = {}
var count = 0

func _ready() -> void:
	avaiableTowers = get_towers(lvlScene)
	# funcion para obtener un diccionario con los nombres de los botones, capaz no me hace falta la funcion get_towers
	# voy a configurar para que cada boton obtenga a que torre corresponda pero dentro del objeto boton
	# no pude hacer una funcion no se muy bien por que, por ahora lo dejo asi
	for tower in avaiableTowers:
		var tempButton = towerButton.instantiate()
		tempButton.get_child(0).text = "[center]%s[/center]" % "Torre Aceite"
		var texture = load("res://torre-aceite/sprite.png")
		var texturePressed = load("res://torre-aceite/sprite-pressed.png")
		tempButton.get_child(1).set_texture_normal(texture)
		tempButton.get_child(1).set_texture_pressed(texturePressed)
		
		
		hTowerContainer.add_child(tempButton)
		avaiableButtons[hTowerContainer.get_child(count)] = avaiableTowers[count]
		count += 1
	
func _process(_delta: float) -> void:
	pass

# funcion para obtener las torres disponibles en el nivel
func get_towers(lvlSceneVar):
	return lvlSceneVar.avaiableTowers
