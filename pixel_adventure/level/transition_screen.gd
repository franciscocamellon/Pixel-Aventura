extends CanvasLayer


@onready var animation: AnimationPlayer = get_node("Animation")

var scene_path: String = ""
var can_quit: bool = false
var player_score: int = 0

func fade_in(optional: bool = false) -> void:
	if optional:
		animation.play("finish_fade_in")
		return
	animation.play("fade_in")

func on_animation_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_in":
		
		if can_quit:
			get_tree().quit()
			return
			
		get_tree().change_scene_to_file(scene_path)
		animation.play("fade_out")
	
	if anim_name == "finish_fade_in":
		print(scene_path)
		get_tree().change_scene_to_file("res://pixel_adventure/level/credits.tscn")
		animation.play("fade_out")
