extends BaseScene

@onready var tart_copies: Node2D = $tart_copies
@export var connected_scene: String

var stop_baking = false;
var time
var tarts = [0, 0, 0, 0, 0];

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	Dialogic.start('baking')
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
	#print(tart)
	for i in 5:
		tarts[i] = tart.duplicate();
		add_child(tarts[i])
		tarts[i].set_position(Vector2(170*i+ 400,200))
	tart.visible = false
	tart.queue_free();
	

func _on_dialogic_signal(argument:String):
	if argument == "bake_done":
		scene_manager.change_scene(self, connected_scene)


func _on_button_button_down() -> void:
	Dialogic.start('baking', 'test')
	pass # Replace with function body.
