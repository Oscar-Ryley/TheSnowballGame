extends Node2D

@onready var tie = get_node("Tie Screen")
@onready var red = get_node("Red Win Screen")
@onready var blue = get_node("Blue Win Screen")

func ready(_delta):
	tie.visible = false
	red.visible = false
	blue.visible = false

func _on_timer_timeout():
	if SnowballGame.team_red_points > SnowballGame.team_blue_points:
		red.visible = true
	elif SnowballGame.team_blue_points > SnowballGame.team_red_points:
		blue.visible = true
	elif SnowballGame.team_red_points == SnowballGame.team_blue_points:
		tie.visible = true
