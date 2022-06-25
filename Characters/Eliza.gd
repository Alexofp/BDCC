extends Character

func _init():
	id = "eliza"
	npcLevel = 5
	npcBaseLust = 150
	npcBasePain = 120
	
	npcLustInterests = {
		InterestTopic.Bodywritings: Interest.Loves,
		InterestTopic.Gags: Interest.ReallyLikes,
		InterestTopic.Blindfolds: Interest.ReallyLikes,
		InterestTopic.BDSMRestraints: Interest.ReallyLikes,
		InterestTopic.ButtPlugs: Interest.Likes,
		InterestTopic.VaginalPlugs: Interest.Likes,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.SlightlyDislikes,
		InterestTopic.MasculineBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.Dislikes,
		InterestTopic.ThickButt: Interest.ReallyDislikes,
		InterestTopic.AverageButt: Interest.ReallyLikes,
		InterestTopic.SlimButt: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.Dislikes,
		InterestTopic.SmallBreasts: Interest.SlightlyDislikes,
		InterestTopic.MediumBreasts: Interest.Likes,
		InterestTopic.BigBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.Likes,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.Dislikes,
		InterestTopic.FullyNaked: Interest.KindaLikes,
		InterestTopic.ExposedPussy: Interest.Likes,
		InterestTopic.ExposedAnus: Interest.Likes,
		InterestTopic.ExposedBreasts: Interest.Likes,
		InterestTopic.ExposedCock: Interest.ReallyLikes,
		InterestTopic.ExposedPanties: Interest.KindaLikes,
		InterestTopic.ExposedBra: Interest.KindaLikes,
		InterestTopic.LooseAnus: Interest.Likes,
		InterestTopic.LoosePussy: Interest.Dislikes,
		InterestTopic.TightAnus: Interest.Dislikes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.HasVaginaOnly: Interest.SlightlyDislikes,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.BigCock: Interest.Loves,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.HasCockOnly: Interest.Loves,
	}
	
func _getName():
	return "Eliza Quinn"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "An elegant feline with pastel yellow fur. Wears a lab coat and carries quite a few medical tools on her belt"

func getSpecies():
	return ["feline"]

func getFightIntro(_battleName):
	var text = "Eliza makes her hair into a careful ponytail and opens her lab coat, displaying a rich set of syringes, injectors, pill bottles and drug vials on her belt."
	text += "\n\n"
	text += "[say=eliza]"+RNG.pick([
		"I’m doctor Quinn. But you can call me Queen.",
		"I can show you everything. Just ask me nicely.",
		"We have so many drugs to test, don’t be silly.",
		"Did I ever tell you I blew up a whole lab once?",
	])+"[/say]"	
	
	return text
	
func _getAttacks():
	return ["biteattack", "stretchingAttack", "lickWounds", "trygetupattack", "ElizaHornyCloud", "ElizaHornyDrug", "ElizaTaunt", "ElizaWeaknessDrug", "NpcScratch", "ForceMuzzlePC"]

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
