extends CharacterBody2D
@onready var raycast = $RayCast2D
var shoot = false

func _ready():
	await get_tree()
	get_tree().call_group("zombies", "set_player", self)

func _process(delta):
	var direction = Input.get_vector('move_left',"move_right","move_up","move_down")
	velocity = direction * 500
	move_and_slide()
	$SpawnArea.position = position
	
	
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("primary_action") and shoot:
		shoot = false;
		var coll = raycast.get_collider()
		if raycast.is_colliding() and coll.has_method("kill"):
			coll.kill()
 


func _on_reload_ammo_timeout():
	shoot = true # Replace with function body.
