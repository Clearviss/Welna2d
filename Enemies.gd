extends Node2D

var Enemy = preload("res://enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var count = $".".get_child_count()
	if (count > 150):
		pass
	else:
		var enemy = Enemy.instantiate()
		var x1 = $"../player/SpawnEnemy_x_1"
		var x2 = $"../player/SpawnEnemy_x_2"
		var y1 = $"../player/SpawnEnemy_y_1"
		var y2 = $"../player/SpawnEnemy_y_2"
		x1.position = Vector2($"../player".position.x + (randf()*2000), $"../player".position.y + 1000)
		x2.position = Vector2($"../player".position.x + (randf()*2000), $"../player".position.y - 1000)
		y1.position = Vector2($"../player".position.x + 1000, $"../player".position.y - (randf()*2000))
		y2.position = Vector2($"../player".position.x - 1000, $"../player".position.y - (randf()*2000))
		var final_pos = [x1.position,x2.position,y1.position,y2.position]
	
		enemy.position = final_pos[randf() * final_pos.size()]
		add_child(enemy)
