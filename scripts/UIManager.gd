extends Node

export var minion_caught = false setget set_caught_minion, get_caught_minion

var bar_inversion_life = 5
var init_bar_inversion_life = bar_inversion_life
var side_of_player

func _input(event):
	pass

func _ready():

	pass 

func set_caught_minion(value):
	minion_caught = value

func get_caught_minion():
	return minion_caught

