extends BaseScene

@onready var mixingAnimator = $Kyorchech/AnimationPlayer
@onready var timerForDialogue = $Kyorchech/TimerDialogueAppear
@onready var timerStopProgress = $Kyorchech/TimerToStopProgress
@onready var progressBar = $Kyorchech/RadialProgress
var Mixing:bool = true
var MixLeft:bool = true
var MixRight:bool = true
var DialogueCount = 0
@export var connected_scene: String

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	super()

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		Mixing = true
		if (Mixing == true):
			if (MixLeft == true):
				mixingAnimator.play("mix_left")
				progressBar.value += 1
				MixLeft = false
				MixRight = true
		
		#Mixing = true
		#timerForDialogue.start()
	if Input.is_action_pressed("right"):
		Mixing = true
		if (Mixing == true):
			if (MixRight == true):
				mixingAnimator.play("mix_right")
				progressBar.value += 1
				MixRight = false
				MixLeft = true
		
		#Mixing = true
	if Input.is_action_pressed("left") && Input.is_action_pressed("right"):
		Mixing = false
	if Input.is_action_pressed("skip"):
		scene_manager.end_game()
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
			Dialogic.start('berries_mixing', 'Kyorchekh')
	
			
		
	



func _on_timer_to_stop_progress_timeout() -> void:
	print("timer to stop progress")
	timerForDialogue.stop()
	progressBar.value = 0
func _on_dialogic_signal(argument:String):
	if argument == "mixing_ended":
		#print("mixing ended")
		if DialogueCount == 7:
			Dialogic.start('berries_ending2')
			scene_manager.poem[3] = "Unresolved questions sit heavy like berry chunks"
		if DialogueCount <= 4:
			Dialogic.start('berries_ending1')
			scene_manager.poem[3] = "A wave of lavender soothes for a moment"
		if DialogueCount > 4 && DialogueCount < 7:
			Dialogic.start('berries_ending3')
	if argument == "end_berries":
		scene_manager.change_scene(self, connected_scene)
	if argument == "start_mixing":
		$Kyorchech.visible = true
		$MyHand.visible = false
		$MyMomsHand.visible = false
		$Butterfly.visible = false
	if argument == "mom_hands":
		$Kyorchech/MomsHands.visible = true
	if argument == "start_color":
		mixingAnimator.play("color")


func _on_dialogue_trigger_1_area_entered(area: Area2D) -> void:
	$Butterfly.visible = true
	#$Butterfly/ButterflyArea2D.monitorable = true
	#$Butterfly/ButterflyArea2D.monitoring = true
	#Dialogic.start('berries_mixing', 'Beginning')
