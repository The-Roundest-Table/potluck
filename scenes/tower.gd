extends BaseScene
@export var death_scene: String
@export var win_scene: String
@onready var progressBar = $ProgressBar
@onready var wintimer = $winTimer
var play = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("boba_tea", "tower")
	var player = get_node("boba_player")
	player.get_node("moving").died.connect(_on_player_died)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if play:
		#print_debug(wintimer.time_left)
		progressBar.value = 20 - wintimer.time_left;
		
	if Input.is_action_pressed("skip"):
		scene_manager.end_game()

func _on_player_died():
	#print("die")
	scene_manager.cutscene(self, "starbucks")
	pass

func _on_win_timer_timeout() -> void:
	#print("win")
	scene_manager.cutscene(self, win_scene)
	pass # Replace with function body.

func _on_dialogic_signal(arg: String):
	if arg == "tower_start":
		play = true;
		wintimer.start()
