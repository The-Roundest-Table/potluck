extends CharacterBody2D

var run_speed = 1000
@onready var player = $"../MyHand"
var Detected = false

func _physics_process(delta):
	#velocity = Vector2.ZERO
	#if player:
	if (Detected == true):
		velocity = -position.direction_to(player.position) * run_speed
		run_speed = 500
	if (Detected == false):
		velocity = position.direction_to(player.position) * run_speed
		run_speed = 250
	#velocity = -position.direction_to(player.position) * run_speed
	#else:
		#velocity = position.direction_to(player.position) * run_speed
	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	Detected = true
	#player = $"../MyHand"
	#run_speed = 250


func _on_detection_area_body_exited(body: Node2D) -> void:
	#player = body
	Detected = false
	#velocity = Vector2.ZERO


func _on_detection_area_area_entered(area: Area2D) -> void:
	Detected = true


func _on_detection_area_area_exited(area: Area2D) -> void:
	Detected = false
