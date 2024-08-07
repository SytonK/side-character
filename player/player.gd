class_name Player extends CharacterBody2D


@onready var finite_stata_machine: FiniteStataMachine = $FiniteStataMachine

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	finite_stata_machine.ready()
