extends KinematicBody2D

#var speed = Vector2(0,0)
var speed = 18000
var direction = Vector2(0,0)
var Velocity = Vector2()
export var Collected = 0 
var get_minion = false
var minion_getted

var situation_of_player setget set_situation_of_player , get_situation_of_player
var bar_inversion_life = 5
var init_bar_inversion_life = bar_inversion_life

var kill_minion = false setget set_kill_minion

var dark_minion = preload("res://scenes/BallD.tscn")
var light_minion = preload("res://scenes/MinionLifht.tscn")

#var anim = 


func who_sprit_player():
	if situation_of_player and get_minion:
		pass
	elif situation_of_player and !get_minion:
		pass
	elif !situation_of_player and get_minion:
		pass
	elif situation_of_player and !get_minion:
		pass


func die_minion():
	UIManager.minion_caught = false
	get_minion = false
	minion_getted.queue_free()
	kill_minion = false
	game_manager.add_score(1)

func _ready():
	pass # Replace with function body.

func set_situation_of_player(val):
	situation_of_player = val

func get_situation_of_player():
	return situation_of_player

#directions
#func _input(event):
#	if Input.is_action_pressed("ui_right"):
#		direction.x = 1
#	elif Input.is_action_just_released("ui_right"):
#		direction.x = 0
#	if Input.is_action_pressed("ui_left"):
#		direction.x = -1
#	elif Input.is_action_just_released("ui_left"):
#		direction.x = 0
#	if Input.is_action_pressed("ui_up"):
#		direction.y = -1
#	elif Input.is_action_just_released("ui_up"):
#		direction.y = 0
#	if Input.is_action_pressed("ui_down"):
#		direction.y = 1
#	if Input.is_action_just_released("ui_down"):
#		direction.y = 0

#func _process(delta):
#	if game_manager.ready_of_change_side:
#		situation_of_player = !situation_of_player
#		print("Mudei a situacao do Player")
#		$

#	Velocity = speed * direction
#	move_and_slide(Velocity)


func _physics_process(delta):
	
	if get_minion:
		minion_getted.global_position = $muzzle.global_position
	else:
		pass
		
	
	
	var dir_x = 0
	var dir_y = 0
	
	if Input.is_action_pressed("ui_right"):
		dir_x += 1
		if situation_of_player:
			$anim.play("light_right", true)
		elif !situation_of_player:
			$anim.play("dark_right", true)

	if Input.is_action_pressed("ui_left"):
		dir_x -= 1
		
		if situation_of_player:
			$anim.play("light_left", true)
		elif !situation_of_player:
			$anim.play("dark_left", true)

			
	if Input.is_action_pressed("ui_up"):
		dir_y -= 1
		if situation_of_player:
			$anim.play("light_up", true)

		elif !situation_of_player:
			$anim.play("dark_up", true)

	if Input.is_action_pressed("ui_down"):
		dir_y += 1
		if situation_of_player:
			$anim.play("light_down", true)
		elif !situation_of_player:
			$anim.play("dark_down", true)

	
#	look_at(get_global_mouse_position())
	
#	translate ( Vector2(dir_x , dir_y) * delta * speed)
	move_and_slide(Vector2(dir_x , dir_y) * delta * speed )

#	Velocity = speed * direction
#	move_and_slide(Velocity)


	
#	if Input.is_action_just_pressed("shot"):
#		var auxNewMinion = minion_getted.
#		self.add_child(auxNewMinion)
#		auxNewMinion.global_position = $muzzle.global_position
#		auxNewMinion.add_to_group(get_parent().minions_group)
#		UIManager.minion_caught = false
#		get_minion = false
#		minion_getted.queue_free()
#		kill_minion = false
		
	
	if Input.is_action_just_pressed("drop"):
		if get_minion and !kill_minion:
			get_minion = false
			UIManager.minion_caught = false

		elif get_minion and kill_minion:
			print(situation_of_player)
			print(game_manager.current_minion)
			if game_manager.current_minion == 0 and !situation_of_player:
				UIManager.minion_caught = false
				get_minion = false
				minion_getted.queue_free()
				kill_minion = false
				game_manager.add_score(-1)
			if game_manager.current_minion == 1 and situation_of_player:
				UIManager.minion_caught = false
				get_minion = false
				minion_getted.queue_free()
				kill_minion = false
				game_manager.add_score(-1)
			if game_manager.current_minion == 0 and situation_of_player:
				UIManager.minion_caught = false
				get_minion = false
				minion_getted.queue_free()
				kill_minion = false
				game_manager.add_score(1)
			if game_manager.current_minion == 1 and !situation_of_player:
				UIManager.minion_caught = false
				get_minion = false
				minion_getted.queue_free()
				kill_minion = false
				game_manager.add_score(1)

#Movement
#	var Moving = Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")
#	if Moving:
#		speed = 200
#	else:
#		speed = 0
#
#	Velocity = speed * direction
#	move_and_slide(Velocity)

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



