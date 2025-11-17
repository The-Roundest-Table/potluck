extends BaseScene

@export var connected_scene: String

@onready var a = $Decor/cols/col1/a
@onready var b = $Decor/cols/col1/b
@onready var c = $Decor/cols/col1/c
@onready var d = $Decor/cols/col1/d
@onready var e = $Decor/cols/col2/e
@onready var f = $Decor/cols/col2/f
@onready var g = $Decor/cols/col2/g
@onready var h = $Decor/cols/col2/h

@onready var finish = $finish
@onready var buttons = [a, b, c, d, e, f, g, h];
@onready var decors = [$tart/a, $tart/a2, $tart/a3, $tart/a4, $tart/a5, $tart/a6, $tart/a7, $tart/a8]



# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start('nastar')
	for n in buttons.size():
		buttons[n].button_down.connect(on_a_pressed.bind(n))
	finish.button_down.connect(on_finish_pressed)

func on_a_pressed(n) -> void:
	decors[n].visible = !decors[n].visible;
	
func on_finish_pressed() -> void:
	Dialogic.start('nastar', 'decorate')
	
	#get_tree().call_deferred('change_scene_to_file', "res://scenes/bake.tscn")
func _on_dialogic_signal(argument:String):
	if argument == "nastar_done":
		scene_manager.change_scene(self, connected_scene)
