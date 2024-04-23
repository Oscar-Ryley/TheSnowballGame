class_name SnowballGame
extends Node3D

const SCORE_SIZE_CONSTANT: float = 10

static var team_red_points: float = 0.0
static var team_blue_points: float = 0.0

func _process(_delta):
	team_red_points = 0.0
	team_blue_points = 0.0
	
	for child in self.get_children():
		if child is Snowball:
			var radius = (child.child_scale - Snowball.start_scale).length()
			var snowball_team = child.get_team()
			var score_gained = SCORE_SIZE_CONSTANT * radius
			
			if snowball_team == Globals.TEAM.RED:
				team_red_points += score_gained
			elif snowball_team == Globals.TEAM.BLUE:
				team_blue_points += score_gained
