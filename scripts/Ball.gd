extends Area2D

var mySituation

func _ready():
	self.connect("death_minions", self , "on_death_all_minions")
	pass

func _process(delta):
#	print(mySituation)
	pass


func _on_Ball_body_entered(body):
	if body.has_method("get_minion") and body.get_minion != null:
		if body.situation_of_player and mySituation == 0:
			
			body.get_minion(self)
			game_manager.current_minion = mySituation
		elif !body.situation_of_player and mySituation == 1:
			body.get_minion(self)
			game_manager.current_minion = mySituation



#	if body.has_method("kill_minion"):
#		game_manager.add_score(1)
#		self.queue_free()

func on_death_all_minions():
#	game_manager.add_score(1)
	self.queue_free()


func _on_BallD_body_exited(body):
	if body.has_method("get_minion") and body.get_minion != null:
		if body.situation_of_player and mySituation == 0:
			
			game_manager.current_minion = null
		elif !body.situation_of_player and mySituation == 1:
			game_manager.current_minion = null
