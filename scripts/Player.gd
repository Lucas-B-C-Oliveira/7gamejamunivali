extends KinematicBody2D

var speed = Vector2(0,0)
var direction = Vector2(0,0)
var Velocity = Vector2()
export var Collected = 0 
var get_minion = false
var minion_getted

var situation_of_player setget set_situation_of_player , get_situation_of_player
var bar_inversion_life = 5
var init_bar_inversion_life = bar_inversion_life

var kill_minion = false setget set_kill_minion





func _ready():
	pass # Replace with function body.

func set_situation_of_player(val):
	print("SETEI O PLAYER")
	situation_of_player = val

func get_situation_of_player():
	print("Peguei O PLAYER")
	return situation_of_player

#directions
func _input(event):
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	elif Input.is_action_just_released("ui_right"):
		direction.x = 0
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	elif Input.is_action_just_released("ui_left"):
		direction.x = 0
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	elif Input.is_action_just_released("ui_up"):
		direction.y = 0
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	if Input.is_action_just_released("ui_down"):
		direction.y = 0

#func _process(delta):
#	if game_manager.ready_of_change_side:
#		situation_of_player = !situation_of_player
#		print("Mudei a situacao do Player")
#		$

func _physics_process(delta):
	
	if get_minion:
		minion_getted.global_position = self.global_position + Vector2(-2,0)
	else:
		pass
		
	

	
	
	
	if Input.is_action_just_pressed("drop"):
		if get_minion and !kill_minion:
			get_minion = false
			UIManager.minion_caught = false

		elif get_minion and kill_minion:
			UIManager.minion_caught = false
			get_minion = false
			minion_getted.queue_free()
			kill_minion = false
			game_manager.add_score(1)
			if situation_of_player:
				pass
				#somar ponto de luz
			elif !situation_of_player:
				pass
				#Somar ponto de treva
		

#Movement
	var Moving = Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")
	if Moving:
		speed = 200
	else:
		speed = 0
		
	Velocity = speed * direction
	move_and_slide(Velocity)

#Drop Ball
#if get_node("Global").PlayerBall == 1 and Input.

func get_minion(minion):
	minion_getted = minion
	get_minion = true
	UIManager.minion_caught = true
	emit_signal("get_minion" , true)
	$timer_timInversion.start()
	
	

func set_kill_minion(val):
	kill_minion = val



#func _on_timer_timInversion_timeout():
#	if bar_inversion_life <= 0:
#		$timer_timInversion.stop()
#		situation_of_player = !situation_of_player
##		emit_signal("change_situation", situation_of_player)
#		return
#
#	if get_minion:
#		UIManager.minion_caught= true
#		bar_inversion_life -= .01
#		var scale = float(bar_inversion_life) / float(init_bar_inversion_life)
#		$time_inversion.scale = scale
#		$timer_timInversion.start()
#
#	elif !get_minion and bar_inversion_life < init_bar_inversion_life:
#		bar_inversion_life += .01
#		var scale = float(bar_inversion_life) / float(init_bar_inversion_life)
#		$time_inversion.scale = scale
#		$timer_timInversion.start()
#



