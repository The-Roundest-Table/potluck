extends BaseScene

@onready var tart_copies: Node2D = $tart_copies


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	#print(tart)
	for i in tart.get_children():
		tart_copies.add_child(i.duplicate());
	tart.visible = false
	#print(tart_copies.get_children())
	for i in 3:
		for j in 3:
			var newtart = tart_copies.duplicate()
			print(str(i,newtart.position))
			add_child(newtart)
			newtart.set_position(Vector2(170*i+ 400,100*j+ 200))
			#newtart.set_global_position(get_viewport().get_visible_rect().size)
	tart_copies.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
