class_name Nastar_Decor extends Control

@onready var a = $Decor/cols/col1/a
@onready var b = $Decor/cols/col1/b
@onready var c = $Decor/cols/col1/c
@onready var d = $Decor/cols/col1/d
@onready var e = $Decor/cols/col2/e
@onready var f = $Decor/cols/col2/f
@onready var g = $Decor/cols/col2/g
@onready var h = $Decor/cols/col2/h

@onready var buttons = [a, b, c, d, e, f, g, h];

var decor_state = [false, false, false, false, false, false, false, false]

@onready var decors = [$Node2D/a, $Node2D/a2, $Node2D/a3, $Node2D/a4, $Node2D/a5, $Node2D/a6, $Node2D/a7, $Node2D/a8]


# Called when the node enters the scene tree for the first time.
func _ready():
	for n in buttons.size():
		buttons[n].button_down.connect(on_a_pressed.bind(n))
	#start_button.button_down.connect(on_start_pressed)
	#exit_button.button_down.connect(on_exit_pressed)
	#controls_button.button_down.connect(on_controls_pressed)
	#credits_button.button_down.connect(on_credits_pressed)

#func on_start_pressed() -> void:
	#get_tree().call_deferred('change_scene_to_file', "res://scenes/locations/home.tscn")")
func on_a_pressed(n) -> void:
	#print(n)
	decor_state[n] = !decor_state[n]
	print(decor_state)
	decors[n].visible = decor_state[n];
	
