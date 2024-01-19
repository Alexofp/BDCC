extends Character

func _init():
	id = "skar"
	npcLevel = 10
	npcBasePain = 200
	npcBaseLust = 200
	npcCharacterType = CharacterType.Guard
	
	pickedSkin="WoonaSkin"
	pickedSkinRColor=Color("fffaf2ec")
	pickedSkinGColor=Color("fff3b487")
	pickedSkinBColor=Color("ffa37156")
	npcSkinData={
	"head": {"b": Color("ff222222"),},
	"hair": {"r": Color("ff232323"),"g": Color("ff141414"),"b": Color("ff505050"),},
	"ears": {"r": Color("ff5b5b5b"),"g": Color("ff3c3c3c"),"b": Color("ff020202"),},
	"arms": {"skin": "HumanSkin","r": Color("ff4a4a56"),"g": Color("ffafafaf"),"b": Color("ff506261"),},
	"breasts": {"r": Color("ff6b6b6b"),},
	"penis": {"g": Color("ff971616"),"b": Color("ffda0707"),},
	}
	
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
		InterestTopic.Pregnant: Interest.Dislikes,
	}
	
func _getName():
	return "Skar"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A male guard with wolf features and a scarred face. His arms, eyes and lower jaw are replaced with prosthetics."

func getSpecies():
	return [Species.Canine]

func _getAttacks():
	return ["HeatGrenade", "ForceMuzzlePC", "stunbatonAttack", "stunbatonStrongAttack", "stunbatonOverchargeAttack", "simplekickattack", "trygetupattack"]

func getFightIntro(_battleName):
	return "The guard holds his weapon tightly and waits for you to do the first move.\n\n"+formatSay("You know it’s only gonna end one way for you.")

func getThickness() -> int:
	return 90

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))

func reactRestraint(_restraintType, restraintAmount, isGettingForced):
	if(!isGettingForced):
		if(restraintAmount == 0):
			return RNG.pick([
				"To hell with these",
				"Easy",
				"That was too easy",
			])
		
		return RNG.pick([
			"Grr-r",
			"Grr",
			"Not funny",
			"So fucking humiliating",
		])
	
	if(isGettingForced):
		if(restraintAmount > 2 && RNG.chance(30)):
			return RNG.pick([
				"Fucking hell",
				"I have enough metal in me already",
				"Quit it already",
				"Fuck you",
			])
		
		return RNG.pick([
			"Is that how you gonna play?",
			"You think it's funny?",
			"Where did you stole these",
			"Oh c'mon, I don't need this",
			"Fuck off",
		])
	return null

func getDefaultEquipment():
	return ["GuardArmor"]
