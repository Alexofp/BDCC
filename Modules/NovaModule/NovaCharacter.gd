extends Character

func _init():
	id = "nova"
	
	npcArmor = {
		DamageType.Physical: 10,
	}
	npcStats = {
		Stat.Sexiness: 1,
	}
	npcLevel = 2
	npcLustInterests = {
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.Hates,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.BigBreasts: Interest.ReallyLikes,
		InterestTopic.MediumBreasts: Interest.Loves,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.SlightlyDislikes,
		InterestTopic.HasCockOnly: Interest.ReallyDislikes,
		InterestTopic.HasVaginaOnly: Interest.ReallyLikes,
		InterestTopic.HasVaginaAndCock: Interest.Loves,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.BigCock: Interest.Likes,
		InterestTopic.StuffedPussyOrAss: Interest.Loves,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.Loves,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.ThickButt: Interest.Loves,
		InterestTopic.AverageButt: Interest.KindaLikes,
		InterestTopic.SlimButt: Interest.SlightlyDislikes,
	}
	
func _getName():
	return "Nova"

func getGender():
	return Character.Gender.Androgynous
	
func getPronounGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "Gray husky that wears hi-tech guard armor. Medium height, fit body"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["stunbatonAttack", "stunbatonOverchargeAttack", "AIHumiliateMommy", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	var mes = "Nova’s power armor lights up as she grabs her trusty stun baton and directs her attention to you."
	mes += "\n\n"
	return mes+formatSay("You have no right to remain silent, anything I say will be used against you. Come here, sweetie~")

func getLoot(_battleName):
	return {"credits": 1}

func getPenisSize():
	return 18.0
