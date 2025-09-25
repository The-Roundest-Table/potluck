extends Node2D
@onready var lines: Node2D = $Line2D
var pressed:bool = false
var current_line: Line2D = null

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			pressed = event.pressed
			
			if pressed:
				current_line = Line2D.new()
				current_line.default_color = Color.BROWN
				current_line.width = 4
				lines.add_child(current_line)
				current_line.add_point(event.position)
	elif  event is InputEventMouseMotion and pressed:
		current_line.add_point(event.position)
