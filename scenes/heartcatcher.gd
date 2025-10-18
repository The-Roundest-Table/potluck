extends BaseScene

@export var tomato : PackedScene
@onready var player: CharacterBody2D = $Pan
@export var connected_scene: String
var tomatoes = [];

var tomcount = 0;

const TIME_PERIOD = 0.5

var time = 0
var delay = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta;

	if time > TIME_PERIOD:
		var new_icon = tomato.instantiate();
		new_icon.position.y = -5
		new_icon.position.x = randi()% get_viewport().size.x
		add_child(new_icon)
		tomatoes.append(new_icon.caught.connect(on_tomato_caught))
		time = 0
	if tomcount >= 20:
		scene_manager.change_scene(self, connected_scene)
		
		
	

func on_tomato_caught():
	tomcount+=1
	print(tomcount)
