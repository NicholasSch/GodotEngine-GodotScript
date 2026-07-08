extends CharacterBody2D
var velocity = Vector2()
var direction = 1
var speed = 17
func _ready():
	velocity.y=speed*direction

func _physics_process(delta):
	$TempestadeAnim.play("Tempestade")
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	velocity=velocity
	
func _on_Timer_timeout():
	queue_free()
