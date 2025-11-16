extends CharacterBody2D




func _process(delta):
	var direction = Input.get_vector('move_left',"move_right","move_up","move_down")
	velocity = direction * 500
	move_and_slide()
	
	look_at(get_global_mouse_position())
