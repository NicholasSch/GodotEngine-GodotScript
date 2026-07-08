extends CanvasLayer
signal start_game
@onready var animation = get_node("AnimT")
var target_level:String

func fade_in(level:String)->void:
	target_level = level
	animation.play("Fade in")

func _on_AnimT_animation_finished(anim_name):
	if anim_name == "Fade in":
		var _change_Level = get_tree().change_scene_to_file(target_level)
		animation.play("Fade out")
	elif anim_name == "Fade out":
		emit_signal("start_game")
