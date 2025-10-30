extends Node2D

@onready var mixingAnimator = $AnimationPlayer

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		mixingAnimator.play("mix_left")
	if Input.is_action_pressed("right"):
		mixingAnimator.play("mix_right")
