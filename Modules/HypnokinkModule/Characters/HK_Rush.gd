extends Character

func _init():
	id = "rush"
	
	npcLevel = 10
	npcBasePain = 150
	npcBaseLust = 75
	npcBaseStamina = 200
	npcCharacterType = CharacterType.Inmate
	
	
	pickedSkin="EmptySkin"
	pickedSkinRColor=Color("ff3c3c3c")
	pickedSkinGColor=Color("ff5356a0")
	pickedSkinBColor=Color("ff00377e")
	npcSkinData={
	"head": {"skin": "SoftSpikySkin",},
	"hair": {"r": Color("ff56c0c2"),"g": Color("ff202d96"),"b": Color("ffb75129"),},
	"ears": {"r": Color("ff3c3c3c"),"g": Color("ff936c86"),"b": Color("ff5356a0"),},
	"horns": {"r": Color("ff5a4444"),"g": Color("ffe4e4e4"),"b": Color("ffb75129"),},
	"body": {"skin": "SoftSpikySkin",},
	"arms": {"skin": "WoonaSkin","r": Color("ff5054ba"),"g": Color("ff3c3c3c"),"b": Color("ff3c3c3c"),},
	"penis": {"r": Color("ff4b4fbc"),"g": Color("ff9d1818"),"b": Color("ffdd3b61"),},
	"tail": {"skin": "SoftSpikySkin","r": Color("ff3c3c3c"),"g": Color("ff56c0c2"),"b": Color("ff5356a0"),},
	"legs": {"skin": "StripesSkin","g": Color("ff432d23"),"b": Color("ff5458c2"),},
	}
	npcPersonality = {
		PersonalityStat.Brat: 0.0,
		PersonalityStat.Mean: -0.3,
		PersonalityStat.Subby: -0.2,
		PersonalityStat.Impatient: -0.3,
		PersonalityStat.Naive: 0.6,
		PersonalityStat.Coward: -0.8,
	}
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.Hates,
		Fetish.AnalSexGiving : FetishInterest.Loves,
		Fetish.VaginalSexGiving : FetishInterest.Hates,
		Fetish.OralSexReceiving : FetishInterest.Likes,
		Fetish.OralSexGiving : FetishInterest.Dislikes,
		Fetish.Sadism : FetishInterest.Dislikes,
		Fetish.Masochism : FetishInterest.Likes,
		Fetish.UnconsciousSex : FetishInterest.Hates,
		Fetish.BeingBred : FetishInterest.SlightlyDislikes,
		Fetish.Bondage : FetishInterest.SlightlyLikes,
		Fetish.Condoms : FetishInterest.Neutral,
		Fetish.DrugUse : FetishInterest.SlightlyDislikes,
		Fetish.Exhibitionism : FetishInterest.Dislikes,
		Fetish.HypnosisHypnotist : FetishInterest.Dislikes,
		Fetish.HypnosisSubject : FetishInterest.Loves
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.SlightlyDislikes,
		InterestTopic.Bodywritings: Interest.Dislikes,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.KindaLikes,
		InterestTopic.ButtPlugs: Interest.Dislikes,
		InterestTopic.VaginalPlugs: Interest.Dislikes,
		InterestTopic.FeminineBody: Interest.KindaLikes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.KindaLikes,
		InterestTopic.ThickBody: Interest.KindaLikes,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.ReallyLikes,
		InterestTopic.ThickButt: Interest.ReallyLikes,
		InterestTopic.AverageButt: Interest.Likes,
		InterestTopic.SlimButt: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.Likes,
		InterestTopic.MediumBreasts: Interest.Dislikes,
		InterestTopic.BigBreasts: Interest.ReallyDislikes,
		InterestTopic.LactatingBreasts: Interest.ReallyDislikes,
		InterestTopic.StuffedPussy: Interest.Dislikes,
		InterestTopic.StuffedAss: Interest.Likes,
		InterestTopic.Pregnant: Interest.Dislikes,
		InterestTopic.StuffedThroat: Interest.KindaLikes,
		InterestTopic.CoveredInCum: Interest.KindaLikes,
		InterestTopic.CoveredInLotsOfCum: Interest.SlightlyDislikes,
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.Dislikes,
		InterestTopic.ExposedAnus: Interest.Loves,
		InterestTopic.ExposedCock: Interest.ReallyLikes,
		InterestTopic.ExposedPanties: Interest.KindaLikes,
		InterestTopic.ExposedBra: Interest.Dislikes,
		InterestTopic.LooseAnus: Interest.Loves,
		InterestTopic.LoosePussy: Interest.SlightlyDislikes,
		InterestTopic.TightAnus: Interest.KindaLikes,
		InterestTopic.TightPussy: Interest.SlightlyDislikes,
		InterestTopic.NoVagina: Interest.Loves,
		InterestTopic.HasVaginaOnly: Interest.Hates,
		InterestTopic.BigCock: Interest.SlightlyDislikes,
		InterestTopic.AverageCock: Interest.KindaLikes,
		InterestTopic.SmallCock: Interest.ReallyLikes,
		InterestTopic.NoCock: Interest.Hates,
		InterestTopic.HasCockOnly: Interest.Loves,
	}
	
func _getName():
	return "Rush"

func getGender():
	return Gender.Male

func getChatColor():
	return '#F46670'
	
func getSmallDescription() -> String:
	return "A towering stallion."
	
func getFightIntro(_battleName):
	return "Rush towers over you in a textbook boxing stance."

func getSpecies():
	return ["equine", "dragon"]
	
func _getAttacks():
	return ["biteattack", "simplekickattack", "AttackFury", "DestroyRestraintsAttack", "EvasiveManeuver", "FeralAssault", "trygetupattack"]
	
func getThickness() -> int:
	return 25

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("horseheadbig"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("mohawkhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("horseears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhorns2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("hoofs"))
	var penis = GlobalRegistry.createBodypart("equinepenis")
	penis.lengthCM = 30
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragontail"))
	
func getLootTable(_battleName):
	if(_battleName == "boxing_serious"):
		return InmateLoot.new()
	else:
		return null

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformHighsec"]
