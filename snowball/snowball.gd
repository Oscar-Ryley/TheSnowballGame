extends RigidBody3D

@export var growth_constant: float = 0.0005

@onready var model_pivot: Node3D = $"Model Pivot"
@onready var collision_shape: CollisionShape3D = $"CollisionShape3D"

func _ready():
	model_pivot.scale = 0.75 * Vector3.ONE
	collision_shape.scale = 0.75 * Vector3.ONE

func _physics_process(_delta):
	var speed: float = linear_velocity.length()
	if speed > 0:
		var change: float = growth_constant * speed
		increment_children_scale(change)

func increment_children_scale(change):
	if model_pivot.scale < Vector3(4, 4, 4) and collision_shape.scale < Vector3(4, 4, 4):
		var new_scale_vec: Vector3 = change * Vector3.ONE
		model_pivot.scale += new_scale_vec
		collision_shape.scale += new_scale_vec
