class_name Tomato extends CharacterBody2D

signal caught;

@onready var sprite = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var img = randi() % 4+ 1
	sprite.texture = load(str("res://assets/tomato/tomato", img,".png"))
	velocity.x = 0;
	velocity.y = 300;
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	move_and_slide()
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	caught.emit()
	queue_free()
