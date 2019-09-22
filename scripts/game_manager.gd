extends Node

var score = 0 setget set_score
var ready_of_change_side = false

func _ready():
	pass 


func set_score(val):
	score = val

func add_score(val):
	score += val


