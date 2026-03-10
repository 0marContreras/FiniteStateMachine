class_name PlayerStateBase extends StateBase #base state for thr player, extends the empty state base


var gravity:float = ProjectSettings.get_setting("physics/2d/default_gravity") #Gets the gravity
var player:CharacterBody2D:  #Assigns the type CharacterBody2d to the controlled_node so you can handle types and get autocomplete
	set (value):   #Could be any node type
		controlled_node = value
	get:
		return controlled_node

func handle_gravity(delta):
	player.velocity.y += ((gravity * 2) * delta)  #Adds gravity to the player
	player.set_rotation(deg_to_rad(player.velocity.y  * -0.09))


func on_input(_event):
	# seria mejor usar el parametro _event para obtener la información del evento
	if Input.is_action_just_pressed("jumpLeft") or Input.is_action_just_pressed("jumpRight"): 
		state_machine.change_to(PlayerStates.Move)
	elif Input.is_action_just_pressed("jump"):  
		state_machine.change_to(PlayerStates.Jump)
	elif Input.is_action_just_pressed("shoot"):  
		state_machine.change_to(PlayerStates.Shoot)
