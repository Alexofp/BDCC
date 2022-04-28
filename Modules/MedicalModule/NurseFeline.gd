extends Character

func _init():
	id = "nurse"
	
	npcArmor = {
	}
	npcLevel = 3
	npcBasePain = 70
	npcBaseLust = 130
	npcBaseStamina = 120
	npcLustInterests = {
		InterestTopic.FeminineBody: Interest.KindaLikes,
		InterestTopic.AndroBody: Interest.KindaLikes,
		InterestTopic.MasculineBody: Interest.Loves,
		InterestTopic.SlimBody: Interest.Dislikes,
		InterestTopic.BigBreasts: Interest.Hates,
		InterestTopic.MediumBreasts: Interest.ReallyDislikes,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.KindaLikes,
		InterestTopic.HasCockOnly: Interest.Loves,
		InterestTopic.HasVaginaOnly: Interest.SlightlyDislikes,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.BigCock: Interest.Loves,
		InterestTopic.StuffedPussyOrAss: Interest.Dislikes,
		InterestTopic.StuffedPussy: Interest.Hates,
		InterestTopic.CoveredInCum: Interest.Hates,
		InterestTopic.CoveredInLotsOfCum: Interest.Hates,
		InterestTopic.StuffedThroat: Interest.Hates,
		InterestTopic.ThickButt: Interest.KindaLikes,
		InterestTopic.AverageButt: Interest.ReallyLikes,
		InterestTopic.SlimButt: Interest.KindaLikes,
	}
	
func _getName():
	return "Nurse"

func getGender():
	return Character.Gender.Female
	
func getSmallDescription() -> String:
	return "A tall feline wearing a nurse uniform."

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["HeatGrenade", "DoubleCuffPC", "CuffPCHands", "ForceGagPC", "ForceMuzzlePC", "stunbatonAttack", "stunbatonOverchargeAttack", "biteattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return "The nurse prepares to fight"
	
func getLootTable(_battleName):
	return GuardLoot.new()

