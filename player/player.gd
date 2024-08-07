class_name Player extends CharacterBody2D


@export var max_fall_speed: float = 200
@export var gravity_force: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var max_speed: float
@export var acceleration: float
@export var friction: float

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func apply_gravity(dalta: float) -> void:
	velocity.y = max(velocity.y + gravity_force * dalta, max_fall_speed)
