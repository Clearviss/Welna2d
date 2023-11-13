extends Node
var score = 0
var health = 5
var weapons = ["shotgun", "carbine"]
var selected_weapon = weapons[1]

func reset():
	score = 0
	health = 5
	selected_weapon = weapons[1]
