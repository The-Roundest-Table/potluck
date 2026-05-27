class_name Bake extends BaseScene

@onready var tart_copies: Node2D = $tart_copies
@export var connected_scene: String

var stop_baking = false;
var tarts = [0, 0, 0, 0, 0];

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
	for i in 5:
		tarts[i] = tart.duplicate();
		add_child(tarts[i])
		tarts[i].set_position(Vector2(100,100 + i*100))
		tarts[i].add_to_group("baked")
	tart.visible = false
	tart.queue_free();
	

func _on_dialogic_signal(argument:String):
	if argument == "bake_done":
		scene_manager.change_scene(self, connected_scene)


func _on_button_button_down() -> void:
	Dialogic.start('baking')

func _process(delta: float) -> void:
	if Input.is_action_pressed("skip"):
		scene_manager.change_scene(self, connected_scene)
