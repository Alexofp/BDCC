extends BodypartPenis

func _init():
	visibleName = "ovipositor"
	id = "ovipositorpenis"
	pickedGColor = Color.red
	pickedBColor = Color.darkred

func initFluidProduction():
	fluidProduction = preload("res://Player/FluidProduction/CumAndEggsProduction.gd").new()
	fluidProduction.bodypart = weakref(self)
	
	fluidProduction.maxEggs = 5
	fluidProduction.eggsPerHour = 1.0

func getCompatibleSpecies():
	return [Species.Any]

func getLewdAdjective():
	return RNG.pick(["ovipositor"])

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Penis/CaninePenis/CaninePenis.tscn"

func getTraits():
	return {
		PartTrait.Ovipositor: true,
	}

func getVulgarName() -> String:
	return "ovipositor cock"

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
	
	return {
		success = true,
		text = "!MEOW MEOW!"#"{<USER>.You} An egg got stuffed into {<TARGET>.your} hole.",
	}
