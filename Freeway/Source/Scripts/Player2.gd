extends Area2D

@export var speed: int = 100

var screen_size: Vector2
var initial_position2: Vector2 = Vector2(800, 690)

signal scored

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	var velocity := Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	velocity = velocity.normalized() * speed
	
	if velocity.length() > 0:
		$Animation.play()
	else:
		$Animation.stop()
		
	if velocity.y > 0: 
		$Animation.animation = "down"
	elif velocity.y < 0: 
		$Animation.animation = "up"

	# Apply frame-rate independent position translation
	position += velocity * delta
	position.y = clamp(position.y, 0, screen_size.y)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "FinishLine":
		scored.emit()
	else:
		$DeathAudio.play()
		
	position = initial_position2
