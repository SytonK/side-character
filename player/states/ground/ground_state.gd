class_name GroundState extends PlayerState


func enter() -> void:
	if player.animation_player:
		player.animation_player.play('land')

func physics_process(delta: float) -> void:
	player.move_and_slide()
	player.side_velocity(delta)
	
	_calc_animation()
	_calc_state()

func input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		_jump()


func _calc_animation() -> void:
	if player.animation_player.current_animation == 'land' && player.animation_player.is_playing():
		pass
	elif player.velocity.x == 0:
		player.animation_player.play('idle')
	else:
		player.animation_player.play('run')

func _calc_state() -> void:
	if !player.is_on_floor():
		transition.emit('AirState')


func _jump() -> void:
	player.velocity.y = -player.jump_force
