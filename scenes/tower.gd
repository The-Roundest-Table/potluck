extends BaseScene
@export var death_scene: String
@export var win_scene: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	var player = get_node("boba_player")
	player.get_node("moving").died.connect(_on_player_died)
	var wintime = get_node("winTimer")
	wintime.timeout.connect(_on_win)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_player_died():
	print("die")
	scene_manager.change_scene(self, death_scene)
	pass

func _on_win():
	scene_manager.change_scene(self, win_scene)
