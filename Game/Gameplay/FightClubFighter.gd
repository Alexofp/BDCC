extends Reference
class_name FightClubFighter

var id = "error"

func getVisibleName():
	return "Error"

func getNameAndNickname():
	return "Error, The Error"

func getAvyIntroduction():
	return "PLEASE CHANGE ME"
	
func getAnnouncerIntroduction():
	return "PLEASE CHANGE ME TOO"
	
func getRank():
	return FightClubRank.FuckMeat

func getOrder():
	return 0

func getFightCharacter():
	return null

func getWinScene():
	return null

func getLoseScene():
	return null

func getWinExperience():
	return 30

func getWinCredits():
	return 5

func getRepeatWinExperience():
	return round(getWinExperience() / 2.0)
	
func getRepeatWinCredits():
	return floor(getWinCredits() / 4.0)

func canFight():
	return true
