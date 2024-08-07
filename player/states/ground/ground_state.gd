class_name GroundState extends PlayerState


func physics_process(_delta: float) -> void:
	_calc_animation()
	_calc_state()
	player.move_and_slide()


func _calc_animation() -> void:
		player.animation_player.play('idle')


func _calc_state() -> void:
	if player.velocity.y != 0:
		transition.emit('AirState')
