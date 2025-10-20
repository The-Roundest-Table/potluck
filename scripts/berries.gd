extends Node2D



func button_pressed() -> void:
	scene_manager.berries += 1
	queue_free()
