extends Character

func _init():
	id = "skar"
	npcLevel = 10
	npcBasePain = 200
	npcBaseLust = 200
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Dislikes,
		InterestTopic.Bodywritings: Interest.Dislikes,
		InterestTopic.Gags: Interest.Dislikes,
		InterestTopic.Blindfolds: Interest.Dislikes,
		InterestTopic.BDSMRestraints: Interest.Dislikes,
		InterestTopic.ButtPlugs: Interest.Dislikes,
		InterestTopic.VaginalPlugs: Interest.Dislikes,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.SlightlyDislikes,
		InterestTopic.MasculineBody: Interest.Dislikes,
		InterestTopic.AverageMassBody: Interest.KindaLikes,
		InterestTopic.SlimBody: Interest.ReallyLikes,
		InterestTopic.ThickButt: Interest.Likes,
		InterestTopic.SlimButt: Interest.ReallyLikes,
		InterestTopic.NoBreasts: Interest.KindaLikes,
		InterestTopic.SmallBreasts: Interest.Likes,
		InterestTopic.MediumBreasts: Interest.ReallyLikes,
		InterestTopic.BigBreasts: Interest.KindaLikes,
		InterestTopic.LactatingBreasts: Interest.KindaLikes,
		InterestTopic.StuffedPussy: Interest.Dislikes,
		InterestTopic.StuffedAss: Interest.Dislikes,
		InterestTopic.StuffedPussyOrAss: Interest.Dislikes,
		InterestTopic.StuffedThroat: Interest.Dislikes,
		InterestTopic.CoveredInCum: Interest.Dislikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Dislikes,
		InterestTopic.FullyNaked: Interest.SlightlyDislikes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.SlightlyDislikes,
		InterestTopic.ExposedBreasts: Interest.ReallyLikes,
		InterestTopic.ExposedCock: Interest.KindaLikes,
		InterestTopic.ExposedPanties: Interest.Loves,
		InterestTopic.ExposedBra: Interest.Loves,
		InterestTopic.LooseAnus: Interest.SlightlyDislikes,
		InterestTopic.LoosePussy: Interest.SlightlyDislikes,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.NoVagina: Interest.SlightlyDislikes,
		InterestTopic.HasVaginaOnly: Interest.ReallyLikes,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.BigCock: Interest.Dislikes,
		InterestTopic.AverageCock: Interest.Dislikes,
		InterestTopic.SmallCock: Interest.SlightlyDislikes,
		InterestTopic.NoCock: Interest.Likes,
		InterestTopic.HasCockOnly: Interest.SlightlyDislikes,
	}
	
func _getName():
	return "Skar"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A male guard with wolf features and a scarred face. His arms, eyes and lower jaw are replaced with prosthetics."

func getSpecies():
	return ["wolf"]

func _getAttacks():
	return ["HeatGrenade", "ForceMuzzlePC", "stunbatonAttack", "stunbatonStrongAttack", "stunbatonOverchargeAttack", "simplekickattack", "trygetupattack"]

func getFightIntro(_battleName):
	return "The guard holds his weapon tightly and waits for you to do the first move.\n\n"+formatSay("You know it’s only gonna end one way for you.")

func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
