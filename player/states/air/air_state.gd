class_name AirState extends PlayerState


const mid_jump_deviation: float = 100


func physics_process(delta: float) -> void:
	_calc_state()
	_calc_animation()
	
	apply_gravity(delta)
	player.side_velocity(delta)
	player.move_and_slide()


func _calc_animation() -> void:
	if player.velocity.y > mid_jump_deviation:
		player.animation_player.play('fall')
	elif player.velocity.y < -mid_jump_deviation:
		player.animation_player.play('jump')
	else:
		player.animation_player.play('mid_jump')

func _calc_state() -> void:
	if player.velocity.y == 0:
		transition.emit('GroundState')


func apply_gravity(dalta: float) -> void:
	player.velocity.y = min(player.velocity.y + player.gravity_force * dalta, player.max_fall_speed)
