class_name Scene_Manager extends Node

var last_scene_name: String
var tart: Node2D
#var round = 0:
	#get:
		#return round;
var turn = 0;
var scene_dir_path = "res://scenes/"
var cutscene_dir_path = "res://cutscenes/"
var spins = 0;
var berries: int = 0
var cookbook_array = [0, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0]
var poem = ["0", "01", "02", "04"];
var regular_food = [ 'sate', 'egg tofu', 'stroganina', 'mooncake', 'alaadji', 'flapjack',
	'tanghulu', 'es campur', 'naijuan',
	'khaan', 'durian', 'ching bo leung'
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_turn():
	if turn < 4:
		turn +=1;
		print_debug(str("turn: ", turn))
	#else:
		#get_tree().call_deferred('change_scene_to_file',"res://GUI/ending.tscn")
	

func change_scene(from, to_scene_name: String) -> void:
	last_scene_name = from.name
	if from.name == "nastar":
		tart = from.tart
		tart.get_parent().remove_child(tart)
	else:
		tart = null
	
	var full_path = scene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred('change_scene_to_file', full_path)
	
func cutscene(from, to_scene_name: String) -> void:
	last_scene_name = from.name
	
	var full_path = cutscene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred('change_scene_to_file', full_path)

func update_cookbook(item, id):
	cookbook_array[id] = item;
	print_debug(cookbook_array[id])
	
func open_cookbook(from):
	last_scene_name = from.name
	from.get_tree().call_deferred('change_scene_to_file', "res://GUI/cookbook.tscn")

func reset_game():
	turn = 0
	spins = 0;
	berries = 0;
	poem = []
	
func end_game():
	get_tree().call_deferred('change_scene_to_file',"res://GUI/ending.tscn")
