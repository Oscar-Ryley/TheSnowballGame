extends Node3D

@onready var direction_ball = %DirectionBall

func _physics_process(delta):
	var desired_rotation_y = atan2(direction_ball.position.x, direction_ball.position.z)
	rotation.y = lerp_angle(rotation.y, desired_rotation_y, 10 * delta)
	#look_at(direction_ball.position)
