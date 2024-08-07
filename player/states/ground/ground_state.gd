class_name GroundState extends State


@onready var player: Player = owner


func enter() -> void:
	player.animation_player.play('idle')
