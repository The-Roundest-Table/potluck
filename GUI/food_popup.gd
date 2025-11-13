extends Node2D
var opened = false
var closed = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#close()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_E) and opened and !closed:
		close();

func open(name, desc, art):
	visible = true
	opened = true
	$Control/name.text = name
	$Control/description.text = desc
	$food.texture = load(art)
	
func close():
	print("close")
	closed = true
	visible = false
