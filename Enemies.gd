extends Node2D

var Enemy = preload("res://enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var enemy = Enemy.instantiate()
	var spawnarea = $"../player/SpawnArea" as ReferenceRect
	add_child(enemy)
	enemy.position = spawnarea.position + Vector2(randf() * spawnarea.size.x, randf() * spawnarea.size.y)
