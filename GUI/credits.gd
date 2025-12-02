extends BaseScene
@export var connected_scene: String

func _ready() -> void:
	super()
	


func _on_button_pressed() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://GUI/main_menu.tscn")
