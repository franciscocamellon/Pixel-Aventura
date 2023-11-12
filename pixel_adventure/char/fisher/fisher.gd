extends CharacterBody2D

@onready var animation: AnimationPlayer = get_node("Animation")
@onready var texture: Sprite2D = get_node("Texture")

func _physics_process(_delta):
	animate()

func animate() -> void:
	animation.play("fishing")
