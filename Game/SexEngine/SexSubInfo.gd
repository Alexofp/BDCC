extends SexInfoBase
class_name SexSubInfo

#var stance = SexStance.Standing

var resistance: float = 0.0
var fear: float = 0.0
var resistanceFull:float = 0.0
var fearFull:float = 0.0

func getInfoString():
	var character = getChar()
	
	if(getConsciousness() <= 0.0):
		return character.getName()+" is unconscious."
	
	var text = ""
	if(character != null):
		text += character.getName()+". "
	text += "Resistance: "+str(Util.roundF(resistance*100))+"% "
	text += "Fear: "+str(Util.roundF(fear*100))+"% "
	text += "Arousal: "+str(Util.roundF(getArousal()*100))+"% "
	text += "Consciousness: "+str(Util.roundF(getConsciousness()*100))+"% "
	
	return text

func initFromPersonality():
	var character = getChar()
	var personality:Personality = character.getPersonality()

	var bratiness = personality.getStat(PersonalityStat.Brat)
	
	if(bratiness > 0.0):
		resistance = RNG.randf_range(0.0, bratiness)
	if(getChar().getBuffsHolder().hasBuff(Buff.ActiveResistanceInSexBuff)):
		resistance = 1.0
	if(getChar().isSlaveToPlayer()):
		var npcSlave = getChar().getNpcSlavery()
		fear = npcSlave.getFear()

func canDoActions():
	if(getChar().getBuffsHolder().hasBuff(Buff.SpacedOutInSexBuff)):
		return false
	if(getConsciousness() <= 0.0):
		return false
	return true

func isUnconscious():
	if(getConsciousness() <= 0.0):
		return true
	return false

func isResistingSlightly():
	return resistance >= (0.1 + personalityScore({PersonalityStat.Naive: 0.05}))

func isResisting():
	return resistance >= (0.3 + personalityScore({PersonalityStat.Naive: 0.2}))

func isScared():
	return fear >= (0.5 - 0.3 * personalityScore({PersonalityStat.Coward: 1.0}))
	
func isVeryScared():
	return fear >= 0.9
	
func getAboutToPassOutScore():
	if(getConsciousness() > 0.8):
		return 0.0
	
	return clamp(1.0 - getConsciousness()*2.0, 0.0, 1.0)
	
func addPain(newpain):
	.addPain(newpain)
	if(newpain >= 0.0 && getChar().getPainLevel() >= 1.0):
		addConsciousness(-float(newpain) / 100.0)
	
func getConsciousness() -> float:
	return getChar().getConsciousness()
	
func addConsciousness(newcon):
	getChar().addConsciousness(newcon)
	if(newcon < 0.0):
		if(getConsciousness() < 0.5):
			if(fetishScore({Fetish.UnconsciousSex:1.0}) < 0.3):
				addFrustration(abs(newcon)*3.0)
			else:
				addSatisfaction(abs(newcon)*3.0)
		if(getConsciousness() >= 0.5):
			if(fetishScore({Fetish.Choking:1.0}) < 0.3):
				addFrustration(abs(newcon))
			else:
				addSatisfaction(abs(newcon))
	
func addFear(addfear):
	if(getConsciousness() <= 1.0 && addfear > 0.0):
		addfear = addfear / max(getConsciousness(), 0.1)
	fear += addfear * (1.0 + personalityScore({PersonalityStat.Coward: 0.5}))
	fear = clamp(fear, 0.0, 1.0)
	var forcedObedience = clamp(getChar().getForcedObedienceLevel(), 0.0, 1.0)
	fear = clamp(fear, 0.0, 1.0 - forcedObedience)

func addResistance(addres):
	if(isScared()):
		addres /= 2.0
	if(isVeryScared()):
		addres /= 2.0
	
	resistance += addres * (1.0 + personalityScore({PersonalityStat.Subby: -0.2, PersonalityStat.Brat: 0.1}))
	resistance = clamp(resistance, 0.0, 1.0)
	var forcedObedience = clamp(getChar().getForcedObedienceLevel(), 0.0, 1.0)
	resistance = clamp(resistance, 0.0, 1.0 - forcedObedience)
	if(addres > 0.0):
		addFrustration(addres * 0.2)

