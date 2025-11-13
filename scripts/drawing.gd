class_name Heart_sauce extends BaseScene
@onready var lines: Node2D = $Line2D
@onready var Brush = preload("res://assets/heart.jpg")
@export var connected_scene: String

var pressed:bool = false
var current_line: Line2D = null


func _ready():
	super()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			pressed = event.pressed
			
			if pressed:
				current_line = Line2D.new()
				#current_line.default_color = Color.BROWN
				current_line.width = 20
				current_line.texture_mode = Line2D.LINE_TEXTURE_TILE
				current_line.texture = Brush
				lines.add_child(current_line)
				current_line.add_point(event.position)
	elif  event is InputEventMouseMotion and pressed:
		current_line.add_point(event.position)
