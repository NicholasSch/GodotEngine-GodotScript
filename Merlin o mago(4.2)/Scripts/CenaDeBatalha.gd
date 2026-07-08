extends Node2D
func _ready():
	$Merlim.speed=0
	$Merlim/Camera2.current=true
	$Merlim/MerlinAnim.play("Side")
	$Merlim/MerlinAnim.stop()
	$Merlim.powers = true
