extends CharacterBody2D

@onready var animation: AnimationPlayer = get_node("Animation")
@onready var texture: Sprite2D = get_node("Texture")

@export var move_speed: float = 256.0

func _physics_process(delta):
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
