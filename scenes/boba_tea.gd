extends BaseScene

@export var connected_scene: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_straw_poked() -> void:
	scene_manager.change_scene(self, connected_scene)
	pass # Replace with function body.
