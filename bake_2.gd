class_name BakeScene extends BaseScene

@export var connected_scene: String
@onready var tart_copies: Node2D = $tart_copies

var tarts = [0, 0, 0, 0, 0];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start('baking')
	
	for i in 5:
		tarts[i] = tart.duplicate();
		add_child(tarts[i])
		tarts[i].set_position(Vector2(170*i+ 400,200))
	tart.visible = false
	tart.queue_free();



func _on_dialogic_signal(argument:String):
	if argument == "bake_done":
		scene_manager.change_scene(self, connected_scene)


func _on_finish_button_down() -> void:
	Dialogic.start('baking', 'test')
