class_name StateMachine extends Node

@onready var controlled_node = self.owner
@export var default_state:StateBase

var current_state:StateBase = null

func _ready() -> void:
	call_deferred("_state_default_start")
	
#Sets the default state when all nodes are ready
func _state_default_start() -> void:
	current_state = default_state
	_state_start()

#inicia las variables del State
func _state_start():
	current_state.controlled_node = controlled_node
	current_state.state_machine = self
	current_state.start()

#Changes to other state
func change_to(new_state:String) -> void:
	if current_state and current_state.has_method("end"): current_state.end() #ensures the execution of end method in states
	current_state = get_node(new_state)
	_state_start()


#Default execution methods
func _process(delta: float) -> void: 
	if current_state and current_state.has_method("on_process"):
		current_state.on_process(delta)
		
func _physics_process(delta: float) -> void: 
	if current_state and current_state.has_method("on_physics_process"):
		current_state.on_physics_process(delta)
		
func _input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_input"):
		current_state.on_input(event)
		
func _unhandled_input(event: InputEvent) -> void: 
	if current_state and current_state.has_method("on_unhandled_input"):
		current_state.on_unhandled_input(event)			
		
func _unhandled_key_input(event: InputEvent) -> void: 
	if current_state and current_state.has_method("on_unhandled_key_input"):
		current_state.on_unhandled_key_input(event)				
