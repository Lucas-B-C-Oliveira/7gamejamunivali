extends KinematicBody2D

var speed = Vector2(0,0)
var direction = Vector2(0,0)
var Velocity = Vector2()
export var Collected = 0 


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

#Movement
	var Moving = Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")
	if Moving:
		speed = 200
	else:
		speed = 0
		
	Velocity = speed * direction
	move_and_slide(Velocity)

#Drop Ball
if get_node("Global").PlayerBall == 1 and Input.
	
