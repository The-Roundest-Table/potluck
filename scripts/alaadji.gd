extends Node2D

var placed = false

func _process(delta: float) -> void:
	if scene_manager.berries == 5:
		#Dialogic.start('berries_smell')
		$Button.disabled = false
		

func _on_button_pressed() -> void:
	placed = true
	print("alaadji placed")
	Dialogic.start('berries_spirits')
