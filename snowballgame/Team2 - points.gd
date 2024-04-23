extends RichTextLabel

func _process(_delta):
	self.text = str(round(SnowballGame.team_blue_points))
