class_name Scene_Manager extends Node

var last_scene_name: String
var tart: Node2D
var round = 1;
var scene_dir_path = "res://scenes/"
var cutscene_dir_path = "res://cutscenes/"
var spins = 0;
var berries: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func change_scene(from, to_scene_name: String) -> void:
	last_scene_name = from.name
	if from.name == "nastar_decor_game":
		tart = from.tart
		tart.get_parent().remove_child(tart)
	
	var full_path = scene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred('change_scene_to_file', full_path)
	
func cutscene(from, to_scene_name: String) -> void:
	last_scene_name = from.name
	
	var full_path = cutscene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred('change_scene_to_file', full_path)
