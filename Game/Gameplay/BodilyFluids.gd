extends Object
class_name BodilyFluids

class FluidType:
	const Cum = "cum"
	const GirlCum = "girlcum"
	const Milk = "milk"
	const BlackGoo = "blackgoo"
	const CumLube = "cumlube"
	const WhiteGoo = "whitegoo"
	
	static func getName(fl):
		if(fl == Cum):
			return "cum"
		if(fl == GirlCum):
			return "girlcum"
		if(fl == Milk):
			return "milk"
		if(fl == BlackGoo):
			return "black goo"
		if(fl == CumLube):
			return "cub lube"
		if(fl == WhiteGoo):
			return "white goo"
		return "Error"
		
	static func canMakeYouPregnant(fl):
		if(fl == Cum):
			return true
		
		return false

enum FluidSource {
	Penis,
	Vagina,
	Strapon,
}

enum MessinessLevel {
	Clean = 0,
	SlightlyMessy = 1,
	Messy = 2,
	VeryMessy = 3,
	CumRag = 4,
	CumDump = 5,
}
const MaxMessinessLevel = 5

static func getOutsideMessinessMessage(messLevel, fluids: Array):
	var names = []
	for fluid in fluids:
		names.append(FluidType.getName(fluid))
	var humanReadableString = Util.humanReadableList(names)
	if(names.size() == 0):
		humanReadableString = "nothing"
		
	if(messLevel <= MessinessLevel.Clean):
		return "You're completely clean"
	if(messLevel == MessinessLevel.SlightlyMessy):
		return "You are covered with "+humanReadableString
	if(messLevel == MessinessLevel.Messy):
		return "Some parts of your body and face are covered with "+humanReadableString+", you're such a such a wet mess"
	if(messLevel == MessinessLevel.VeryMessy):
		return "Almost your whole body and face are covered with "+humanReadableString+". Hair, ears, arms, legs, everything, you're a complete mess"
	if(messLevel == MessinessLevel.CumRag):
		return "You're such a cum rag! There is no empty spot, you are coated with " + humanReadableString+" and it's dripping from you while you walk!"
	if(messLevel >= MessinessLevel.CumDump):
		return "You look like a complete cum dump and feel like one too, your body is covered with multiple levels of "+ humanReadableString+", little strings hang from your ears and chin, the hair is completely soaked. You can taste it all as the fluids drip down your face and lips and into your mouth"
