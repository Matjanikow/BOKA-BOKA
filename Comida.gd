extends Sprite2D

func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("Personaje"):
		Global.score()
		queue_free()
