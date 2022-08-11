extends FightClubFighter

func _init():
	id = "kait"
	
func getVisibleName():
	return "Kait"

func getNameAndNickname():
	return "Kait, The Breeding Bitch"

func getAvyIntroduction():
	return "Your next opponent is Kait. She is a slut that acts like she is smarter than everyone else. As a fucking lilac. I say that she is a breeding stock and nothing more. Her pussy felt nice and tight though, you should try it after you win."
	
func getAnnouncerIntroduction():
	return "And in the right corner we have Kait. Some say her kick is the strongest in the prison! Combine that with the feline agility and you got yourself a truly furious warrior!"
	
func getRank():
	return FightClubRank.AttentionWhore

func getOrder():
	return 70

func getFightCharacter():
	return "kait"

func getWinScene():
	return "KaitWonScene"

func getLoseScene():
	return "KaitLostToScene"

func getWinExperience():
	return 200

func getWinCredits():
	return 15
