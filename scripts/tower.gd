extends Node2D
 
@onready var ray_cast = $RayCast2D
@onready var timer = $Timer
@export var ammo : PackedScene
@export var start: Marker2D

 
var player
 
func _ready():
	player = get_parent().find_child("boba_player")
 
func _physics_process(_delta):
	_aim()
	_check_player_collision()
 
func _aim():
	ray_cast.target_position = player.position - ray_cast.position
 
func _check_player_collision():
	#pass
	if ray_cast.get_collider() == player and timer.is_stopped():
		timer.start()
	elif ray_cast.get_collider() != player and not timer.is_stopped():
		timer.stop()
 
 
func _on_timer_timeout():
	_shoot()
 
func _shoot():
	pass
	var bullet = ammo.instantiate()
	bullet.position = start.position
	bullet.rotation = ray_cast.target_position.angle() + deg_to_rad(90)
	bullet.direction = (ray_cast.target_position).normalized()
	get_tree().current_scene.add_child(bullet)
