extends Area2D


func _ready():
	pass

func _process(delta):
	pass


func _on_Ball_body_entered(body):
	if body.has_method("get_minion") and !body.get_minion:
		body.get_minion(self)
	
#	if get_node("/root/Global").PlayerBall == 0:
#		get_node("/root/Global").PlayerBall = 1
##		queue_free()
	pass
	
