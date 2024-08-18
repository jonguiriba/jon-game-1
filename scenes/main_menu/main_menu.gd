extends Node2D

@onready var new_game:Label = $BoxContainer/VBoxContainer/Label

	 
func _ready()->void:
	new_game.connect("gui_input",_on_click_new_game)
	
func _on_click_new_game(event: InputEvent)->void:
	if(event.is_action_pressed("left-click")):
		SceneManager.change_scene("level_1")
		print("TEST",event.as_text())
