extends CharacterBody2D

@onready var animate = get_node("AnimatedSprite2D")
const SPEED = 300.0


func _physics_process(delta):
	var ordonate = Input.get_axis("ui_left", "ui_right")
	var axis = Input.get_axis("ui_up", "ui_down")
	if ordonate:
		velocity.x = ordonate * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if axis:
		velocity.y = axis * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if ordonate > 0:
		animate.play("right")
	if ordonate < 0:
		animate.play("left")
	if axis > 0:
		animate.play("down")
	if axis < 0:
		animate.play("top")
	move_and_slide()
