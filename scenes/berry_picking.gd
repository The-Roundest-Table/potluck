extends BaseScene
var alaadji
@export var connected_scene: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	super()
	alaadji = get_node("alaadji")
	Dialogic.start('picking berries')
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if alaadji.placed:
		pass
		#Dialogic.start('berries_spirits')

func _on_dialogic_signal(argument:String):
	if argument == "berries_scene_end":
		scene_manager.change_scene(self, connected_scene)
