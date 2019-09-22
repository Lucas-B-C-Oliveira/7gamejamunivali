extends Control

var Maze = randi() %3

func _ready():
	randomize()
	Maze = randi()%3
	pass # Replace with function body.

func _on_Play_pressed():
	#get_node("/root/Musics").MJogo.start()
	#get_node("/root/Musics").MMenu.stop()
	if Maze == 0:
		get_tree().change_scene("res://scenes/Maze.tscn")
	elif Maze == 1:
			get_tree().change_scene("res://scenes/Maze1.tscn")
	else:
		get_tree().change_scene("res://scenes/Maze2.tscn")
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
