extends Control




func _on_button_pressed():
	get_tree().reload_current_scene()
	Globals.score = 0
	Globals.health = 5
