extends Object
class_name BodilyFluids

static func getFluidName(fluidID):
	var fluid = GlobalRegistry.getFluid(fluidID)
	if(fluid == null):
		return "ERROR:BADFLUID"
	return fluid.getVisibleName()

static func getFluidLewdName(fluidID):
	var fluid = GlobalRegistry.getFluid(fluidID)
	if(fluid == null):
		return "ERROR:BADFLUID"
	return fluid.getLewdName()

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
		names.append(getFluidName(fluid))
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
		return "There is no empty spot, you are coated with " + humanReadableString+". It's all dripping from you while you walk!"
	if(messLevel >= MessinessLevel.CumDump):
		return "Your body is covered with multiple levels of "+ humanReadableString+", little strings hang from your ears and chin, the hair is completely soaked. You can taste it all as the fluids drip down your face and lips and into your mouth"
