extends BaseScene

@onready var tart_copies: Node2D = $tart_copies
@export var connected_scene: String

var stop_baking = false;
var time
var tarts = [0, 0, 0, 0, 0];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	#print(tart)
	for i in 5:
		tarts[i] = tart.duplicate();
		add_child(tarts[i])
		tarts[i].set_position(Vector2(170*i+ 400,200))
	tart.visible = false
	tart.queue_free();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
