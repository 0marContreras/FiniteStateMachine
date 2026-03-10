extends AimPointerStateBase 

func start():
	Pointer.visible = true
	
func on_process(delta):
	var aim_dir = Vector2(Input.get_axis("aimLeft", "aimRight"), Input.get_axis("aimUp", "aimDown"))
	Pointer.position = aim_dir * (Radius * 2)
	Pointer.position = AimCenter + (Pointer.position - AimCenter).limit_length(Radius)

	if aim_dir.x == 0 and aim_dir.y == 0:
		Pointer.visible = false
	else:
		Pointer.visible = true
