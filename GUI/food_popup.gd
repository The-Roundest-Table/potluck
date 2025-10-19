extends Node2D
var opened = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		print("closing")
		close();

func open():
	visible = true
	opened = true
	$Control/name.text = "Test Name"
	$Control/description.text = "test description"
	
func close():
	print("close")
	visible = false
