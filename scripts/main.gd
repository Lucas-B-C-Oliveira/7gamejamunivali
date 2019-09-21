extends Node2D

var life = 10
onready var init_life = life
var ball = preload("res://scenes/BallL.tscn")
export var qntBalls = 5



func _ready():
	$death_time.start()
	
	for i in range(qntBalls):
		var auxball = ball.instance()
		self.add_child(auxball)
		var randX = rand_range(4, 1000)
		var randY = rand_range(4 , 1000)
		auxball.global_position = Vector2(randX, randY)
		print(auxball)
	
	
	



func _on_death_time_timeout():
	if life <= 0:
#		print("TimeOut of win YOU LOSE")
		pass
	life -= .01
	var scale = float(life) / float(init_life)
	$time_bar.scale = scale
	$death_time.start()
