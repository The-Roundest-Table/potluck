class_name straw extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var drop = false
@export var limit = 10
@export var endPoint: Marker2D

signal poked

var startPosition
var endPosition

func _ready():
	startPosition = position
	endPosition = endPoint.global_position
	
func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd

func updateVelocity():
	var moveDirection = endPosition - position
	if moveDirection.length() < limit:
		print("hi")
		changeDirection()
	velocity.x = moveDirection.normalized().x * SPEED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and drop:
		
		velocity += get_gravity() * delta *2


	#velocity.x = direction * SPEED
	if !drop:
		updateVelocity()
	else:
		velocity.x = 0
	move_and_slide()
	handleCollision()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		drop = true


func _on_fall_body_entered(body: Node2D) -> void:
	#print("missed")
	if body is straw:
		drop = false
		velocity.y = 0
		position = startPosition;

func handleCollision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i);
		var collider = collision.get_collider();
		print(collider.name)
		if collider.name == "cupfloor":
			poked.emit()
