extends CharacterBody2D
var shoot = false
signal laser(laser_pos, player_direction)
var can_move = true
var can_shoot = true
var can_behurt = true
func _ready():
	pass




func _process(delta):
	
	#var direction = Input.get_vector('move_left',"move_right","move_up","move_down")
	var direction = Input.get_vector('ui_left',"ui_right","ui_up","ui_down")
	velocity = direction * 500
	if (can_move):
		move_and_slide()
	$"../Reset".position = $Camera2D.global_position
	if ($"../Reset".position.x >= 7000):
		$"../Reset".position.x = 7000
	if ($"../Reset".position.x <= -7000):
		$"../Reset".position.x = -7000
	if ($"../Reset".position.y >= 7000):
		$"../Reset".position.y = 7000
	if ($"../Reset".position.y <= -7000):
		$"../Reset".position.y = -7000
	
	
	
	
	
	var gracz_direction = (Input.get_vector("ui_left2","ui_right2","ui_up2","ui_down2"))
	$".".rotation = gracz_direction.angle()
	
	if Input.is_action_pressed("primary_action") and shoot and can_shoot:
		shoot = false
		var bullet_startPos = $BulletSpawnPoints.get_children()
		var selected_fuckme_bullet = bullet_startPos[randi() % bullet_startPos.size()]
		laser.emit(selected_fuckme_bullet.global_position, gracz_direction)
	
	for  body in $hurt.get_overlapping_bodies():
		if (body.name != "player" and can_behurt):
			can_behurt = false
			print(body)# Replace with function body.
			Globals.health-=1
			if (Globals.health <= 0):
				$".".visible = false
				can_move = false
				can_shoot = false
				$"../Reset".visible = true
			




func _on_reload_ammo_timeout():
	shoot = true # Replace with function body.




func _on_timer_timeout():
	can_behurt = true # Replace with function body.
