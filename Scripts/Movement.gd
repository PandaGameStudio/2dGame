extends CharacterBody2D

var inputMovement = Vector2.ZERO
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
@export var speed = 80


func _physics_process(delta):
	move()



func move():
	inputMovement = Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	if inputMovement != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", inputMovement.normalized())
		animationTree.set("parameters/Walk/blend_position", inputMovement.normalized())
		animationState.travel("Walk")
		
		velocity = inputMovement.normalized() * speed
	if inputMovement == Vector2.ZERO:
		animationState.travel("Idle")
		velocity = Vector2.ZERO
	move_and_slide()
