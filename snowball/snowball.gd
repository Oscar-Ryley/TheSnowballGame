class_name Snowball
extends RigidBody3D

const GROWTH_CONSTANT: float = 0.0005
const MAXIMUM_SIZE: float = 7.0

@onready var model_pivot: Node3D = $"Model Pivot"
@onready var collision_shape: CollisionShape3D = $"CollisionShape3D"

var team: Globals.TEAM

#const red_snowball_scene = preload("res://snowball/snowball_red.tscn")
#const blue_snowball_scene = preload("res://snowball/snowball_blue.tscn")

static func new_snowball(player_team: Globals.TEAM) -> Snowball:
	# According to https://github.com/godotengine/godot/issues/83404,
	# using preload in a constant can cause problems,
	# hence load is being used here, which is less efficient.
	
	var new_snowball_obj
	if (player_team == Globals.TEAM.RED):
		new_snowball_obj = load("res://snowball/snowball_red.tscn").instantiate()
		
	elif (player_team == Globals.TEAM.BLUE):
		new_snowball_obj = load("res://snowball/snowball_blue.tscn").instantiate()
	
	new_snowball_obj.team = player_team
	
	return new_snowball_obj

func _ready():
	model_pivot.scale = 0.75 * Vector3.ONE
	collision_shape.scale = 0.75 * Vector3.ONE

func _physics_process(_delta):
	var speed: float = linear_velocity.length()
	if speed > 0:
		var change: float = GROWTH_CONSTANT * speed
		increment_children_scale(change)

func increment_children_scale(change):
	if model_pivot.scale.length() < MAXIMUM_SIZE and collision_shape.scale.length() < MAXIMUM_SIZE:
		var new_scale_vec: Vector3 = change * Vector3.ONE
		model_pivot.scale += new_scale_vec
		collision_shape.scale += new_scale_vec
