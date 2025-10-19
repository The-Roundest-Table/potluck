extends MeshInstance2D

var speed = 0.1
var stop = false
#var choice = [a, b, c, d]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stop and (speed > 0):
		speed = speed - 0.0001
	rotate(speed)
	#rotation = rotation + delta
	
	if speed <= 0:
		print(int(rad_to_deg(rotation))%360)
		if !get_owner().get_node("FoodPopup").opened:
			get_owner().get_node("FoodPopup").open()

	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		stop = true
