extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
# Still need to preload the Snowball Scenes, else the loading of the scene slows down the game.
const snowball_red: Resource = preload("res://snowball/snowball_red.tscn")
const snowball_blue: Resource = preload("res://snowball/snowball_blue.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var facing = Vector3.FORWARD

@export
var team: Global.TEAM = Global.TEAM.UNASSIGNED

@onready
var direction_ball = $DirectionBall

@onready
var area = $SnowballArea3D

class Controls:
	var LEFT: String
	var RIGHT: String
	var UP: String 
	var DOWN: String 
	var SPAWN_SNOWBALL: String
	
	func _init(team: Global.TEAM):
		var team_str: String = Global.TEAM.keys()[team]
		LEFT = str(team_str, "_player_left")
		RIGHT = str(team_str, "_player_right")
		UP = str(team_str, "_player_up")
		DOWN = str(team_str, "_player_down")
		SPAWN_SNOWBALL = str(team_str, "_player_spawn_snowball")
	
	func get_input_vector() -> Vector2:
		return Input.get_vector(LEFT, RIGHT, UP, DOWN)

var player_controls: Controls

func _ready():
	var outline: MeshInstance3D
	
	if (team == Global.TEAM.RED):
		outline = load("res://player/outlines/red_outline.tscn").instantiate()
	elif (team == Global.TEAM.BLUE):
		outline = load("res://player/outlines/blue_outline.tscn").instantiate()
	
	add_child(outline)
	
	player_controls = Controls.new(team)

func _process(_delta):
	if Input.is_action_just_pressed(player_controls.SPAWN_SNOWBALL):
		spawn_snowball()
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("player_jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = player_controls.get_input_vector()
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		facing = direction
		velocity.x = input_dir.x * SPEED
		velocity.z = input_dir.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
	direction_ball.position = 1.5 * facing
	area.position = 1.5 * facing
	

func spawn_snowball():
	var snowball = Snowball.new_snowball(team)
	#var snowball = snowball_scene.instantiate()
	snowball.position = global_position + 1 * facing
	get_parent().add_child(snowball)