func getResistScore():
	if(isScared()):
		return 0.0
	if(isResisting()):
		return 1.0
	if(RNG.chance(personalityScore({PersonalityStat.Brat: 1.0}) * 5.0)):
		return 1.0
	return 0.0

func getResistScoreSmooth():
	if(isScared()):
		return 0.0
	if(isResisting()):
		return 1.0
	if(RNG.chance(personalityScore({PersonalityStat.Brat: 1.0}) * 5.0)):
		return 1.0
	return resistance

func getComplyScore():
	if(isScared()):
		return 0.0
	if(isResisting()):
		return 0.0
	return 1.0

func processTurn():
	arousalNaturalFade()
#	var character = getChar()
#	var personality:Personality = character.getPersonality()
#
#	var bratiness = personality.getStat(PersonalityStat.Brattiness)
#	resistance = Util.moveNumberTowards(resistance, bratiness, 0.01)
	fear = Util.moveNumberTowards(fear, 0.0, 0.02 + personalityScore({PersonalityStat.Coward: -0.02}))
	if(isScared()):
		resistance = Util.moveNumberTowards(resistance, 0.0, fear / 10.0)
	else:
		if(getChar().getBuffsHolder().hasBuff(Buff.ActiveResistanceInSexBuff)):
			resistance = Util.moveNumberTowards(resistance, 1.0, 0.1)
	
	var forcedObedience = clamp(getChar().getForcedObedienceLevel(), 0.0, 1.0)
	if(forcedObedience > 0.0):
		resistance = clamp(resistance, 0.0, 1.0 - forcedObedience)
		fear = clamp(fear, 0.0, 1.0 - forcedObedience)
	
	.processTurn()
	resistanceFull += resistance
	fearFull += fear
	

func getAverageResistance():
	return resistanceFull / float(Util.maxi(1, tick))

func getAverageFear():
	return fearFull / float(Util.maxi(1, tick))

func getSexEndInfo():
	var texts:Array = .getSexEndInfo()
	
	texts.append("Average resistance: "+str(Util.roundF(getAverageResistance()*100.0, 1))+"%")
	texts.append("Average fear: "+str(Util.roundF(getAverageFear()*100.0, 1))+"%")
	
	return texts

