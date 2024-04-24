class_name Snowball
extends RigidBody3D

const GROWTH_CONSTANT: float = 0.001
const MAXIMUM_SIZE: float = 7.0

@onready var model_pivot: Node3D = $"Model Pivot"
@onready var collision_shape: CollisionShape3D = $"CollisionShape3D"
@onready var area_shape: Area3D = $"Area3D"

@export var team: Global.TEAM
const start_scale: Vector3 = 0.75 * Vector3.ONE
var child_scale: Vector3

#const red_snowball_scene = preload("res://snowball/snowball_red.tscn")
#const blue_snowball_scene = preload("res://snowball/snowball_blue.tscn")

static func new_snowball(player_team: Global.TEAM) -> Snowball:
	# According to https://github.com/godotengine/godot/issues/83404,
	# using preload in a constant can cause problems,
	# hence load is being used here, which is less efficient.
	
	var new_snowball_obj
	if (player_team == Global.TEAM.RED):
		new_snowball_obj = load("res://snowball/snowball_red.tscn").instantiate()
		new_snowball_obj.name = "red_snowball" + str(Global.r)
		Global.r += 1
		
	elif (player_team == Global.TEAM.BLUE):
		new_snowball_obj = load("res://snowball/snowball_blue.tscn").instantiate()
		new_snowball_obj.name = "blue_snowball" + str(Global.b)
		Global.b += 1
	
	new_snowball_obj.team = player_team
	
	return new_snowball_obj

func _ready():
	child_scale = start_scale
	model_pivot.scale = child_scale
	collision_shape.scale = child_scale

func _physics_process(_delta):
	var horizontal_velocity: Vector2 = Vector2(linear_velocity.x, linear_velocity.z)
	var speed: float = horizontal_velocity.length()
	if speed > 0:
		var change: float = GROWTH_CONSTANT * speed
		increment_children_scale(change)

func increment_children_scale(change):
	#child_scale = Vector3(1, 1, 1)
	if model_pivot.scale.length() < MAXIMUM_SIZE and collision_shape.scale.length() < MAXIMUM_SIZE:
		var change_scale_vec: Vector3 = change * Vector3.ONE
		child_scale += change_scale_vec
		model_pivot.scale = child_scale
		collision_shape.scale = child_scale
		area_shape.scale = child_scale

func get_team() -> Global.TEAM:
	return team

var decrement = 0

func _on_area_3d_body_entered(body):
	var horizontal_velocity: Vector2 = Vector2(linear_velocity.x, linear_velocity.z)
	var speed: float = horizontal_velocity.length()
	if (get_team() == 0 and "blue_snowball" in body.name) or (get_team() == 1 and "red_snowball" in body.name):
		var bhorizontal_velocity: Vector2 = Vector2(body.linear_velocity.x, body.linear_velocity.z)
		var bspeed: float = bhorizontal_velocity.length()
		if speed < bspeed:
			decrement = 0.15
		else:
			decrement = 0.005
		child_scale -= child_scale*decrement
		model_pivot.scale = child_scale
		collision_shape.scale = child_scale
		area_shape.scale = child_scale
