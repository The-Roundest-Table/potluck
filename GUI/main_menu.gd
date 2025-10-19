extends Control

@onready var start = $VBoxContainer/start
@onready var settings = $VBoxContainer/settings
@onready var credits = $VBoxContainer/credits
@onready var exit = $VBoxContainer/exit
func _ready():
	start.button_down.connect(on_start_pressed)
	exit.button_down.connect(on_exit_pressed)
	settings.button_down.connect(on_controls_pressed)
	credits.button_down.connect(on_credits_pressed)

func on_start_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/roulette.tscn")
	
func on_exit_pressed() -> void:
	get_tree().quit()
	
func on_credits_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/GUI/credits.tscn")

func on_controls_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/GUI/controls.tscn")
