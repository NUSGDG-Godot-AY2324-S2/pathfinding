extends CharacterBody2D

const SPEED = 100

@onready var player: CharacterBody2D = get_parent().get_node("Player")
@onready var navigator: NavigationAgent2D = $NavigationAgent2D


func _ready():
	find_path()


func _physics_process(delta):
	var direction = to_local(navigator.get_next_path_position()).normalized()
	velocity = direction * SPEED
	move_and_slide()


func find_path():
	navigator.target_position = player.position


func _on_navigation_timer_timeout():
	find_path()
