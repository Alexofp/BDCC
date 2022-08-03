extends FightClubFighter

func _init():
	id = "ferri"
	
func getVisibleName():
	return "Ferri"

func getNameAndNickname():
	return "Ferri, The Brat"

func getAvyIntroduction():
	return "Your next opponent is a feline-dragon hybrid named Ferri. She is a red, probably murdered someone for cash, they all get caught like that. I heard that she likes to use her fangs a lot. Dunno, to me she seems all bark and no bite."
	
func getAnnouncerIntroduction():
	return "And in the right corner we have Ferri, a mix between agile kitties and powerful dragons! She is a ferocious warrior that won quite a few fights! She would win more but the staff are constantly muzzling her."
	
func getRank():
	return FightClubRank.FailedHero

func getOrder():
	return 30

func getFightCharacter():
	return "ferri"

func getWinScene():
	return "FerriWonScene"

func getLoseScene():
	return "FerriLostToScene"

func getWinExperience():
	return 80

func getWinCredits():
	return 5
