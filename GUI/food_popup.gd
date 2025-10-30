extends Node2D
var opened = false
var closed = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#close()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_anything_pressed() and opened and !closed:
		close();

func open(name, desc):
	visible = true
	opened = true
	$Control/name.text = name
	$Control/description.text = desc
	
func close():
	print("close")
	closed = true
	visible = false
