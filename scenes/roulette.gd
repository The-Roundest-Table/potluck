extends BaseScene


var special_food = ['kyorchekh', 'boba', 'heartcatcher', 'nastar']

var foods_json = "res://scripts/foods.json"
var food_descs: Dictionary = {}
@onready var popup;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	popup = get_node("FoodPopup")
	load_json_file()
	#print(food_descs.get(rounds[0][1]).name)
	super()

func load_json_file():
	#open file for reading
	var file = FileAccess.open(foods_json, FileAccess.READ)
	#check if file exists
	assert(file.file_exists(foods_json), "File path does not exist")
	
	#read contents of the file as text
	var json = file.get_as_text()
	var json_object = JSON.new()
		
	#parse the json text
	json_object.parse(json)
	food_descs = json_object.data
	
	return food_descs
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("book"):
		scene_manager.open_cookbook(self)
	$turn.text = str("Turn ", scene_manager.turn + 1)


func _on_spinner_selection(choice) -> void:
	var item;
	if scene_manager.turn != 3:
		item = scene_manager.regular_food[choice]
		scene_manager.regular_food.pop_at(choice)
	else:
		item = special_food[choice % 4];
	var name = food_descs.get(item).name
	var desc = food_descs.get(item).description
	var art = food_descs.get(item).art
	scene_manager.poem[scene_manager.turn] = desc
	scene_manager.update_cookbook(food_descs.get(item))
	popup.open(name, desc, art, item)
	


func _on_cookbook_button_down() -> void:
	scene_manager.open_cookbook(self)


func _on_help_button_down() -> void:
	scene_manager.open_instructions(self)
	pass # Replace with function body.
