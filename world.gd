extends Node

@onready var spawnPoints: Array = [$SpawnPoints/Node2D, $SpawnPoints/Node2D2, $SpawnPoints/Node2D3, $SpawnPoints/Node2D4, $SpawnPoints/Node2D5, $SpawnPoints/Node2D6, $SpawnPoints/Node2D7, $SpawnPoints/Node2D8, $SpawnPoints/Node2D9]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomize()
	if Global.foodRemaining == 0:
		respawnFood()

func respawnFood():
	var fernet = randi() % spawnPoints.size()
	Global.foodRemaining = spawnPoints.size()
	for i in spawnPoints:
		if spawnPoints.find(i) != fernet:
			var comida = preload("res://comida.tscn")
			var comidaInstance = comida.instantiate()
			comidaInstance.global_position = i.global_position
			$Food.add_child(comidaInstance)
		else:
			var power = preload("res://power_up.tscn")
			var comidaInstance = power.instantiate()
			comidaInstance.global_position = i.global_position
			$Food.add_child(comidaInstance)
