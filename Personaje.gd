extends Node2D

@onready var velocidad: int = 7
@onready var powerUpTimer: int = 0
@onready var personajeSprite = $AnimatedSprite2D
@onready var visibility = $AnimatedSprite2D/VisibleOnScreenNotifier2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += velocidad
	if Input.is_action_just_released("flip"):
		flip()
	if(!visibility.is_on_screen()):
		if position.x < 0:
			position.x = get_viewport_rect().size.x -1
		else: 
			position.x = 0
	if powerUpTimer > 0:
		print(powerUpTimer)
		powerUpTimer -= delta
	else:
		Global.powerUp = false

func flip():
	velocidad *= -1
	personajeSprite.flip_h = !personajeSprite.flip_h

func morir():
	print("me morí")

func powerUp():
	powerUpTimer = 200
	Global.powerUp = true
	
