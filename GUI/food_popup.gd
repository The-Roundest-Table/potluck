extends Node2D
var opened = false
var closed = false
var food: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#close()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_R) and opened and !closed:
		close();

func open(name, desc, art, item):
	visible = true
	opened = true
	food = item
	$Control/name.text = food
	$Control/description.text = desc
	$food.texture = load(art)
	
func close():
	print("close")
	closed = true
	visible = false


func _on_food_pop_up_button_pressed() -> void:
	scene_manager.update_turn()
	print_debug(food)
	if "heartcatcher nastar boba kyorchekh".contains(food):
		print_debug("minigame")
		scene_manager.change_scene(get_parent(), food);
	else:
		print_debug("roulette")
		visible = false
