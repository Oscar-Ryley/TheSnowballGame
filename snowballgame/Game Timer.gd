extends Node2D

@onready var label = $Label
@onready var timer = $Timer

func _ready():
	timer.start()

func time():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [second]

func _process(delta):
	label.text = "%02d" % time()
