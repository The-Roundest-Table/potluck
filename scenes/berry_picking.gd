extends BaseScene
var alaadji
@export var connected_scene: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	alaadji = get_node("alaadji")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if alaadji.placed:
		print("hi")
		scene_manager.change_scene(self, connected_scene)
	pass
