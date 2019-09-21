extends KinematicBody2D

var speed = Vector2(0,0)
var direction = Vector2(0,0)
var Velocity = Vector2()
export var Collected = 0 
var get_minion = false
var minion_getted

var situation_of_player = ["dark" , "light"]
var bar_inversion_life = 5
var init_bar_inversion_life = bar_inversion_life

signal encherBarra
signal desencherBarra


func _ready():
	pass # Replace with function body.

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

func _physics_process(delta):
	
	if get_minion:
		minion_getted.global_position = self.global_position + Vector2(-10,0)
	
	if $timer_timInversion.is_stopped() and $timer_recup_inversionBar.is_stopped() and !get_minion and bar_inversion_life < init_bar_inversion_life:
		print(bar_inversion_life)
		$timer_recup_inversionBar.start()
	
	if bar_inversion_life >= init_bar_inversion_life and !$timer_recup_inversionBar.is_stopped():
		$timer_recup_inversionBar.stop()
	
	
	if Input.is_action_just_pressed("drop"):
		if get_minion:
			get_minion = false
			$timer_timInversion.stop()
		

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
	$timer_timInversion.start()
	
	




func _on_timer_timInversion_timeout():
	if bar_inversion_life <= 0:
		situation_of_player = !situation_of_player
	bar_inversion_life -= .01
	var scale = float(bar_inversion_life) / float(init_bar_inversion_life)
	$time_inversion.scale = scale
	$timer_timInversion.start()


func _on_timer_recup_inversionBar_timeout():
	bar_inversion_life += .01
	var scale = float(bar_inversion_life) / float(init_bar_inversion_life)
	$time_inversion.scale = scale
	$timer_recup_inversionBar.start()

