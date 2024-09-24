extends CharacterBody2D

@export var speed = 200
@export var friction = 0.1
@export var acceleration = 0.1
@onready var animationTree : AnimationTree = $AnimationTree
@onready var animationPlayer = $AnimationPlayer



func get_input():
	var input = Vector2()
	if Input.is_action_pressed('moveRight'):
		input.x += 1
	if Input.is_action_pressed('moveLeft'):
		input.x -= 1
	if Input.is_action_pressed('moveDown'):
		input.y += 1
	if Input.is_action_pressed('moveUp'):
		input.y -= 1
	return input

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()
