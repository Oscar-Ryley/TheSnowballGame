extends RigidBody3D

func _ready():
	pass 


func physics_process(_delta):
	scale.x += linear_velocity.length()
	print(linear_velocity.length())
