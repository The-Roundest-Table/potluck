extends Node2D

var tomato = preload("res://food/tomato.tscn")
@onready var player: CharacterBody2D = $Pan
var tomatoes = [];

var tomcount = 0;

const TIME_PERIOD = 0.5

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta;

	if time > TIME_PERIOD:
		var new_icon = tomato.instantiate();
		new_icon.position.y = -5
		new_icon.position.x = randi()% get_viewport().size.x
		add_child(new_icon)
		tomatoes.append(new_icon.caught.connect(on_tomato_caught))
		time = 0
	

func on_tomato_caught():
	tomcount+=1
	print(tomcount)
