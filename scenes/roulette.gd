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
#		note: please fix, cookbook can't be opened
		scene_manager.open_cookbook(self)
		#get_tree().call_deferred('change_scene_to_file', "res://GUI/cookbook.tscn")
	#if popup.opened:
		#print_debug("close please")
	#$round.text = str("Round ", scene_manager.round + 1)
	$turn.text = str("Turn ", scene_manager.turn + 1)


func _on_spinner_selection(choice) -> void:
	#print_debug(choice)
	#print_debug(rounds[scene_manager.round][choice])
	#var item = rounds[scene_manager.round][choice]
	var item;
	if scene_manager.turn != 3:
		item = scene_manager.regular_food[choice]
		scene_manager.regular_food.pop_at(choice)
	else:
		item = special_food[choice];
	#var id = scene_manager.round*4 + choice
	#if scene_manager.cookbook_array.has(choice):
	#scene_manager.update_cookbook(food_descs.get(item),id)
	#var item = 'sate'
	if "heartcatcher nastar boba kyorchekh".contains(item):
		scene_manager.change_scene(self, item);
	else:
		var name = food_descs.get(item).name
		var desc = food_descs.get(item).description
		var art = food_descs.get(item).art
		popup.open(name, desc, art)
	
