extends Character

func _init():
	id = "femaleguard_feline"
	
	npcArmor = {
		DamageType.Physical: 5,
	}
	npcLevel = 1
	npcBasePain = 50
	npcBaseLust = 70
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
	return "Female guard"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A tall feline wearing a guard uniform."

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["HeatGrenade", "DoubleCuffPC", "CuffPCHands", "ForceGagPC", "ForceMuzzlePC", "stunbatonAttack", "stunbatonOverchargeAttack", "biteattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return "The guard prepares to fight"
	
func getLootTable(_battleName):
	return GuardLoot.new()

