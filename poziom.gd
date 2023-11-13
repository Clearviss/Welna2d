extends Node2D
var rozrzut = 0.2
var shoot = true

var laser = preload("res://laser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer.update_text()
	$CanvasLayer.update_health()
	for body in $Kill_area1.get_overlapping_bodies():
		body.queue_free()
		print("Zabito ", body)
	for body in $Kill_area2.get_overlapping_bodies():
		body.queue_free()
		print("Zabito ", body)
		
	for body in $Kill_area3.get_overlapping_bodies():
		body.queue_free()
		print("Zabito ", body)
		
	for body in $Kill_area4.get_overlapping_bodies():
		body.queue_free()
		print("Zabito ", body)
	if Input.is_action_just_pressed("select_prim"):
		$CanvasLayer.get_child(-1).get_child(0).get_child(0).visible = true
		$CanvasLayer.get_child(-2).get_child(0).get_child(0).visible = false
		Globals.selected_weapon = Globals.weapons[1]
		
	if Input.is_action_just_pressed("select_sec"):
		$CanvasLayer.get_child(-1).get_child(0).get_child(0).visible = false		
		$CanvasLayer.get_child(-2).get_child(0).get_child(0).visible = true
		Globals.selected_weapon = Globals.weapons[0]
		

func _on_player_laser(bullet_pos, dyrekcja):
	if (Globals.selected_weapon == "carbine"):
		var current_lasereczek = laser.instantiate()
		current_lasereczek.position = bullet_pos
		current_lasereczek.rotation = dyrekcja.angle()
		current_lasereczek.direction = dyrekcja + Vector2(randf_range(-(randf()*rozrzut),randf()*rozrzut),randf_range(-(randf()*rozrzut),randf()*rozrzut))
		$Projectiles.add_child(current_lasereczek)
	if(Globals.selected_weapon == "shotgun" and shoot):
		shoot = false
		for pocisk in randi_range(5,10):
			var current_lasereczek = laser.instantiate()
			current_lasereczek.position = bullet_pos
			current_lasereczek.rotation = dyrekcja.angle()
			current_lasereczek.direction = dyrekcja + Vector2(randf_range(-(randf()*rozrzut),randf()*rozrzut),randf_range(-(randf()*rozrzut),randf()*rozrzut))
			$Projectiles.add_child(current_lasereczek)




func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	Globals.reset()




func _on_shotgun_timeout():
	shoot = true
