extends PlayerStateBase


func on_physics_process(delta: float) -> void:
	handle_gravity(delta)
	player.move_and_slide()
