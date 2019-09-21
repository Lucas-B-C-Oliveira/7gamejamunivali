extends ColorRect



onready var init_ret_size = rect_size
var scale = 1 setget set_scale

func _ready():
	pass

func set_scale(val):
	scale = val
	rect_size.x = init_ret_size.x * scale
