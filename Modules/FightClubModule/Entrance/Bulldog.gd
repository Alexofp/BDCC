extends Character

func _init():
	id = "bulldog"
	
	npcLevel = 5
	npcBasePain = 150
	npcBaseLust = 150
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.KindaLikes,
		InterestTopic.Bodywritings: Interest.KindaLikes,
		InterestTopic.Gags: Interest.Hates,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.Likes,
		InterestTopic.ButtPlugs: Interest.Hates,
		InterestTopic.VaginalPlugs: Interest.Hates,
		InterestTopic.FeminineBody: Interest.Loves,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Hates,
		InterestTopic.ThickBody: Interest.KindaLikes,
		InterestTopic.AverageMassBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.Likes,
		InterestTopic.ThickButt: Interest.Likes,
		InterestTopic.AverageButt: Interest.SlightlyDislikes,
		InterestTopic.SlimButt: Interest.Dislikes,
		InterestTopic.NoBreasts: Interest.Dislikes,
		InterestTopic.SmallBreasts: Interest.SlightlyDislikes,
		InterestTopic.MediumBreasts: Interest.Loves,
		InterestTopic.BigBreasts: Interest.Likes,
		InterestTopic.LactatingBreasts: Interest.Dislikes,
		InterestTopic.StuffedPussy: Interest.ReallyLikes,
		InterestTopic.StuffedAss: Interest.KindaLikes,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.Likes,
		InterestTopic.FullyNaked: Interest.ReallyLikes,
		InterestTopic.ExposedPussy: Interest.Likes,
		InterestTopic.ExposedAnus: Interest.KindaLikes,
		InterestTopic.ExposedBreasts: Interest.KindaLikes,
		InterestTopic.ExposedCock: Interest.Hates,
		InterestTopic.ExposedPanties: Interest.KindaLikes,
		InterestTopic.ExposedBra: Interest.SlightlyDislikes,
		InterestTopic.LooseAnus: Interest.Hates,
		InterestTopic.LoosePussy: Interest.Hates,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.NoVagina: Interest.Hates,
		InterestTopic.HasVaginaOnly: Interest.KindaLikes,
		InterestTopic.HasVaginaAndCock: Interest.Dislikes,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.AverageCock: Interest.Hates,
		InterestTopic.SmallCock: Interest.Hates,
		InterestTopic.NoCock: Interest.Likes,
		InterestTopic.HasCockOnly: Interest.Hates,
	}
	
func _getName():
	return "Bulldog"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Red block inmate. Angry-looking bulldog"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return getName() + " gets into the combat stance and prepares for a fight."

func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("bulldoghead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("mohawkhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("bulldogears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorttail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getLootTable(_battleName):
	return InmateLoot.new()
