extends CharacterBody2D
var velocity = Vector2()
var direction = 1
var speed = 230
func _ready():
	velocity.x=speed*direction

func _physics_process(delta):
	$FireballAnim.play("Animation")
	if velocity.x<0:
		$FireballAnim.flip_h=true
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	velocity=velocity


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
