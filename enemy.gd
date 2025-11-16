extends RigidBody2D


const MOVE_SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health = 2

var player = null

func hit():
	if health <= 0:
		queue_free()
		Globals.score += 1
	else:
		health=-1
		$Sprite2D.modulate = Color(3,0,0)

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
	look_at(player_pos)


