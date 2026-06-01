class_name Heart_sauce extends BaseScene
@onready var lines: Node2D = $Line2D
@onready var Brush = preload("res://assets/noodles/brush2.png")
@export var connected_scene: String
@onready var SoySauce = $SoySauce
@onready var animator = $AnimationPlayer
var sauce:bool = true
var pressed:bool = false
var current_line: Line2D = null
var sauce_on:bool = false;


func _ready():
	super()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start('heartsauce')
	
	#Input.set_custom_mouse_cursor(load("res://assets/placeholder/soy-sauce-peking-duck-kikkoman-bottle-bottle-f70ef99f0ea6d017a9d13fd3a746bb3f.png"))

func _input(event: InputEvent) -> void:
	if sauce_on:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT:
				pressed = event.pressed
				
				if pressed && sauce:
					animator.play("sauce_dripping_in")
					current_line = Line2D.new()
					#current_line.default_color = Color.BROWN
					current_line.width = 50
					current_line.texture_mode = Line2D.LINE_TEXTURE_STRETCH
					current_line.texture = Brush
					lines.add_child(current_line)
					current_line.add_point(event.position)
				if event.is_released() && sauce:
					animator.play("sauce_dripping_out")
				if pressed && !sauce:
					pass
		elif event is InputEventMouseMotion and pressed:
			current_line.add_point(event.position)


func _on_scallions_button_pressed() -> void:
	#sauce = false
	Dialogic.start('heartsauce', 'scallions')
	$ScallionsButton.disabled = true
	#current_line.width = 0
	#lines.visible = false
	#scene_manager.change_scene(self, connected_scene)

func _process(delta: float) -> void:
	SoySauce.position = get_viewport().get_mouse_position()
	
func _on_dialogic_signal(argument:String):
	if argument == "heartsauce_done":
		scene_manager.end_game()
	if argument == "scallions_sprinkle":
		animator.play("scallions")
		#sauce = false


func _on_texture_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$TextureButton/bottle.visible = false
		$SoySauce.visible = true
		sauce_on = true
	else:
		$TextureButton/bottle.visible = true
		$SoySauce.visible = false
		sauce_on = false
