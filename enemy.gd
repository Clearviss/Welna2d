extends CharacterBody2D


const MOVE_SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var raycast = $RayCast2D
 
var player = null



func _ready():
	add_to_group("zombies")
	player = $"../../player"


func _physics_process(delta):
	if player == null:
		return
	var player_pos = player.global_position
	var vec_to_player = player.global_position - global_position
	vec_to_player = vec_to_player.normalized()
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
 
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll.name == "Player":
			coll.kill()
	look_at(player_pos)
func kill():
	queue_free()
