class_name Globals
extends Node3D

enum TEAM {RED, BLUE, UNASSIGNED}

@onready var r = 0
@onready var b = 0

#static var team_red_points = 0
#static var team_blue_points = 0

#@onready var team_red_points_hud: RichTextLabel = $"HUD/Scores/Team 1/Team1 - points"
#@onready var team_blue_points_hud: RichTextLabel = $"HUD/Scores/Team 2/Team2 - points"

#func _process(_delta):
	#print($Player1)
	#for child in $"Root".get_children():
		#if child is Snowball:
			#print("found snowball")
	#print("end of search")

#static func add_points(points: float, team: TEAM):
	#if team == TEAM.RED:
		#team_red_points += points
	#elif team == TEAM.BLUE:
		#team_blue_points += points
		#
#static func set_points(points: float, team: TEAM):
	#if team == TEAM.RED:
		#team_red_points = points
	#elif team == TEAM.BLUE:
		#team_blue_points = points
