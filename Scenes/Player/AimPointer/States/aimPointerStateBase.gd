class_name AimPointerStateBase extends StateBase 

var aimPointer:Area2D:  #Assigns the type Area2D to the controlled_node so you can handle types and get autocomplete
	set (value):   #Could be any node type
		controlled_node = value
	get:
		return controlled_node
		
var parent_rotation
@onready var Pointer = aimPointer.get_node("pointer")
@onready var AimCenter = aimPointer.position
@onready var Radius = aimPointer.get_node("CollisionShape2D").shape.radius


		
func on_physics_process(delta):
	parent_rotation = aimPointer.get_parent().rotation # Gets player rotation
	aimPointer.set_rotation(- parent_rotation)

func on_input(event):
	if event is InputEventKey:
		state_machine.change_to(AimPointerStates.Mouse)
	elif event is InputEventJoypadButton:
		state_machine.change_to(AimPointerStates.Controller)
