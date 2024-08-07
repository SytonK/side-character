class_name GroundState extends PlayerState


func physics_process(_delta: float) -> void:
	_calc_animation()


func _calc_animation() -> void:
		player.animation_player.play('idle')
