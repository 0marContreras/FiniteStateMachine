extends PlayerStateBase

#func start():  DISCARTED SINCE JOYSTICK AXIS RETURNS 0.soemthing VALUES
	#print(Input.get_axis("jumpLeft", "jumpRight"))
	#player.velocity.x = Input.get_axis("jumpLeft", "jumpRight") * PlayerStates.MoveVelocity.x
	#player.velocity.y = PlayerStates.MoveVelocity.y
	#player.set_rotation(PI/8)
	#player.move_and_slide()
	
func start():
	if Input.get_axis("jumpLeft", "jumpRight") > 0:
		player.velocity.x = 1.0 * PlayerStates.MoveVelocity.x
	elif Input.get_axis("jumpLeft", "jumpRight") < 0:
		player.velocity.x = -1.0 * PlayerStates.MoveVelocity.x 	
	
	player.velocity.y = PlayerStates.MoveVelocity.y
	player.set_rotation(PI/8)
	player.move_and_slide()
		

func on_physics_process(delta: float) -> void:
	handle_gravity(delta)
	player.move_and_slide()
