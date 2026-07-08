extends RigidBody2D

func _ready() -> void:
	# Fetch all available animation names configured inside the AnimatedSprite2D node
	var car_types: PackedStringArray = $Animation.sprite_frames.get_animation_names()
	# Randomly select an animation profile to vary the car's visual skin
	var random_car: String = car_types[randi() % car_types.size()]
	$Animation.animation = random_car

func _on_notificator_screen_exited() -> void:
	queue_free()
