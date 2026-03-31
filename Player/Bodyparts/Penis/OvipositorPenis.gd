extends BodypartPenis

func _init():
	visibleName = "ovipositor"
	id = "ovipositorpenis"
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func initFluidProduction():
	fluidProduction = preload("res://Player/FluidProduction/CumAndEggsProduction.gd").new()
	fluidProduction.bodypart = weakref(self)
	
	fluidProduction.maxEggs = 10
	fluidProduction.eggsPerHour = 1.0
	fluidProduction.eggsSlowStart = 3
	fluidProduction.eggsPerHourSlow = 0.1

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["ovipositor"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/OvipositorPenis/OvipositorPenis.tscn"

func getPenisScale():
	return max(0.1 + (lengthCM - 5.0) / 21.0, 0.3)

func getTraits():
	return {
		PartTrait.Ovipositor: true,
	}

func getVulgarName() -> String:
	return "ovipositor cock"

func shouldUseBigPump():
	return true

func canStuffEggInto(_targetChar, _bodypart:String) -> bool:
	if(fluidProduction.getEggsAmount() <= 0):
		return false
	return true

func doStuffEggInto(_targetChar, _bodypart:String) -> Dictionary:
	if(!fluidProduction.useEgg()):
		return {success = false}
	var targetMenstrualCycle:MenstrualCycle = _targetChar.getMenstrualCycle()
	if(!targetMenstrualCycle):
		return {success = false}
	
	var unfertilizedEggCell := EggCell.new()
	unfertilizedEggCell.bigEgg = true
	unfertilizedEggCell.bigEggType = BigEggType.Unfertilized
	unfertilizedEggCell.laidType = BigEggType.Unfertilized
	unfertilizedEggCell.laidColor = Color.whitesmoke
	unfertilizedEggCell.isimpregnated = false
	unfertilizedEggCell.lifeSpan = 12*60*60 # 12 hours
	
	targetMenstrualCycle.injectEggCell(unfertilizedEggCell, OrificeType.fromBodypart(_bodypart))
	
	var theHole:String = "down {<TARGET>.your} hole"
	if(_bodypart == BodypartSlot.Vagina):
		theHole = "into {<TARGET>.your} pussy"
	if(_bodypart == BodypartSlot.Anus):
		theHole = "into {<TARGET>.your} anus"
	if(_bodypart == BodypartSlot.Head):
		theHole = "down {<TARGET>.your} throat"
	
	return {
		success = true,
		text = "An unfertilized egg gets [b]stuffed "+theHole+"[/b] by {<USER>.your} ovipositor.",
	}
