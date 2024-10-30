extends CharacterBody2D



const SPEED = 150
var player
var chase = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("../Player")


# Called every frame. 'delta' is the elapsed time sinc	e the previous frame.
func _physics_process(delta: float):
	if chase:
		var direction = (player.position - self.position).normalized()
		velocity.x = direction.x * SPEED
		print('Player')
		print(player.position)
		print('Enemy')
		print(self.position)
	move_and_slide()


func _on_player_detector_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		chase = true
		
		
		


func _on_player_detector_body_exited(body: Node2D) -> void:
	chase = false