func affectPersonality(_personality:Personality, _fetishHolder:FetishHolder):
	var theChanges = []
	
	if(isUnconscious()):
		if(RNG.chance(50)):
			if(_personality.addStat(PersonalityStat.Subby, RNG.randf_range(0.05, 0.1))):
				theChanges.append("{npc.name} became less dominant because {npc.he} finished unconscious.")
		if(RNG.chance(30)):
			if(_personality.addStat(PersonalityStat.Coward, RNG.randf_range(0.05, 0.1))):
				theChanges.append("{npc.name} became more cowardly because {npc.he} finished unconscious.")
		if(RNG.chance(20)):
			if(_personality.addStat(PersonalityStat.Naive, RNG.randf_range(-0.1, -0.05))):
				theChanges.append("{npc.name} became less naive because {npc.he} finished unconscious.")
		if(RNG.chance(20)):
			if(_personality.addStat(PersonalityStat.Brat, RNG.randf_range(-0.05, -0.01))):
				theChanges.append("{npc.name} became slightly less bratty because {npc.he} finished unconscious.")
	else:
		if(getTimesCame() <= 0):
			if(RNG.chance(50)):
				if(_personality.addStat(PersonalityStat.Brat, RNG.randf_range(-0.1, -0.01))):
					theChanges.append("{npc.name} became less bratty because of the frustration.")
			if(RNG.chance(50)):
				if(_personality.addStat(PersonalityStat.Mean, RNG.randf_range(0.01, 0.05))):
					theChanges.append("{npc.name} became slightly more mean because of the frustration.")
			if(RNG.chance(50)):
				if(_personality.addStat(PersonalityStat.Subby, RNG.randf_range(0.01, 0.05))):
					theChanges.append("{npc.name} became slightly more subby because of the frustration.")
			if(RNG.chance(50)):
				if(_personality.addStat(PersonalityStat.Impatient, RNG.randf_range(0.01, 0.05))):
					theChanges.append("{npc.name} became more impatient because of the frustration.")
		if(getTimesCame() >= 4):
			if(RNG.chance(50)):
				if(_personality.addStat(PersonalityStat.Subby, RNG.randf_range(0.05, 0.15))):
					theChanges.append("{npc.name} became more subby after so many orgasms.")
			if(RNG.chance(50)):
				if(_personality.addStat(PersonalityStat.Naive, RNG.randf_range(0.05, 0.1))):
					theChanges.append("{npc.name} became more naive after so many orgasms.")
		if(getTimesCame() >= 2):
			if(RNG.chance(30)):
				if(_personality.addStat(PersonalityStat.Subby, RNG.randf_range(0.01, 0.1))):
					theChanges.append("{npc.name} became less dominant after getting to cum.")
			if(RNG.chance(30)):
				if(_personality.addStat(PersonalityStat.Impatient, RNG.randf_range(-0.05, -0.01))):
					theChanges.append("{npc.name} became less impatient after getting to cum.")
		
		if(getAverageResistance() > 0.5):
			if(RNG.chance(50)):
				if(_personality.addStat(PersonalityStat.Subby, RNG.randf_range(-0.1, -0.01))):
					theChanges.append("{npc.name} became slightly more dominant after resisting so much.")
			if(RNG.chance(50)):
				if(_personality.addStat(PersonalityStat.Coward, RNG.randf_range(-0.2, -0.05))):
					theChanges.append("{npc.name} became less cowardly after resisting so much.")
			if(RNG.chance(30)):
				if(_personality.addStat(PersonalityStat.Brat, RNG.randf_range(0.02, 0.1))):
					theChanges.append("{npc.name} became more bratty after resisting so much.")
		
		if(getTimesCame() >= 1 && getAverageLust() > 0.5 && getAverageResistance() < 0.3):
			if(RNG.chance(50)):
				if(_personality.addStat(PersonalityStat.Subby, RNG.randf_range(0.01, 0.1))):
					theChanges.append("{npc.name} became more subby after a good sex.")
			if(RNG.chance(30)):
				if(_personality.addStat(PersonalityStat.Brat, RNG.randf_range(0.01, 0.05))):
					theChanges.append("{npc.name} became slightly more bratty after a good sex.")
			if(RNG.chance(30)):
				if(_personality.addStat(PersonalityStat.Coward, RNG.randf_range(-0.05, -0.01))):
					theChanges.append("{npc.name} became less cowardly after a good sex.")
			
		if(getAverageFear() > 0.6):
			if(RNG.chance(70)):
				if(_personality.addStat(PersonalityStat.Coward, RNG.randf_range(0.01, 0.1))):
					theChanges.append("{npc.name} became more cowardly after so much intimidation.")
			if(RNG.chance(30)):
				if(_personality.addStat(PersonalityStat.Brat, RNG.randf_range(-0.05, -0.01))):
					theChanges.append("{npc.name} became less bratty after so much intimidation.")
	
	return GM.ui.processString(Util.join(theChanges, "\n"), {npc=charID})

func getOpponentInfo():
	return getSexEngine().doms[getSexEngine().doms.keys()[0]]

func onGoalSatisfied(_thedominfo, _goalid, _thesubinfo, _mult:float = 1.0):
	if(isResistingSlightly()):
		addFrustration(1.0*_mult)
	else:
		addSatisfaction(0.5*_mult)

func onGoalFailed(_thedominfo, _goalid, _thesubinfo, _mult:float = 1.0):
	if(isResistingSlightly()):
		addSatisfaction(0.5*_mult)
	else:
		addFrustration(1.0*_mult)

func saveData():
	var data = .saveData()
	
	data["resistance"] = resistance
	data["fear"] = fear
	data["resistanceFull"] = resistanceFull
	data["fearFull"] = fearFull

	return data
	
func loadData(data):
	.loadData(data)
	
	resistance = SAVE.loadVar(data, "resistance", 0.0)
	fear = SAVE.loadVar(data, "fear", 0.0)
	resistanceFull = SAVE.loadVar(data, "resistanceFull", 0.0)
	fearFull = SAVE.loadVar(data, "fearFull", 0.0)
