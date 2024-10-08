class_name Player extends CharacterBody2D


enum DIRECTION {LEFT, RIGHT}


@export var max_fall_speed: float = 600
@export var gravity_force: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var max_speed: float = 400
@export var acceleration: float = 1600
@export var friction: float = 1200

@export var jump_force: float = 600

@export var air_jump_force: float = 400
@export var max_air_jumps: int = 1

@export var dash_strength: float = 1600
@export var dash_duration: float = .3
@export var dash_cooldown: float = 1.5


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var finite_stata_machine: FiniteStataMachine = $FiniteStataMachine

var direction: DIRECTION = DIRECTION.RIGHT: set  = _on_change_direction

@onready var air_jumps: int = max_air_jumps

var is_dash_on_cooldown: bool = false


func side_velocity(delta: float) -> void:
	var side_input_strength = Input.get_action_strength('move_right') - Input.get_action_strength("move_left")
	if side_input_strength == 0:
		_apply_friction(delta)
	else:
		_apply_acceleration(side_input_strength, delta)

func _apply_acceleration(side_input_strength: float, delta: float) -> void:
	velocity.x = clamp(velocity.x + side_input_strength * acceleration * delta,
		-max_speed, max_speed) 
	direction = DIRECTION.RIGHT if velocity.x > 0 else DIRECTION.LEFT

func _apply_friction(delta: float) -> void:
	var x_velocity_length = abs(velocity.x)
	if abs(velocity.x) > friction * delta:
		velocity.x -= (velocity.x / x_velocity_length) * friction * delta
	else:
		velocity.x = 0


func _on_change_direction(new_directoin: DIRECTION) -> void:
	direction = new_directoin
	sprite_2d.flip_h = direction != DIRECTION.RIGHT


func dash() ->  void:
	if !is_dash_on_cooldown:
		is_dash_on_cooldown = true
		finite_stata_machine.transition('Dash')
