extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const snowball_scene: Resource = preload("res://snowball/snowball.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var facing := Vector3.FORWARD

func _process(delta):
	if Input.is_action_just_pressed("player_spawn_snowball"):
		spawn_snowball()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("player_left", "player_right", "player_up", "player_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		facing = direction
		velocity.x = -input_dir.x * SPEED
		velocity.z = -input_dir.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
	look_at(global_transform.origin + facing, Vector3.UP)

func spawn_snowball():
	var snowball = snowball_scene.instantiate()
	snowball.position = position + 1.3 * facing
	get_parent().add_child(snowball)
