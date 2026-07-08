extends CharacterBody2D
var velocity = Vector2()
var direction = 1
var speed = 220
func _ready():
	velocity.x=speed*direction

func _physics_process(delta):
	$FuracaoAnim.play("Furacao")
	if velocity.x<0:
		$FuracaoAnim.flip_h=true
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	velocity=velocity

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
