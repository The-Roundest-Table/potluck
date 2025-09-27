class_name Tomato extends CharacterBody2D

signal caught;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.x = 0;
	velocity.y = 300;
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	move_and_slide()
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	caught.emit()
	queue_free()
