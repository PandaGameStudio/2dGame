extends CanvasLayer

@onready var resume = $Control/HBoxContainer/Resume
@onready var exit = $Control/HBoxContainer/Exit

var paused: bool = false

func _ready():
	visible = false
	paused = false
	resume.connect("button_down", pause_handling)
	exit.connect("button_down", exit_handling)

func _unhandled_input(event):
	if Input.is_action_just_pressed("Pause"):
		pause_handling()

func pause_handling():
	#inverts pause to other state, unpausing or pausing game
	paused = !paused
	
	#matches pause value
	visible = paused
	get_tree().paused = paused

func exit_handling():
	get_tree().quit()
