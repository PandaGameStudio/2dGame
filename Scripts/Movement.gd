extends CharacterBody2D

var inputMovement = Vector2.ZERO
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
@onready var healthBar = $healthBar
@export var speed = 80
@export var maxHealth = 100
@export var health = maxHealth

func _ready():
	healthBar.value = maxHealth

func _process(delta):
	if health == 0:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
func _physics_process(delta):
	move()

func updateHealthBar():
	healthBar.value = health

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





func _on_hurt_box_body_entered(playerCollision):
	$Timer.start()
	print("hello")



func _on_timer_timeout():
	health = (health - 10)
	updateHealthBar()




func _on_hurt_box_body_exited(playerCollision):
	$Timer.stop()
