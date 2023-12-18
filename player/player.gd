extends CharacterBody2D

@export var speed = 125
@onready var _animated_sprite = $AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("walkleft", "walkright", "walkup", "walkdown")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_delta):
	if Input.is_action_pressed("walkup"):
		_animated_sprite.play("walkup")
	elif Input.is_action_pressed("walkdown"):
		_animated_sprite.play("walkdown")
	elif Input.is_action_pressed("walkleft"):
		_animated_sprite.play("walkleft")
	elif Input.is_action_pressed("walkright"):
		_animated_sprite.play("walkright")
	else:
		_animated_sprite.play("idledown")
