extends Node2D

@onready var tie = get_node("Tie Screen")
@onready var red = get_node("Red Win Screen")
@onready var blue = get_node("Blue Win Screen")

func ready(_delta):
	tie.visible = false
	red.visible = false
	blue.visible = false

func _on_timer_timeout():
	if Global.team1points > Global.team2points:
		red.visible = true
	elif Global.team2points > Global.team1points:
		blue.visible = true
	elif Global.team1points == Global.team2points:
		tie.visible = true
