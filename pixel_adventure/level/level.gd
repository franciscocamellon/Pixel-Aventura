extends Node2D

var score_count: int = 0

@export var target_score_count: int
@export var final_scene_path: String
@export var current_scene_path: String

func _ready() -> void:
	transition_screen.scene_path = current_scene_path

func increase_score() -> void:
	score_count += 1
	
	if score_count == target_score_count:
		transition_screen.scene_path = "res://pixel_adventure/level/credits.tscn"
		transition_screen.fade_in(true)
