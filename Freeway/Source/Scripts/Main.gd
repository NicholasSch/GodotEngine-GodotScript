extends Node

const CAR_SCENE: PackedScene = preload("res://Prefabs/objects/Car.tscn")

var fast_lanes: Array[int] = [104, 272, 488]
var slow_lanes: Array[int] = [160, 216, 324, 384, 438, 544, 600]

var player1_score: int = 0
var player2_score: int = 0

func declare_game_winner(winner_text: String) -> void:
	$ThemeAudio.stop()
	$VictoryAudio.play()
	$FastCarsTimer.stop()
	$SlowCarsTimer.stop()
	$HUD/Message.text = winner_text
	$HUD/Button.show()
	
	# Disable processing to freeze player movements on round end
	$Player1.set_process(false)
	$Player2.set_process(false)

func _ready() -> void:
	$ThemeAudio.play()
	$HUD/Message.text = ""
	$HUD/Button.hide()
	randomize()

func _on_timer_carros_rapido_timeout() -> void:
	var new_car = CAR_SCENE.instantiate()
	add_child(new_car)
	
	# Select a fast-track lane layout index randomly
	var lane: int = fast_lanes[randi() % fast_lanes.size()]
	
	new_car.position = Vector2(-10, lane)
	new_car.linear_velocity.x = randf_range(700, 710)
	new_car.linear_damp = -1

func _on_timer_carros_lento_timeout() -> void:
	var new_car = CAR_SCENE.instantiate()
	add_child(new_car)
	
	# Select a slow-track lane layout index randomly
	var lane: int = slow_lanes[randi() % slow_lanes.size()]
	
	new_car.position = Vector2(-10, lane)
	new_car.linear_velocity.x = randf_range(300, 310)
	new_car.linear_damp = -1

func _on_restart() -> void:
	player1_score = 0
	player2_score = 0
	
	#Locate and flush active car entities to avoid collision overlaps
	for child in get_children():
		if child.name.begins_with("Car"):
			child.queue_free()
	
	# Re-enable processing loops cleanly on restart initialization
	$Player1.set_process(true)
	$Player2.set_process(true)
	
	$Player1.position = $Player1.initial_position
	$Player2.position = $Player2.initial_position2
	$ThemeAudio.play()
	
	$FastCarsTimer.start()
	$SlowCarsTimer.start()
	
	$HUD/Message.text = ""
	$HUD/ScoreP1.text = "0"
	$HUD/ScoreP2.text = "0"
	$HUD/Button.hide()


func _on_player1_scored() -> void:
	player1_score += 1
	$HUD/ScoreP1.text = str(player1_score)
	
	if player1_score >= 2:
		$Player2/Animation.stop()
		declare_game_winner("Player 1 Wins!")
	else:
		$ScoreAudio.play()



func _on_player2_scored() -> void:
	player2_score += 1
	$HUD/ScoreP2.text = str(player2_score)
	
	if player2_score >= 2:
		$Player1/Animation.stop()
		declare_game_winner("Player 2 Wins!")
	else:
		$ScoreAudio.play()
