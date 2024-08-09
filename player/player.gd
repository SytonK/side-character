class_name Player extends CharacterBody2D


@export var max_fall_speed: float = 600
@export var gravity_force: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var max_speed: float
@export var acceleration: float
@export var friction: float

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func side_velocity() -> void:
	var side_input_strength = Input.get_action_strength('move_right') - Input.get_action_strength("move_left")
	if side_input_strength == 0:
		print('apply friction')
	else:
		print('apply aceleration')
