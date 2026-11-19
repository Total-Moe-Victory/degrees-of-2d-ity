extends CharacterBody2D

###Variables Initialisation & Setup
##State 
#These describe the state the character is in (shocking) there are 10 states in the base game, 
#these are Pain, Arousal, Fatigue, Stesss, Trauma, Control, Allure, Drunk(eness), Drugs, and Hallucinogens


##Movement
@export var base_SPEED = 300.0
#@export var base_JUMP_VELOCITY = -400.0 unimplemented

##Section for handling movement
func _physics_process(_delta: float) -> void:
	# Add the gravity. Currently passed due to the current physics environment lacking a floor
	if not is_on_floor():
		pass
		#velocity += get_gravity() * delta
		
# 	Handle jump. Currently unimplemented
#	if Input.is_action_just_pressed("action_movement_jump") and is_on_floor():
#		velocity.y = base_JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction_x := Input.get_axis("action_movement_move_left", "action_movement_move_right")
	if direction_x:
		velocity.x = direction_x * base_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0,base_SPEED)
	var direction_y := Input.get_axis("action_movement_move_up","action_movement_move_down")
	if direction_y:
		velocity.y = direction_y * base_SPEED
	else: 
		velocity.y = move_toward(velocity.y, 0, base_SPEED)
	move_and_slide()

func _on_pause_button_pressed():
	if WorldTime.paused==false:
		WorldTime.paused = true
	else:
		WorldTime.paused = false
