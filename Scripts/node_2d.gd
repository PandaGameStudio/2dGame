extends Node2D

@onready var pauseMenu = $tileMapContainer/Player/pauseMenu

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_pressed("Pause"):
		pauseMenu.visible = true
