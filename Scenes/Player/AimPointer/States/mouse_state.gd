extends AimPointerStateBase 

func start():
	Pointer.visible = true
	
func on_process(delta):
	Pointer.global_position = aimPointer.get_global_mouse_position()
	Pointer.position = AimCenter + (Pointer.position - AimCenter).limit_length(Radius)
