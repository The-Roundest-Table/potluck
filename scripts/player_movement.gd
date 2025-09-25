class_name Player_Movement extends Node

const SPEED = 300.0
var speed = 1;
@onready var parent: CharacterBody2D = get_parent()

var alive = true;




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	
func _physics_process(delta: float) -> void:
	#get input to move the player
	var direction := Input.get_axis("left", "right")
	if direction:
		parent.velocity.x = direction * SPEED * speed
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, SPEED*speed)
	parent.move_and_slide();
	handleCollision();
	

func handleCollision():
	for i in parent.get_slide_collision_count():
		var collision = parent.get_slide_collision(i);
		var collider = collision.get_collider();
		print(collider.name)
