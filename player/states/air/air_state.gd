class_name AirState extends PlayerState


const mid_jump_deviation: float = 100


func enter() -> void:
	_reset_air_jumps()

func physics_process(delta: float) -> void:
	_calc_state()
	_calc_animation()
	
	_apply_gravity(delta)
	player.side_velocity(delta)
	player.move_and_slide()

func input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		_air_jump()
	if event.is_action_released("jump"):
		_stop_jump()


func _calc_animation() -> void:
	if player.animation_player.is_playing() && player.animation_player.current_animation == 'air_jump':
		return
	
	print(player.animation_player.current_animation)
	if player.velocity.y > mid_jump_deviation:
		player.animation_player.play('fall')
	elif player.velocity.y < -mid_jump_deviation:
		player.animation_player.play('jump')
	else:
		player.animation_player.play('mid_jump')

func _calc_state() -> void:
	if player.is_on_floor(): 
		transition.emit('GroundState')


func _apply_gravity(dalta: float) -> void:
	player.velocity.y = min(player.velocity.y + player.gravity_force * dalta, player.max_fall_speed)


func _air_jump() -> void:
	if player.air_jumps > 0:
		player.air_jumps -= 1
		player.velocity.y = -player.air_jump_force
		player.animation_player.play('air_jump')

func _reset_air_jumps() -> void:
	player.air_jumps = player.max_air_jumps


func _stop_jump() -> void:
	if player.velocity.y < 0:
		player.velocity.y = 0
