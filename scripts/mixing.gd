extends BaseScene

@onready var mixingAnimator = $AnimationPlayer
@onready var timerForDialogue = $TimerDialogueAppear
@onready var timerStopProgress = $TimerToStopProgress
@onready var progressBar = $RadialProgress
var Mixing:bool = false
var MixLeft:bool = true
var MixRight:bool = true
var DialogueCount = 0
@export var connected_scene: String

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	super()

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		if (MixLeft == true):
			mixingAnimator.play("mix_left")
			progressBar.value += 1
			MixLeft = false
			MixRight = true
		#Mixing = true
		#timerForDialogue.start()
	if Input.is_action_pressed("right"):
		if (MixRight == true):
			mixingAnimator.play("mix_right")
			progressBar.value += 1
			MixRight = false
			MixLeft = true
		#Mixing = true
	if Input.is_action_pressed("skip"):
		scene_manager.change_scene(self, connected_scene)
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
	#print(DialogueCount)
	if progressBar.value == 500:
		#Dialogic.start('berries_mixing')
		#timerStopProgress.start()
		progressBar.value = 0
		DialogueCount += 1
		if DialogueCount == 1:
			Dialogic.start('berries_mixing')
		if DialogueCount == 2:
			Dialogic.start('berries_mixing', 'string2')
		if DialogueCount == 3:
			Dialogic.start('berries_mixing', 'string3')
		if DialogueCount == 4:
			Dialogic.start('berries_mixing', 'string4')
		if DialogueCount == 5:
			Dialogic.start('berries_mixing', 'string5')
		if DialogueCount == 6:
			Dialogic.start('berries_mixing', 'string6')
		if DialogueCount == 7:
			Dialogic.start('berries_mixing', 'string7')
			
		
	



func _on_timer_to_stop_progress_timeout() -> void:
	print("timer to stop progress")
	timerForDialogue.stop()
	progressBar.value = 0
func _on_dialogic_signal(argument:String):
	if argument == "mixing_ended":
		#print("mixing ended")
		if DialogueCount == 7:
			Dialogic.start('berries_ending2')
		if DialogueCount <= 4:
			Dialogic.start('berries_ending1')
		if DialogueCount > 4 && DialogueCount < 7:
			Dialogic.start('berries_ending3')
	if argument == "end_berries":
		scene_manager.change_scene(self, connected_scene)
