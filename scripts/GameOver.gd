extends Control

var Maze

func _ready():
	get_node("/root/Musics").MJogo.stop()
	get_node("/root/Musics").MMenu.play()
	randomize()
	Maze = randi()%3
	pass # Replace with function body.

func _on_Replay_pressed():
	if Maze == 0:
		get_tree().change_scene("res://scenes/Maze.tscn")
	elif Maze == 1:
			get_tree().change_scene("res://scenes/Maze1.tscn")
	else:
		get_tree().change_scene("res://scenes/Maze2.tscn")
	pass # Replace with function body.

func _on_MainMenu_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	pass # Replace with function body.
