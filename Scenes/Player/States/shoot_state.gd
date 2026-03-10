extends PlayerStateBase

#this state handles all the different types of items that the player could have

func start():
	player.get_node("AimPointer").visible = true

func on_physics_process(delta: float) -> void:
	handle_gravity(delta)
	player.move_and_slide()
	
	
