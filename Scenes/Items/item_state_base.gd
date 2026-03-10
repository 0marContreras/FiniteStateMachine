class_name ItemStateBase extends StateBase

var shoot_speed : int = 1200
var direction : Vector2
var item:Area2D:  #Assigns the type CharacterBody2d to the controlled_node so you can handle types and get autocomplete
	set (value):   #Could be any node type
		controlled_node = value
	get:
		return controlled_node

func set_shoot(position, targetPosition):
	item.global_position = position
	item.direction = (targetPosition - position).normalized()
	#rotation_degrees =  rad_to_deg(position.angle_to_point(targetPosition))
