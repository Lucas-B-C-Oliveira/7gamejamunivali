extends CanvasLayer

var bar_inversion_life = 2.5
var init_bar_inversion_life = bar_inversion_life
var side_of_player
var minion_caught

func _ready():
	$score.text = "SCORE "+ str(game_manager.score) + "/" + str (get_parent().qntBalls)
	pass 

func _process(delta):
	minion_caught = UIManager.get_caught_minion()
	$score.text = "SCORE "+ str(game_manager.score) + "/" + str (get_parent().qntBalls)


func _on_timer_inversion_bar_timeout():

	if bar_inversion_life <= 0:
		$time_inversion_bar/timer_inversion_bar.stop()
		get_parent().get_node("Player").set_situation_of_player(!get_parent().get_node("Player").get_situation_of_player())
		game_manager.ready_of_change_side = true
		game_manager.set_score(0)
		return
	

	if minion_caught:
		bar_inversion_life -= .01
		var scale = float(bar_inversion_life) / float(init_bar_inversion_life)
		$time_inversion_bar.scale = scale
		$time_inversion_bar/timer_inversion_bar.start()

	elif !minion_caught and bar_inversion_life < init_bar_inversion_life:
		bar_inversion_life += .008
		var scale = float(bar_inversion_life) / float(init_bar_inversion_life)
		$time_inversion_bar.scale = scale
		$time_inversion_bar/timer_inversion_bar.start()
