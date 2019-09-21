extends Node2D

var life = 10
onready var init_life = life


func _ready():
	$death_time.start()
	
	



func _on_death_time_timeout():
	if life <= 0:
		print("a")
	life -= 1
	var scale = float(life) / float(init_life)
	$time_bar.scale = scale
	$death_time.start()
