extends Area2D
var speed = 1000
var direction = Vector2.UP
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	queue_free() # Replace with function body.
