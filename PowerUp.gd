extends Node2D

func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("Personaje"):
		Global.score()
		area.get_parent().powerUp()
		queue_free()
