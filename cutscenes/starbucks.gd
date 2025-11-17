class_name Starbucks extends BaseScene
@export var connected_scene: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("boba_tea", "lose")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_dialogic_signal(arg: String):
	if arg == "end":
		scene_manager.change_scene(self, connected_scene)
