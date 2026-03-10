extends StateBase

func start() -> void:
	$"../../Sprite2D".visible = false
	$"../../CollisionShape2D".disabled = true
	$"../../GPUParticles2D".emitting = true
	
	$"../../Timer".start()
	


func _on_timer_timeout() -> void:
	state_machine.change_to(ItemBoxStates.AVAILABLE);
