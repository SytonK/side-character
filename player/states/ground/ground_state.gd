class_name GroundState extends PlayerState


func physics_process(_delta: float) -> void:
	_calc_animation()
	_calc_state()
	
	player.move_and_slide()


func _calc_animation() -> void:
	player.animation_player.play('idle')

func _calc_state() -> void:
	if !player.is_on_floor():
		transition.emit('AirState')
