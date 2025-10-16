extends Node2D

func _process(delta: float) -> void:
	if scene_manager.berries == 5:
		$Button.disabled = false

func _on_button_pressed() -> void:
	print("alaadji placed")
