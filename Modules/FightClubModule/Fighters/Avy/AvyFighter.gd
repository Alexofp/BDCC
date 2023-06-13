extends FightClubFighter

func _init():
	id = "avy"
	
func getVisibleName():
	return "Avy"

func getNameAndNickname():
	return "Avy, The Unbeatable"

func getAvyIntroduction():
	return "You shouldn't see this"
	
func getAnnouncerIntroduction():
	return "You shouldn't see this"
	
func getRank():
	#if(GM.main.getFlag("FightClubModule.AvyGotRekt")):
	#	return FightClubRank.FuckMeat
	return FightClubRank.GrandChampion

func getOrder():
	return 10000

func getFightCharacter():
	return "avy"

func getWinScene():
	return "AvyWonScene"

func getLoseScene():
	return "AvyLostToScene"

func getWinExperience():
	return 550

func getWinCredits():
	return 30

func canFight():
	return false
