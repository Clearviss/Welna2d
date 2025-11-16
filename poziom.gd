extends Node2D



var laser = preload("res://laser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer.update_text()
	$CanvasLayer.update_health()


func _on_player_laser(bullet_pos, dyrekcja):
	var current_lasereczek = laser.instantiate()
	current_lasereczek.position = bullet_pos
	current_lasereczek.rotation = dyrekcja.angle()
	current_lasereczek.direction = dyrekcja + Vector2(randf()*0.3, randf()*0.3)
	$Projectiles.add_child(current_lasereczek)


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	Globals.score = 0
	Globals.health = 5


func _on_kill_area_1_body_entered(body):
	body.queue_free()
func _on_kill_area_2_body_entered(body):
	body.queue_free() 
func _on_kill_area_3_body_entered(body):
	body.queue_free() 
func _on_kill_area_4_body_entered(body):
	body.queue_free() 
