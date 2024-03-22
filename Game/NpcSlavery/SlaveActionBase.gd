extends Reference
class_name SlaveActionBase

const Nothing = 0
const Reward = 1
const Punishment = 2
const Talk = 3
const Action = 4

var id = "ERROR"
var actionType = Nothing
var slaveRequired = true
var slaveSkillsRequired = {}
var onlyShowWhenHaveRequiredSkills = false
var slaveMinLevel = 0
var extraSlaves = {
#	"dom": {
#		name = "Dominant",
#		desc = "Person who dominates!",
#		slaveSkillsRequired = {},
#		slaveMinLevel = 0,
#	}
}
var sceneID = ""
var endsTalkScene = false
var slaveResistChanceMult = 1.0
var slaveOnlyActiveResist = false # The one where you have to beat up the slave
var buttonPriority = 100
var rewardHint = 0

func getVisibleName():
	return "CHANGE ME"

func getVisibleDesc():
	return "CHANGE MY DESCRIPTION"

func getFinalVisibleDesc():
	var theDesc = getVisibleDesc()
	
	if(rewardHint > 0):
		var rewardLevels = ["a small reward", "a normal reward", "a big reward", "one of the best possible rewards"]
		theDesc += "\nThis is "+rewardLevels[Util.mini(3, rewardHint-1)]+""
	if(rewardHint < 0):
		var rewardLevels = ["a small punishment", "a normal punishment", "a big punishment", "one of the worst possible punishments"]
		theDesc += "\nThis is "+rewardLevels[Util.mini(3, -rewardHint-1)]+""
	
	if(slaveMinLevel > 0):
		theDesc += "\nSlave minimal level: "+str(slaveMinLevel)
	if(!slaveSkillsRequired.empty()):
		var reqs = []
		for slaveType in slaveSkillsRequired:
			var slaveTypeLevel = slaveSkillsRequired[slaveType]
			var slaveTypeObj:SlaveTypeBase = GlobalRegistry.getSlaveType(slaveType)
			if(slaveTypeObj == null):
				continue
			reqs.append(slaveTypeObj.getVisibleName()+": "+NpcSlave.rankToLetter(slaveTypeLevel))
		theDesc += "\nRequired skills: "+Util.join(reqs, ", ")
	
	return theDesc

func isActionVisible(_slaveID):
	return true

func isActionVisibleFinal(_slaveID):
	var npcSlave:NpcSlave = getSlave(_slaveID)
	if(onlyShowWhenHaveRequiredSkills):
		for slaveType in slaveSkillsRequired:
			if(npcSlave.getSlaveSkill(slaveType) < slaveSkillsRequired[slaveType]):
				return false
	
	return isActionVisible(_slaveID)

func checkCanDo(_slaveID, _extraSlavesIDs = {}):

	#return [false, "You need a penis"]
	return [true]

func checkCanDoFinal(_slaveID, _extraSlavesIDs = {}):
	var checkCanDoData = checkCanDo(_slaveID, _extraSlavesIDs)
	if(checkCanDoData is bool):
		if(!checkCanDoData):
			return [false, "One of the conditions wasn't met"]
	if(!checkCanDoData[0]):
		return checkCanDoData
	
	if(slaveRequired):
		var fitsMainSlaveData = fitsAsMainSlaveAdvanced(_slaveID)
		if(!fitsMainSlaveData[0]):
			return fitsMainSlaveData
	
	for roleID in extraSlaves:
		if(!_extraSlavesIDs.has(roleID)):
			return [false, "One of the roles isn't selected"]
		var fitsExtraSlaveData = fitsAsExtraSlaveAdvanced(roleID, _extraSlavesIDs[roleID])
		if(!fitsExtraSlaveData[0]):
			return fitsExtraSlaveData
	
	return [true]

func fitsAsMainSlaveAdvanced(_charID):
	var npcSlave:NpcSlave = getSlave(_charID)
	if(npcSlave.getLevel() < slaveMinLevel):
		return [false, "Slave must be of level "+str(slaveMinLevel)+" or higher"]
	for slaveType in slaveSkillsRequired:
		if(npcSlave.getSlaveSkill(slaveType) < slaveSkillsRequired[slaveType]):
			return [false, "Skill requirements aren't met"]
		
	return [true]

func fitsAsMainSlave(_charID):
	return fitsAsMainSlaveAdvanced(_charID)[0]

func fitsAsExtraSlaveAdvanced(_role, _charID):
	var npcSlave:NpcSlave = getSlave(_charID)
	var extraSlaveInfo = extraSlaves[_role]
	
	if(extraSlaveInfo.has("slaveMinLevel")):
		if(npcSlave.getLevel() < extraSlaveInfo["slaveMinLevel"]):
			return [false, "Slave must be of level "+str(slaveMinLevel)+" or higher"]
	if(extraSlaveInfo.has("slaveSkillsRequired")):
		var theRequiredSkills = extraSlaveInfo["slaveSkillsRequired"]
		for slaveType in theRequiredSkills:
			if(npcSlave.getSlaveSkill(slaveType) < theRequiredSkills[slaveType]):
				return [false, "Skill requirements aren't met"]
	if(npcSlave.isDoingActivity()):
		return [false, "Skill is busy doing something"]
	
	return [true]

func fitsAsExtraSlave(_role, _charID):
	return fitsAsExtraSlaveAdvanced(_role, _charID)[0]

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	return {
		text = "You did something with "+str(_slaveID)+"!",
	}

func doActionSimpleFinal(_slaveID, _extraSlavesIDs = {}):
	var actionLocation = getActionLocation(_slaveID, _extraSlavesIDs)
	if(actionLocation != null):
		GM.main.aimCameraAndSetLocName(actionLocation)
	playAnimation(_slaveID, _extraSlavesIDs)
	GM.main.processTime(getTimePass(_slaveID, _extraSlavesIDs))
	return doActionSimple(_slaveID, _extraSlavesIDs)

func reactSceneResult(_slaveID, _extraSlavesIDs = {}, _sceneResult = {}):
	print("REACT SCENE RESULT")
	return

func getSlave(_slaveID) -> NpcSlave:
	return GlobalRegistry.getCharacter(_slaveID).getNpcSlavery()

func getAnimationInfo(_slaveID, _extraSlavesIDs = {}):
	return null

func playAnimation(_slaveID, _extraSlavesIDs = {}):
	var animInfo = getAnimationInfo(_slaveID, _extraSlavesIDs)
	if(animInfo == null):
		return
	
	if(animInfo.size() > 2):
		GM.main.playAnimation(animInfo[0], animInfo[1], animInfo[2])
	else:
		GM.main.playAnimation(animInfo[0], animInfo[1])

func getFlag(flagID, defaultValue = null):
	return GM.main.getFlag(flagID, defaultValue)

func getActionLocation(_slaveID, _extraSlavesIDs = {}):
	return ""

func getExtraActions(_slaveID, _extraSlavesIDs = {}):
	return []

func getTimePass(_slaveID, _extraSlavesIDs = {}):
	return 60*10
