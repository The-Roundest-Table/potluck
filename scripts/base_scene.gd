class_name BaseScene extends Node

@onready var tart: Node2D = $tart

# Called when the node enters the scene tree for the first time.
func _ready():
	if scene_manager.tart:
		print("hi tart")
		if tart:
			tart.queue_free()
			
		tart = scene_manager.tart
		add_child(tart)
		print("hey")
	
	position_tart()
	
func position_tart() -> void:
	var last_scene = scene_manager.last_scene_name
	print("hi")
#func position_player() -> void:
	#var last_scene = scene_manager.last_scene_name
	#if last_scene.is_empty():
		#last_scene = "any"
	#for entrance in entrance_markers.get_children():
		##print(last_scene)
		#if entrance is Marker2D and entrance.name == last_scene:
			#player.global_position = entrance.global_position
