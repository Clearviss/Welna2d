extends CharacterBody2D
var shoot = false
signal laser(laser_pos, player_direction)
func _ready():
	pass

func _process(delta):
	var direction = Input.get_vector('move_left',"move_right","move_up","move_down")
	velocity = direction * 500
	move_and_slide()
	
	
	var gracz_direction = (get_global_mouse_position() - position).normalized()
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("primary_action") and shoot:
		shoot = false
		var bullet_startPos = $BulletSpawnPoints.get_children()
		var selected_fuckme_bullet = bullet_startPos[randi() % bullet_startPos.size()]
		laser.emit(selected_fuckme_bullet.global_position, gracz_direction)
 


func _on_reload_ammo_timeout():
	shoot = true # Replace with function body.
