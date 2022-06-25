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
		InterestTopic.TallyMarks: Interest.Hates,
		InterestTopic.Bodywritings: Interest.Hates,
		InterestTopic.Gags: Interest.Loves,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.Loves,
		InterestTopic.ButtPlugs: Interest.Hates,
		InterestTopic.VaginalPlugs: Interest.Hates,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.ReallyLikes,
		InterestTopic.MasculineBody: Interest.Loves,
		InterestTopic.ThickBody: Interest.Dislikes,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.Dislikes,
		InterestTopic.ThickButt: Interest.SlightlyDislikes,
		InterestTopic.AverageButt: Interest.KindaLikes,
		InterestTopic.SlimButt: Interest.SlightlyDislikes,
		InterestTopic.NoBreasts: Interest.ReallyLikes,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.MediumBreasts: Interest.ReallyDislikes,
		InterestTopic.BigBreasts: Interest.Hates,
		InterestTopic.LactatingBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.Hates,
		InterestTopic.StuffedAss: Interest.ReallyLikes,
		InterestTopic.StuffedPussyOrAss: Interest.KindaLikes,
		InterestTopic.StuffedThroat: Interest.Hates,
		InterestTopic.CoveredInCum: Interest.Hates,
		InterestTopic.CoveredInLotsOfCum: Interest.Hates,
		InterestTopic.FullyNaked: Interest.Dislikes,
		InterestTopic.ExposedPussy: Interest.KindaLikes,
		InterestTopic.ExposedAnus: Interest.Dislikes,
		InterestTopic.ExposedBreasts: Interest.KindaLikes,
		InterestTopic.ExposedCock: Interest.ReallyLikes,
		InterestTopic.ExposedPanties: Interest.Loves,
		InterestTopic.ExposedBra: Interest.Likes,
		InterestTopic.LooseAnus: Interest.ReallyDislikes,
		InterestTopic.LoosePussy: Interest.ReallyDislikes,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.NoVagina: Interest.Likes,
		InterestTopic.HasVaginaOnly: Interest.SlightlyDislikes,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.BigCock: Interest.Loves,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.HasCockOnly: Interest.Loves,
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

