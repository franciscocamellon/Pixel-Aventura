extends CharacterBody2D

@onready var animation: AnimationPlayer = get_node("Animation")
@onready var texture: Sprite2D = get_node("Texture")

@export var move_speed: float = 256.0
@export var char_score: int = 0

var char_in_range: bool = false

func  _ready() -> void:
	if transition_screen.player_score != 0:
		return
	transition_screen.player_score = char_score

func _physics_process(delta):
	if char_in_range:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://pixel_adventure/dialogs/main.dialogue"), "start")
			return
	move()
	animate()
	

func move() -> void:
	var direction: Vector2 = get_direction()
	velocity = direction * move_speed
	move_and_slide()
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	).normalized()

func animate() -> void:
	if velocity.x > 0:
		texture.flip_h = false
	elif velocity.x < 0:
		texture.flip_h = true
		
	if velocity != Vector2.ZERO:
		animation.play("run")
		return
	
	animation.play("idle")


func on_detection_area_body_entered(body):
	if body.has_method("chat_talk"):
		char_in_range = true
	char_score += 1


func on_detection_area_body_exited(body):
	if body.has_method("chat_talk"):
		char_in_range = false
	get_tree().call_group("level", "increase_score")
	
