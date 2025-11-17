class_name BaseScene extends Node

@onready var tart: Node2D = $tart

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	if scene_manager.tart:
		print(scene_manager.tart)
		if tart:
			tart.queue_free()
			
		tart = scene_manager.tart
		add_child(tart)
	
func position_tart() -> void:
	var last_scene = scene_manager.last_scene_name
