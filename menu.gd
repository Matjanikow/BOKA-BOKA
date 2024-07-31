extends Node

func _process(_delta):
	if Input.is_action_just_released("flip"):
		Global.reset()
		get_tree().change_scene_to_file("res://world.tscn")
