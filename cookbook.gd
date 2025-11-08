class_name Cookbook extends AnimatedSprite2D

@export var page_count : int = 3 #total page count

var current_page: int = 0 #tracks current page
var is_open = false




var contents: Dictionary = {}
var array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close()
	pass # Replace with function body.

func load_pages():
	
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("book"):
		if is_open:
			close()
		else:
			open()

func close():
	visible = false
	is_open = false

func open():
	visible = true
	is_open = true
	current_page = 0;
	go_to_page(current_page)
	$food1;
	$food2;
	$food3;
	$food4;
	#$Control/PageContent.text = page_content[0]
	#$Control/PageContent2.text = page_content2[0]

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
