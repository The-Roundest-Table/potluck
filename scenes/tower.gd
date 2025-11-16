extends BaseScene
@export var death_scene: String
@export var win_scene: String
@onready var progressBar = $ProgressBar
@onready var wintimer = $winTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	var player = get_node("boba_player")
	player.get_node("moving").died.connect(_on_player_died)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print_debug(wintimer.time_left)
	progressBar.value = 20 - wintimer.time_left;
	pass

func _on_player_died():
	print("die")
	scene_manager.cutscene(self, "starbucks")
	pass

func _on_win_timer_timeout() -> void:
	print("win")
	scene_manager.cutscene(self, win_scene)
	pass # Replace with function body.
