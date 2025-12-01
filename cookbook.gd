class_name Cookbook extends AnimatedSprite2D

@export var page_count : int = 3 #total page count

var current_page: int = 0 #tracks current page
var is_open = false




var contents: Dictionary = {}
var array = [0, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#close()
	$food1/food1.button_down.connect(open_recipe);
	$food2/food2.button_down.connect(open_recipe);
	$food3/food3.button_down.connect(open_recipe);
	$food4/food4.button_down.connect(open_recipe);
	
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

func update_cookbook(food, id):
	array[id] = food;
	pass

func update_page():
	
	$food1.texture = load(array[current_page*4].art) if array[current_page*4] is Dictionary else load("res://assets/food art/yogurt.png");
	$food2.texture = load(array[current_page*4+1].art) if array[current_page*4+1] is Dictionary else load("res://assets/food art/yogurt.png");
	$food3.texture = load(array[current_page*4+2].art) if array[current_page*4+2] is Dictionary else load("res://assets/food art/yogurt.png");
	$food4.texture = load(array[current_page*4+3].art) if array[current_page*4+3] is Dictionary else load("res://assets/food art/yogurt.png");
	#$food1/TextureButton

func go_to_page(page:int):
	if current_page == page:
		return
	if page < 0 or page > page_count:
		return
	if page > current_page:
		play("next")
	elif page < current_page:
		play("prev")
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

func open_recipe():
	
	pass
