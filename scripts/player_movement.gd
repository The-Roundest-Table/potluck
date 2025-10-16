class_name Player_Movement extends Node

const SPEED = 300.0
var speed = 1;
@onready var parent: CharacterBody2D = get_parent()

var alive = true;
signal died

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
	#handleCollision();
	

func handleCollision():
	for i in parent.get_slide_collision_count():
		var collision = parent.get_slide_collision(i);
		var collider = collision.get_collider();
		print(collider.name)


func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.name)
	alive = false
	died.emit()
	pass # Replace with function body.
