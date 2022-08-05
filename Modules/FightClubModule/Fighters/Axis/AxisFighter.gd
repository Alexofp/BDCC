extends FightClubFighter

func _init():
	id = "axis"
	
func getVisibleName():
	return "Axis"

func getNameAndNickname():
	return "Axis, The Alpha"

func getAvyIntroduction():
	return "Your next opponent is Axis. Your average buff dude, this one was lucky enough to get to a high place on the leaderboard and keep it. Lone wolf but he is flirty as fuck, I won’t lie I almost spread my legs for him once, his scent is just too much."
	
func getAnnouncerIntroduction():
	return "And in the right corner we have Axis. One of our best warriors, a true white knight!"
	
func getRank():
	return FightClubRank.PlayToy

func getOrder():
	return 60

func getFightCharacter():
	return "axis"

func getWinScene():
	return "AxisWonScene"

func getLoseScene():
	return "AxisLostToScene"

func getWinExperience():
	return 150

func getWinCredits():
	return 10
