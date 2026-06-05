class_name Cookbook extends Sprite2D

@export var page_count : int = 3 #total page count

var current_page: int = 0 #tracks current page
var is_open = false




var contents: Dictionary = {}
var array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#close()
	#$food1/food1.button_down.connect(open_recipe, 1);
	#$food2/food2.button_down.connect(open_recipe, 2);
	#$food3/food3.button_down.connect(open_recipe, 3);
	#$food4/food4.button_down.connect(open_recipe, 4);
	current_page = 0;
	array = [$"../food1", $"../food2", $"../food3", $"../food4"]
	go_to_page(current_page)
	update_page()
	
	pass # Replace with function body.

func load_pages():
	
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("book"):
		get_tree().call_deferred('change_scene_to_file', "res://scenes/roulette.tscn")
		#if is_open:
			#close()
		#else:
			#open()

func close():
	visible = false
	is_open = false

func open():
	visible = true
	is_open = true
	current_page = 0;
	go_to_page(current_page)
	update_page()
	#$Control/PageContent.text = page_content[0]
	#$Control/PageContent2.text = page_content2[0]

func update_page():
	var count = 0;
	for food in array:
		if scene_manager.cookbook_array[current_page*4 + count] is Dictionary:
			var art = scene_manager.cookbook_array[current_page*4 + count].art
			if art.contains("nastar"):
				food.texture_normal = load(scene_manager.nastar_photo);
			else:
				food.texture_normal = load(art)
		else:
			food.texture_normal = load("res://assets/final/cookbook/cookbook_default.png")
		#if art.has("nastar"):
			#food.texture_normal = scene_manager.nastar_photo;
		#else:
			#food.texture_normal = load(scene_manager.cookbook_array[current_page*4 + count].art) if scene_manager.cookbook_array[current_page*4 + count] is Dictionary else load("res://assets/food art/yogurt.png");
		count += 1;
	#$"../food1".texture_normal = load(scene_manager.cookbook_array[current_page*4].art) if scene_manager.cookbook_array[current_page*4] is Dictionary else load("res://assets/food art/yogurt.png");
	#$"../food2".texture_normal = load(scene_manager.cookbook_array[current_page*4+1].art) if scene_manager.cookbook_array[current_page*4+1] is Dictionary else load("res://assets/food art/yogurt.png");
	#$"../food3".texture_normal = load(scene_manager.cookbook_array[current_page*4+2].art) if scene_manager.cookbook_array[current_page*4+2] is Dictionary else load("res://assets/food art/yogurt.png");
	#$"../food4".texture_normal = load(scene_manager.cookbook_array[current_page*4+3].art) if scene_manager.cookbook_array[current_page*4+3] is Dictionary else load("res://assets/food art/yogurt.png");

func go_to_page(page:int):
	if current_page == page:
		return
	if page < 0 or page > page_count:
		return
	if page > current_page:
		#play("next")
		pass
	elif page < current_page:
		#play("prev")
		pass
	current_page = page
	print_debug(current_page)
	#$Control/PageContent.text = page_content[current_page]
	#$Control/PageContent2.text = page_content2[current_page]


func _on_left_button_down() -> void:
	var new_page = current_page-1;
	if new_page < 0:
		new_page = 0;
	#while !scene_manager.pages[new_page]:
		#if new_page < 0:
			#new_page = page_count;
		#else:
			#new_page-=1
	go_to_page(new_page)
	pass # Replace with function body.


func _on_right_button_down() -> void:
	var new_page = current_page+1;
	if new_page > page_count:
		new_page = page_count;
	#while !scene_manager.pages[new_page]:
		#if new_page > page_count:
			#new_page = 0;
		#else:
			#new_page+=1
	go_to_page(new_page)

func open_recipe(item):
	print_debug(item);
	var index = current_page*4 + item
	var check = scene_manager.cookbook_array[index]
	if check is Dictionary:
		$"../../Recipe".visible = true;
		$"../../Recipe/left/Name".text = check.name
		$"../../Recipe/left/Art".texture = load(check.art)
		$"../../Recipe/left/Desc".text = check.description
		print_debug($"../../Recipe/left/Desc".text)
		var str = "";
		for i in check.ingredients:
			#print_debug(i)
			str = str + i + "\n"
		$"../../Recipe/right/Ingredients2".text = str


func _on_food_1_button_down() -> void:
	open_recipe(0)
	pass # Replace with function body.


func _on_food_2_button_down() -> void:
	open_recipe(1)


func _on_food_3_button_down() -> void:
	open_recipe(2)


func _on_food_4_button_down() -> void:
	open_recipe(3)


func _on_roulette_button_down() -> void:
	get_tree().call_deferred('change_scene_to_file', "res://scenes/roulette.tscn")
