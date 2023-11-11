extends Node2D

var laser = preload("res://laser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_laser(bullet_pos, dyrekcja):
	var current_lasereczek = laser.instantiate()
	current_lasereczek.position = bullet_pos
	current_lasereczek.rotation = dyrekcja.angle()
	current_lasereczek.direction = dyrekcja
	$Projectiles.add_child(current_lasereczek)
