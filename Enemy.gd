extends Node2D

@onready var velocidad: int = 0
@onready var personaje = $"../Personaje"
@onready var enemigoSprite = $Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += velocidad
	if personaje.global_position.x < position.x:
		velocidad = -7.3
		enemigoSprite.flip_h = false
	else:
		velocidad = 7.3
		enemigoSprite.flip_h = true
	pass

func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("Personaje"):
		area.get_parent().morir()
