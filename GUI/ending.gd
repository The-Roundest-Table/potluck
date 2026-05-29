extends Control
var PoemText
var Line1:String = "First Line"
var Line2:String = "Second Line"
var Line3:String = "Third Line"
var Line4:String = "Fourth Line"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PoemText = get_node("PoemFinal/Label")
	Line1 = scene_manager.poem[0]
	Line2 = scene_manager.poem[1]
	Line3 = scene_manager.poem[2]
	Line4 = scene_manager.poem[3]
	PoemText.text = Line1 + "\n" + Line2 + "\n" + Line3 + "\n" + Line4
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_return_button_down() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://GUI/main_menu.tscn")
	pass # Replace with function body.
