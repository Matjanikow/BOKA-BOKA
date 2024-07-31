extends Node2D

@onready var velocidad: float = 7.3
@onready var personaje = $"../Personaje"
@onready var enemigoSprite = $Sprite2D
@onready var muerto = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !muerto:
		enemigoSprite.use_parent_material = !Global.powerUp
		alive_process()
	else:
		position.x = clamp(position.x + velocidad, 56 , get_viewport_rect().size.x-56)
		if position.x == 56 || position.x == get_viewport_rect().size.x-56:
			respawn()

func respawn():
	print("revivi")
	muerto = false
	enemigoSprite.animation = "default"
	
func alive_process():
	position.x = clamp(position.x + velocidad, 56 , get_viewport_rect().size.x-56)
	if Global.powerUp || muerto:
		if personaje.global_position.x < position.x:
			velocidad = 7.3  # Cambiamos la dirección para que escape en lugar de perseguir
			enemigoSprite.flip_h = true  # Volteamos el sprite horizontalmente para que parezca que está escapando
		else:
			velocidad = -7.3  # Cambiamos la dirección para que escape en lugar de perseguir
			enemigoSprite.flip_h = false  # Volteamos el sprite horizontalmente para que parezca que está escapando
	else:
		if personaje.global_position.x < position.x:
			velocidad = -7.3
			enemigoSprite.flip_h = false
		else:
			velocidad = 7.3
			enemigoSprite.flip_h = true

func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("Personaje") && !muerto:
		if Global.powerUp:
			enemigoSprite.animation = "Ghost"
			muerto = true
			if position.x < get_viewport_rect().size.x/2:
				velocidad = 9 
			else: 
				velocidad = -9 
		else:
			area.get_parent().morir()
