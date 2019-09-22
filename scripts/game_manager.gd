extends Node

var score = 0 setget set_score
var ready_of_change_side = false

func _ready():
	pass 


func set_score(val):
	print("Can write score. Use function add_score")

func add_score(val):
	score += val


