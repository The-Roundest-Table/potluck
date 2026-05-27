extends BaseScene

@export var connected_scene: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	scene_manager.update_turn()
	Dialogic.start("boba_tea")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("skip"):
		scene_manager.change_scene(self, connected_scene)


func _on_straw_poked() -> void:
	scene_manager.change_scene(self, connected_scene)
	pass # Replace with function body.
