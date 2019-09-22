extends Area2D


func _ready():
	print(get_groups())
	self.connect("death_minions", self , "on_death_all_minions")
	pass

func _process(delta):
	pass


func _on_Ball_body_entered(body):
	if body.has_method("get_minion") and body.get_minion != null:
		body.get_minion(self)

func on_death_all_minions():
	game_manager.add_score(1)
	self.queue_free()
