extends PlayerStateBase


func start():
	player.velocity.x = 0
	player.velocity.y = PlayerStates.MoveVelocity.y
	player.set_rotation(PI/8)
	player.move_and_slide()


func on_physics_process(delta: float) -> void:
	handle_gravity(delta)
	player.move_and_slide()
	

	
