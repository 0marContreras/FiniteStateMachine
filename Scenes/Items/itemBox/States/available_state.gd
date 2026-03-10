extends StateBase

func start() -> void:
	$"../../Sprite2D".visible = true
	$"../../CollisionShape2D".disabled = false
	$"../../GPUParticles2D".emitting = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		state_machine.change_to(ItemBoxStates.SPAWN)
