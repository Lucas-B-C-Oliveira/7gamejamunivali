extends Node2D

var life = 17
onready var init_life = life
var dark_minion = preload("res://scenes/BallD.tscn")
var light_minion = preload("res://scenes/BallL.tscn")
var minions_group
export var qntBalls = 5
export var points = 0 setget set_points
signal death_minions

var bar_inversion_life = 5
var init_bar_inversion_life = bar_inversion_life




func _ready():
	$death_time.start()
	$Player.connect("change_situation", self , "on_change_situation")
	yield(get_tree().create_timer(.5) , "timeout")
	spawn_minions(random_side())
	
func _process(delta):
	if game_manager.ready_of_change_side:
		game_manager.ready_of_change_side = false
		on_change_situation_of_player($Player.get_situation_of_player())
	
	if game_manager.score >= qntBalls:
		print("GANHOU")
	

func on_change_situation_of_player(situation_of_player):
	print(situation_of_player)
	if situation_of_player:
		for i in get_tree().get_nodes_in_group("light_group"):
			i.queue_free()
		minions_group = "dark_group"
		spawn_minions(dark_minion)
		get_node("Player/timer_timInversion").start()
		get_node("HUD/time_inversion_bar/timer_inversion_bar").start()
		UIManager.set_caught_minion(false)
		$Player.get_minion = false
		$Player.minion_getted = null
		$HUD.bar_inversion_life = $HUD.init_bar_inversion_life
#		$Player.bar_inversion_life = $Player.init_bar_inversion_life
		get_node("HUD/time_inversion_bar").rect_size = get_node("HUD/time_inversion_bar").init_ret_size
#		get_node("Player/time_inversion").rect_size = get_node("Player/time_inversion").init_ret_size
		return
	elif !situation_of_player:
		for i in get_tree().get_nodes_in_group("dark_group"):
			i.queue_free()
		minions_group = "light_group"
		spawn_minions(light_minion)
		get_node("Player/timer_timInversion").start()
		get_node("HUD/time_inversion_bar/timer_inversion_bar").start()
		UIManager.set_caught_minion(false)
		$Player.get_minion = false
		$Player.minion_getted = null
		$HUD.bar_inversion_life = $HUD.init_bar_inversion_life
#		$Player.bar_inversion_life = $Player.init_bar_inversion_life
		get_node("HUD/time_inversion_bar").rect_size = get_node("HUD/time_inversion_bar").init_ret_size
#		get_node("Player/time_inversion").rect_size = get_node("Player/time_inversion").init_ret_size
		return


func _on_death_time_timeout():
	if life <= 0:
		print("TimeOut of win YOU LOSE")
		pass
	life -= .01
	var scale = float(life) / float(init_life)
	$HUD/time_bar.scale = scale
	$death_time.start()

func set_points(val):
	points = val

func spawn_minions(minions):
	for i in range(qntBalls):
		var auxball = minions.instance()
		auxball.add_to_group(minions_group)
		self.add_child(auxball)
		var randX = rand_range(96, 1152)
		var randY = rand_range(160 , 896)
		auxball.global_position = Vector2(randX, randY)

#

func random_side():
	randomize()
	var side = randi() %  9 + 1
	if side > 5 :
		minions_group = "dark_group"
		$Player.set_situation_of_player(true)
		print($Player.get_situation_of_player())
		return dark_minion
	else:
		minions_group = "light_group"
		$Player.set_situation_of_player(false)
		print($Player.get_situation_of_player())
		return light_minion
	
	




