extends InmateGenerator
class_name DrugDenJunkieGenerator

func getCurrentDrugDenLevel() -> int:
	if(GM.main == null || GM.main.DrugDenRun == null):
		return -1
	
	return GM.main.DrugDenRun.getLevel()

func getCurrentDrugDenDifficulty() -> float:
	if(GM.main == null || GM.main.DrugDenRun == null):
		return 1.0
	
	return GM.main.DrugDenRun.getDifficultyFloat()

func pickName(character:DynamicCharacter, _args = {}):
	character.npcName = "Junkie"
	if(_args.has(NpcGen.IsBoss) && _args[NpcGen.IsBoss]):
		character.npcName = "Junkie Boss"

func pickSmallDescription(_character:DynamicCharacter, _args = {}):
#	var thedesc = ""
#	thedesc += Util.getSpeciesName(character.npcSpecies)
#	thedesc += ". "
#	thedesc += NpcGender.getVisibleName(character.npcGeneratedGender)+"."
#
	return "One of the junkies"

func pickCharacterType(character:DynamicCharacter, _args = {}):
	character.npcCharacterType = CharacterType.Generic

func getAttacks():
	return ["simplepunchattack", "trygetupattack"]

func getPossibleAttacks():
	return ["simplekickattack", "shoveattack", "stretchingAttack", "lickWounds", "ShivAttack", "biteattack", "NpcScratch"]

func pickEquipment(character:DynamicCharacter, _args = {}):
	var inmateType = character.getFlag(CharacterFlag.InmateType)
	if(inmateType == null):
		inmateType = RNG.pick([InmateType.General, InmateType.HighSec, InmateType.SexDeviant])
		character.setFlag(CharacterFlag.InmateType, inmateType)
	
	var theEquipment = ["inmatecollar"]
	
	var ehibit = character.getFetishHolder().getFetishValue(Fetish.Exhibitionism)
	
	# Sometimes they're naked
	if(!RNG.chance(ehibit * 5.0)):
		if(inmateType == InmateType.General):
			var randomUniform = getRandomItemIDByTag(ItemTag.GeneralInmateUniform)
			if(randomUniform != null):
				theEquipment.append(randomUniform)
		if(inmateType == InmateType.HighSec):
			var randomUniform = getRandomItemIDByTag(ItemTag.HighSecurityInmateUniform)
			if(randomUniform != null):
				theEquipment.append(randomUniform)
		if(inmateType == InmateType.SexDeviant):
			var randomUniform = getRandomItemIDByTag(ItemTag.SexualDeviantInmateUniform)
			if(randomUniform != null):
				theEquipment.append(randomUniform)
#
#	# Sometimes they have a forced chastity cage on
#	if(!_args.has(NpcGen.NoChastity) || !_args[NpcGen.NoChastity]):
#		if(RNG.chance(2.0) && character.hasPenis()):
#			theEquipment.append(RNG.pick(["ChastityCagePermanentNormal", "ChastityCagePermanent"]))
#
	if(!RNG.chance(ehibit * 100.0 + 50.0)):
		if(character.getFemininity() < 50):
			if(RNG.chance(50)):
				theEquipment.append("plainBriefs")
				theEquipment.append("plainUndershirt")
			else:
				theEquipment.append("sportyBriefs")
				theEquipment.append("sportyTankTop")
		else:
			if(RNG.chance(33)):
				theEquipment.append("plainPanties")
				theEquipment.append("plainBra")
			elif(RNG.chance(33)):
				theEquipment.append("LaceBra")
				theEquipment.append("LacePanties")
			else:
				theEquipment.append("sportyBriefs")
				theEquipment.append("sportyTop")
	
	character.npcDefaultEquipment = theEquipment

	character.npcLootOverride = {
		baseTableID = "junkie",
		creditsDropChance = 69,
		creditsMin = 2,
		creditsMax = 5,
	}
	if(RNG.chance(10)):
		character.npcLootOverride["creditsMax"] += 5
	if(RNG.chance(5)):
		character.npcLootOverride["creditsMax"] += 10

func pickNonStaticEquipment(_character:DynamicCharacter, _args = {}):
	for _i in range(0, RNG.randi_range(1, 5)):
		_character.damageClothes()

