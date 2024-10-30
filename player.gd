extends CharacterBody2D

@export var speed = 400
@onready var _animated_sprite = $Animation
var screen_size
#var velocity = Vector2.ZERO

const SPEED = 200
func _ready() -> void:
	screen_size = get_viewport_rect().size

#func _process(delta):
#	if velocity == Vector2.ZERO:
#		_animated_sprite.play("Idle")

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("Up"):
		velocity.y -= SPEED
	if Input.is_action_pressed("Down"):
		velocity.y += SPEED
	if Input.is_action_pressed("Left"):
		velocity.x -= SPEED
		_animated_sprite.flip_h = true
	if Input.is_action_pressed("Right"):
		velocity.x += SPEED
		_animated_sprite.flip_h = false
	if velocity.x != 0 or velocity.y != 0:
		_animated_sprite.play("Run")
		
	else:
		_animated_sprite.stop()
	
	position += velocity * delta
	
