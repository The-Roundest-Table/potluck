extends Node2D

@onready var mixingAnimator = $AnimationPlayer
@onready var timerForDialogue = $TimerDialogueAppear
@onready var timerStopProgress = $TimerToStopProgress
@onready var progressBar = $RadialProgress
var Mixing:bool = false

func _ready() -> void:
	pass
	#timerForDialogue.start()

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		mixingAnimator.play("mix_left")
		progressBar.value += 1
		#Mixing = true
		#timerForDialogue.start()
	if Input.is_action_pressed("right"):
		mixingAnimator.play("mix_right")
		progressBar.value += 1
		#Mixing = true
	#if(Input.is_anything_pressed()==false):
		#Mixing = false
	#if Mixing == true:
		#timerForDialogue.start()
	#if Mixing == false:
		#timerStopProgress.start()
	#if Input.is_action_pressed("left"):
		#progressBar.value  += 1*delta  
	#else:  
		#progressBar.value  = 0 



func _on_timer_dialogue_appear_timeout() -> void:
	pass
	#Dialogic.start('berries_mixing')
	
func _process(delta: float) -> void:
	#pass
	#progressBarTimer.start()
	
	#progressBar.value = timerForDialogue.time_left * 20
	#if $Button.pressed:  
		#$ProgressBar.value += 1*delta  
	#else:  
		#$ProgressBar.value = 0
	if progressBar.value == 500:
		#Dialogic.start('berries_mixing')
		#timerStopProgress.start()
		progressBar.value = 0
		Dialogic.start('berries_mixing')
	



func _on_timer_to_stop_progress_timeout() -> void:
	print("timer to stop progress")
	timerForDialogue.stop()
	progressBar.value = 0