func pickLevel(character:DynamicCharacter, _args = {}):
	if(_args.has(NpcGen.Level)):
		character.npcLevel = _args[NpcGen.Level]
	else:
		var isBoss:bool = (_args.has(NpcGen.IsBoss) && _args[NpcGen.IsBoss])
		
		var theDiff:float = getCurrentDrugDenDifficulty()
		if(isBoss):
			theDiff *= 3.0
		
		var pcLevel:int = 5
		if(GM.pc != null && is_instance_valid(GM.pc)):
			pcLevel = GM.pc.getLevel()
			
		var minLevel:int = Util.maxi(pcLevel - 5 + int(theDiff * 1.0), 1)
		if(theDiff < 15.0):
			minLevel = Util.maxi(int(float(minLevel) * theDiff/15.0), 1)
		var maxLevel:int = Util.maxi(pcLevel + int(theDiff * 2.0), minLevel + 2)
		if(theDiff < 5.0):
			maxLevel = Util.maxi(int(float(maxLevel) * theDiff/5.0), minLevel + 2)
		
		character.npcLevel = RNG.randi_range(minLevel, maxLevel)
	character.getSkillsHolder().setLevel(character.npcLevel)
	character.autoSpendFreeStatPoints()

func pickStats(character:DynamicCharacter, _args = {}):
	var statDistributionTypes = [
		["tank", 10.0],
		["luster", 10.0],
		["balanced", 5.0],
		["weak", 5.0],
	]
	
	var pickedType = RNG.pickWeightedPairs(statDistributionTypes)
	var level = Util.maxi(0, character.npcLevel)
	
	var runDifficulty:float = getCurrentDrugDenDifficulty()
	
	var isBoss:bool = (_args.has(NpcGen.IsBoss) && _args[NpcGen.IsBoss])
	if(isBoss):
		if(runDifficulty < 0.5):
			runDifficulty = 0.5
		else:
			runDifficulty *= 1.5
		character.addEffect(RNG.pick([
			"DrugDenBoss1",
			"DrugDenBoss2",
			"DrugDenBoss3",
			"DrugDenBoss4",
			"DrugDenBoss5",
		]))
	
	character.npcBaseLust = 100
	character.npcBasePain = 100
	character.npcBaseStamina = 100
	
	if(pickedType == "tank"):
		character.npcBasePain = 40 + pow(level, 0.6) * 10 + RNG.randi_range(0, level*2)
		character.npcBaseLust = 20 + pow(level, 0.5) * 3
		character.npcBaseStamina = RNG.randi_range(7, 12)*10 + pow(level, 0.3) * 3
	if(pickedType == "luster"):
		character.npcBaseLust = 40 + pow(level, 0.6) * 10 + RNG.randi_range(0, level*2)
		character.npcBasePain = 20 + pow(level, 0.5) * 3 + RNG.randi_range(0, level)
		character.npcBaseStamina = RNG.randi_range(7, 12)*10 + pow(level, 0.25) * 5
	if(pickedType == "balanced"):
		character.npcBaseLust = 30 + pow(level, 0.5) * 10 + RNG.randi_range(0, level*2)
		character.npcBasePain = 30 + pow(level, 0.5) * 10 + RNG.randi_range(0, level*2)
		character.npcBaseStamina = RNG.randi_range(5, 12)*10 + pow(level, 0.5) * 10
	if(pickedType == "weak"):
		character.npcBaseLust = 20 + pow(level, 0.3) * 10 + RNG.randi_range(0, level*2)
		character.npcBasePain = 20 + pow(level, 0.3) * 10 + RNG.randi_range(0, level*2)
		character.npcBaseStamina = RNG.randi_range(5, 7)*10 + pow(level, 0.5) * 10

	character.npcBasePain = int(round(character.npcBasePain*runDifficulty/5)*5)
	character.npcBaseLust = int(round(character.npcBaseLust*runDifficulty/5)*5)
	character.npcBaseStamina = int(round(character.npcBaseStamina*runDifficulty/5)*5)

func pickFetishes(character:DynamicCharacter, _args = {}):
	.pickFetishes(character, _args)
	var fetishHolder:FetishHolder = character.getFetishHolder()
	
	fetishHolder.addFetish(Fetish.DrugUse, FetishInterest.numberToInterest(RNG.randi_range(3, 6)))
	
