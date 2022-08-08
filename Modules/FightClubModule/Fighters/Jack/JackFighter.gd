extends FightClubFighter

func _init():
	id = "jack"
	
func getVisibleName():
	return "Jack"

func getNameAndNickname():
	return "Jack, The Stud"

func getAvyIntroduction():
	return "Your next opponent is Jack. He is strong, probably stronger than me. If we’re talking raw strength, of course. I will still beat his ass any day of the week, the gallons of cum in his balls fog up his mind too much."
	
func getAnnouncerIntroduction():
	return "And in the right corner we have Jack, the Stud! Ladies love him, some guys fear him. Unmatched strength and incredible virility, welcome the true stallion!"
	
func getRank():
	return FightClubRank.AttentionWhore

func getOrder():
	return 80

func getFightCharacter():
	return "jack"

func getWinScene():
	return "JackWonScene"

func getLoseScene():
	return "JackLostToScene"

func getWinExperience():
	return 250

func getWinCredits():
	return 20
