extends CharacterBody2D

var last_horizontal_direction: int = 0
var last_vertical_direction: int = 0
var horizontal_direction: int = 0
var vertical_direction: int = 0
const SPEED = 200

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	make_movement()
	adjust_animation()


func make_movement():
	last_horizontal_direction = horizontal_direction
	last_vertical_direction = vertical_direction
	horizontal_direction = Input.get_action_strength("ui_right") \
		- Input.get_action_strength("ui_left")
	vertical_direction = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var direction = Vector2(horizontal_direction, vertical_direction).normalized()
	velocity = direction * SPEED
	move_and_slide()


func adjust_animation():
	match horizontal_direction:
		1:
			attempt_animation("move-right")
		-1:
			attempt_animation("move-left")
		0:
			match vertical_direction:
				1:
					attempt_animation("move-down")
				-1:
					attempt_animation("move-up")
				0:
					make_idle_animation()


func make_idle_animation():
	match last_horizontal_direction:
		1:
			attempt_animation("idle-right")
		-1:
			attempt_animation("idle-left")
		0:
			match last_vertical_direction:
				1:
					attempt_animation("idle-down")
				-1:
					attempt_animation("idle-up")


func attempt_animation(anim_name: String):
	if animated_sprite.animation != anim_name:
		animated_sprite.play(anim_name)
