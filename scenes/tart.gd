extends Node2D
var draggable = false:
	get:
		return draggable
var is_dragging = false;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if draggable and !get_owner():
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position();
		
		
	pass

func _on_area_2d_mouse_entered() -> void:
	#print_debug(get_owner())
	if !get_node("thing").has_overlapping_areas():
		#print("dragging")
		draggable = true;
	else:
		for i in get_node("thing").get_overlapping_areas():
			draggable = true;
			print_debug(i.get_parent().draggable)
			if i.get_parent().draggable:
				draggable = false;
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	draggable = false;
	pass # Replace with function body.
