class_name GroundState extends PlayerState


var next_animation_name: String


func enter() -> void:
	next_animation_name = 'land' #cant play animation here 

func physics_process(delta: float) -> void:
	_calc_animation()
	_calc_state()
	
	player.side_velocity(delta)
	player.move_and_slide()

func input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		_jump()


func _calc_animation() -> void:
	if next_animation_name == 'land' && player.animation_player.is_playing():
		pass
	elif player.velocity.x == 0:
		next_animation_name = 'idle'
	else:
		next_animation_name = 'run'
	
	player.animation_player.play(next_animation_name)

func _calc_state() -> void:
	if !player.is_on_floor():
		transition.emit('AirState')


func _jump() -> void:
	player.velocity.y = -player.jump_force
