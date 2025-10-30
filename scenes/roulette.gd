extends BaseScene

var rounds = [
	['sate', 'stroganina', 'egg tofu', 'heartcatcher'],
	['flapjack', 'mooncake', 'alaadji', 'nastar'],
	['kyorchekh', 'es campur', 'tanghulu', 'naijuan'],
	['boba_tea', 'durian', 'ching bo leung', 'khaan']
]

var foods_json = "res://scripts/foods.json"
var food_descs: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_json_file()
	print(food_descs.get(rounds[0][1]).name)
	super()
	pass # Replace with function body.

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
	pass


func _on_spinner_selection(choice) -> void:
	#print_debug(choice)
	print_debug(rounds[scene_manager.round][choice])
	var name = food_descs.get(rounds[scene_manager.round][choice]).name
	var desc = food_descs.get(rounds[scene_manager.round][choice]).description
	
	
	get_node("FoodPopup").open(name, desc)
	pass # Replace with function body.
