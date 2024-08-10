class_name GroundState extends PlayerState


func physics_process(delta: float) -> void:
	_calc_animation()
	_calc_state()
	
	player.side_velocity(delta)
	player.move_and_slide()


func input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		player.jump()


func _calc_animation() -> void:
	if player.velocity.x == 0:
		player.animation_player.play('idle')
	else:
		player.animation_player.play('run')

func _calc_state() -> void:
	if !player.is_on_floor():
		transition.emit('AirState')
