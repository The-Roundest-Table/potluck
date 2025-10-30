extends MeshInstance2D

var speed = 0.1
var stop = false
var choice;

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
		choice = int(rad_to_deg(rotation))%360

	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("select"):
		stop = true
