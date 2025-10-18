extends BaseScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("timeline")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	print("done talking")
	scene_manager.change_scene(self, "heartcatcher")
	# do something else here
