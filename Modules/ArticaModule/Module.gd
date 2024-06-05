extends Module

func getFlags():
	return {
		"shyness": flag(FlagType.Number),
		"pawslut": flag(FlagType.Number),
		"corruption": flag(FlagType.Number),
		"chastity": flag(FlagType.Number),
		
		"busyUntilDay": flag(FlagType.Number),
		
		"s0happened": flag(FlagType.Bool),
		"s1happened": flag(FlagType.Bool),
		"s1day": flag(FlagType.Number),
		"s2happened": flag(FlagType.Bool),
		"s3happened": flag(FlagType.Bool),
		"s3day": flag(FlagType.Number),
		"s4happened": flag(FlagType.Bool),
		"s5happened": flag(FlagType.Bool),
		"s5day": flag(FlagType.Number),

		
		"s4Outcome": flag(FlagType.Text), #left offerself won lost
		"s5GaveMassage": flag(FlagType.Bool),
		"s6FirstTime": flag(FlagType.Bool),
		"s6AskedLeg": flag(FlagType.Bool),
		"s6AskedRisha": flag(FlagType.Bool),
		"s6AskedPaws": flag(FlagType.Bool),
		"s6AskedMood": flag(FlagType.Bool),
		"s6HeardStory": flag(FlagType.Bool),
		"s6GrabbedThroat": flag(FlagType.Bool),
		"s6HadRoughSex": flag(FlagType.Bool),
		"s6HadRoughSexCameInside": flag(FlagType.Bool),
		"s6ateday": flag(FlagType.Number),
		
		"corruptionBegan": flag(FlagType.Bool),
		"NoClothes": flag(FlagType.Bool),
		"wearsPortalPanties": flag(FlagType.Bool),
		"isLusty": flag(FlagType.Bool),
		"firstTimeWait": flag(FlagType.Bool),
		
		"gotChastityDenied": flag(FlagType.Bool),
		"cagedDay": flag(FlagType.Number),
		"cagedTotalDays": flag(FlagType.Number),
		"cagedAcceptStage": flag(FlagType.Number),
		
		"TentaclesPcHasFlower": flag(FlagType.Bool),
		"TentaclesArticaHasFlower": flag(FlagType.Bool),
		
		"nextReaction": flag(FlagType.Text), # t1won t1lost t1ran t1bully t2con t2noncon t3hap t4hap s1hap s2bul s2lost s2won s3hap d1hap d2won d2pc d3hap p1hap p2pc p2alone
		
		"eventTentacles": flag(FlagType.Number),
		"eventSelfsuck": flag(FlagType.Number),
		"eventDildo": flag(FlagType.Number),
		"eventPortalPanties": flag(FlagType.Number),
	}

func _init():
	id = "ArticaModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/ArticaModule/c0Shy/articaS0IntakeScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS1CellblockScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS2HungryScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS3CanteenScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS4CanteenScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS5CanteenPawsScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS6CanteenTalkScene.gd",
		"res://Modules/ArticaModule/c0Shy/articaS7FirstShowerScene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/articaTalkScene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Tease/articaCanteenTeaseScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Tease/articaCellTeaseScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Tease/articaSlaveGangbangScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Tease/articaMilkingInCellScene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexRideScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexBreedScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexPawjobScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexRopesScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexMutualPawjobScene.gd",
		"res://Modules/ArticaModule/c1Corruption/Sex/articaSexHypnovisorScene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Other/articaShowerScene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventTentacles1Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventTentacles1dot5Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventTentacles2Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventTentacles3Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventTentacles4Scene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventSelfsuck1Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventSelfsuck2Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventSelfsuck3Scene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventDildo1Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventDildo2Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventDildo3Scene.gd",
		
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventPortalPanties1Scene.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/articaEventPortalPanties2Scene.gd",
		]
	characters = [
		"res://Modules/ArticaModule/ArticaCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/ArticaModule/c1Corruption/ArticaTalkEvent.gd",
		"res://Modules/ArticaModule/c0Shy/ArticaIntroEvent.gd",
		"res://Modules/ArticaModule/c0Shy/ArticaShyTalkEvent.gd",
		"res://Modules/ArticaModule/c1Corruption/Event/ArticaGreenhousesStealFlowerEvent.gd",
	]
	species = [
		"res://Modules/ArticaModule/IceJogauniSpecies.gd",
	]
	worldEdits = [
		"res://Modules/ArticaModule/c1Corruption/ArticaWorldEdit.gd",
	]

func startCaged():
	setFlag("ArticaModule.cagedDay", GM.main.getDays())

func endCaged():
	var cagedDay = getFlag("ArticaModule.cagedDay", -1)
	if(cagedDay > 0):
		var daysCaged = GM.main.getDays() - cagedDay
		increaseFlag("ArticaModule.cagedTotalDays", daysCaged)
	setFlag("ArticaModule.cagedDay", -1)

func getCagedDaysCurrently():
	var cagedDay = getFlag("ArticaModule.cagedDay", -1)
	if(cagedDay > 0):
		var daysCaged = GM.main.getDays() - cagedDay
		return daysCaged
	return 0

func getCagedDays():
	var recordedDaysCaged = getFlag("ArticaModule.cagedTotalDays", 0)
	var cagedDay = getFlag("ArticaModule.cagedDay", -1)
	if(cagedDay > 0):
		var daysCaged = GM.main.getDays() - cagedDay
		recordedDaysCaged += daysCaged
	return recordedDaysCaged

func resetFlagsOnNewDay():
	pass

func getShyness():
	return clamp(getFlag("ArticaModule.shyness", 1.0), 0.0, 1.0)

func removeShy(howMuch, showMessage = true):
	var oldShyness = getShyness()
	var newValue = clamp(oldShyness - howMuch, 0.0, 1.0)
	if(oldShyness != newValue && showMessage):
		if(newValue > oldShyness):
			GM.main.addMessage("Artica's shyness has increased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
		else:
			GM.main.addMessage("Artica's shyness has decreased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
	
	setFlag("ArticaModule.shyness", newValue)
	
func getPawSlut():
	return clamp(getFlag("ArticaModule.pawslut", 0.0), 0.0, 1.0)

func getPawslut():
	return getPawSlut()

func addPawslut(howMuch, showMessage = true):
	var oldPawslut = getPawSlut()
	var newValue = clamp(oldPawslut + howMuch, 0.0, 1.0)
	if(oldPawslut != newValue && showMessage):
		if(newValue > oldPawslut):
			GM.main.addMessage("Artica's interest in paws has increased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
		else:
			GM.main.addMessage("Artica's interest in paws has decreased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
	
	setFlag("ArticaModule.pawslut", newValue)

func getCorruption():
	return clamp(getFlag("ArticaModule.corruption", 0.0), 0.0, 1.0)

func addCorruption(howMuch, showMessage = true):
	var oldCorruption = getCorruption()
	var newValue = clamp(oldCorruption + howMuch, 0.0, 1.0)
	if(oldCorruption != newValue && showMessage):
		if(newValue > oldCorruption):
			GM.main.addMessage("Artica's corruption has increased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
		elif(newValue < oldCorruption):
			GM.main.addMessage("Artica's corruption has decreased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
	
	setFlag("ArticaModule.corruption", newValue)

func triggerCorruption(howMuch, showMessage = true):
	addCorruption(howMuch, showMessage)
	setFlag("ArticaModule.isLusty", false)

func isSlut():
	return getCorruption() >= 0.4

func isVerySlut():
	return getCorruption() >= 0.8

func getChastity():
	return clamp(getFlag("ArticaModule.chastity", 0.0), 0.0, 1.0)

func addChastity(howMuch, showMessage = true):
	var oldChastity = getChastity()
	var newValue = clamp(oldChastity + howMuch, 0.0, 1.0)
	if(oldChastity != newValue && showMessage):
		if(newValue > oldChastity):
			GM.main.addMessage("Artica's acceptance of chastity has increased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
		else:
			GM.main.addMessage("Artica's acceptance of chastity has decreased to "+str(Util.roundF(newValue*100.0, 1))+"%!")
	
	setFlag("ArticaModule.chastity", newValue)

func getShynessString():
	var theShyness = getShyness()
	
	if theShyness >= 0.8:
		return "Extremely shy"
	elif 0.5 <= theShyness && theShyness < 0.8:
		return "Quite shy"
	elif 0.3 <= theShyness && theShyness < 0.5:
		return "Pretty shy"
	elif 0.1 <= theShyness && theShyness < 0.3:
		return "Slightly shy"
	else:
		return "Slightly confident"

func getPawslutString():
	var thePawSlut = getPawSlut()

	if thePawSlut >= 0.9:
		return "Artica is utterly obsessed with paws"
	elif 0.7 <= thePawSlut && thePawSlut < 0.9:
		return "Artica is highly enthusiastic paw lover"
	elif 0.5 <= thePawSlut && thePawSlut < 0.7:
		return "Artica enjoys paw play immensely"
	elif 0.3 <= thePawSlut && thePawSlut < 0.5:
		return "Artica is interested in paws"
	elif 0.1 <= thePawSlut && thePawSlut < 0.3:
		return "Artica has a moderate interest in paw play"
	elif 0.05 <= thePawSlut && thePawSlut < 0.1:
		return "Artica seems to be slightly intrigued by paws"
	else:
		return "Artica has no obvious interest in paws"

func isLusty():
	return getFlag("ArticaModule.isLusty", false)

func makeLusty():
	setFlag("ArticaModule.isLusty", true)

func canTriggerWaitScene():
	return getNextWaitSceneInfo() != null

#		"TentaclesPcHasFlower": flag(FlagType.Bool),
#		"TentaclesArticaHasFlower": flag(FlagType.Bool),
#
#		"nextReaction": flag(FlagType.Text), #
#
#		"eventTentacles": flag(FlagType.Number),
#		"eventSelfsuck": flag(FlagType.Number),
#		"eventDildo": flag(FlagType.Number),
#		"eventPortalPanties": flag(FlagType.Number),

func getCorruptionEventScenes():
	return {
		"eventTentacles": [
			{
				"name": "Scouting greenhouses",
				"scene": "articaEventTentacles1Scene",
			},
			{
				"name": "Small tentacles",
				"scene": "articaEventTentacles2Scene",
				"canstart": getFlag("ArticaModule.TentaclesArticaHasFlower", false),
				"hint": "Artica needs a special flower. Steal one from the greenhouses and give it to her!",
			},
			{
				"name": "Big tentacles",
				"scene": "articaEventTentacles3Scene",
			},
		],
		"eventSelfsuck": [
			{
				"name": "First Yoga",
				"scene": "articaEventSelfsuck1Scene",
			},
			{
				"name": "Gym conflict",
				"scene": "articaEventSelfsuck2Scene",
			},
			{
				"name": "Bending deep..",
				"scene": "articaEventSelfsuck3Scene",
			}
		],
		"eventDildo": [
			{
				"name": "Creating a mold",
				"scene": "articaEventDildo1Scene",
			},
			{
				"name": "Dildo royale!",
				"scene": "articaEventDildo2Scene",
			},
			{
				"name": "Big reward",
				"scene": "articaEventDildo3Scene",
			}
		],
		"eventPortalPanties": [
			{
				"name": "Hypnovisor",
				"scene": "articaEventPortalPanties1Scene",
			},
			{
				"name": "Portal panties",
				"scene": "articaEventPortalPanties2Scene",
				"canstart": !GlobalRegistry.getCharacter("artica").isWearingChastityCage(),
				"hint": "Artica can not be wearing a chastity cage",
			}
		]
	}

func getNextWaitSceneInfo():
	var possible = []
	
	var scenesInfo = getCorruptionEventScenes()
	
	for eventID in scenesInfo:
		var eventScenes:Array = scenesInfo[eventID]
		var sceneAmount = eventScenes.size()
		var flagValue = int(getFlag("ArticaModule."+eventID, 0))
		
		if(flagValue >= sceneAmount):
			continue
		
		var theSceneInfo = eventScenes[flagValue]
		var canStart = (true if (!theSceneInfo.has("canstart")) else theSceneInfo["canstart"])
		
		if(canStart):
			possible.append([theSceneInfo["scene"], eventID])
		
	if(possible.size() == 0):
		return null
	
	return RNG.pick(possible)

func hasAnyWaitScenesLeft():
	var scenesInfo = getCorruptionEventScenes()
	
	for eventID in scenesInfo:
		var eventScenes:Array = scenesInfo[eventID]
		var sceneAmount = eventScenes.size()
		var flagValue = int(getFlag("ArticaModule."+eventID, 0))
		
		if(flagValue < sceneAmount):
			return true
	
	return false

func getBlockingReqs():
	var allblockingreqs = []
	
	var scenesInfo = getCorruptionEventScenes()
	
	for eventID in scenesInfo:
		var eventScenes:Array = scenesInfo[eventID]
		var sceneAmount = eventScenes.size()
		var flagValue = int(getFlag("ArticaModule."+eventID, 0))
		
		if(flagValue >= sceneAmount):
			continue
		
		var theSceneInfo = eventScenes[flagValue]
		var canStart = (true if (!theSceneInfo.has("canstart")) else theSceneInfo["canstart"])
		
		if(!canStart):
			allblockingreqs.append(theSceneInfo["hint"])
		
	return Util.join(allblockingreqs, "\n")

#		"eventTentacles": flag(FlagType.Number),
#		"eventSelfsuck": flag(FlagType.Number),
#		"eventDildo": flag(FlagType.Number),
#		"eventPortalPanties": flag(FlagType.Number),
func getReplayMenuScenes():
	var possible = {}
	
	var scenesInfo = getCorruptionEventScenes()
	
	var eventIDToName = {
		"eventTentacles": "Tentacles",
		"eventSelfsuck": "Self-sucking",
		"eventDildo": "Big canine dildo",
		"eventPortalPanties": "Test subject",
	}
	for eventID in scenesInfo:
		possible[eventID] = {
			"name": eventIDToName[eventID],
			"scenes": [],
		}
		
		var eventScenes:Array = scenesInfo[eventID]
		#var sceneAmount = eventScenes.size()
		var flagValue = int(getFlag("ArticaModule."+eventID, 0))
		
		var _i = 0
		for theSceneInfo in eventScenes:
			var canStart = (true if (!theSceneInfo.has("canstart")) else theSceneInfo["canstart"])
			
			if(!canStart):
				possible[eventID]["scenes"].append({
					"name": theSceneInfo["name"],
					"desc": "Can't replay this scene!\n\n"+theSceneInfo["hint"],
					"canstart": canStart,
					"scene": theSceneInfo["scene"],
				})
			elif(flagValue <= _i):
				possible[eventID]["scenes"].append({
					"name": theSceneInfo["name"],
					"desc": "This scene hasn't happened yet",
					"canstart": false,
					"scene": theSceneInfo["scene"],
				})
			elif(canStart):
				possible[eventID]["scenes"].append({
					"name": theSceneInfo["name"],
					"desc": "Replay this scene",
					"canstart": canStart,
					"scene": theSceneInfo["scene"],
				})

			_i += 1
		
	return possible

func getReactionFor(_topic):
	if(_topic == "t1won"):
		return "You really showed that husky.. haha.. Thank you again, I’d never be able to get that flower on my own.."
	if(_topic == "t1lost"):
		return "So unfortunate that I couldn’t get my paws on that flower.. But thank you anyway.."
	if(_topic == "t1ran"):
		return "That husky was gonna do something to me.. I wonder what.. So unfortunate that I left the flower there.."
	if(_topic == "t1bully"):
		return "Some guards are such meanies.. Their stun batons are so.. s-scary.. mmmhh.. mm.."
	if(_topic == "t2con"):
		return "I s-suggest being careful near the greenhouses.. S-some plants have grown bigger than a person.."
	if(_topic == "t2noncon"):
		return "I s-suggest being careful near the greenhouses.. S-some plants have grown so big t-they can.. yeah.. mmhh.."
	if(_topic == "t3hap"):
		return "Um.. Does my belly look bigger than normal?..  I t-think I a-ate too much today.. y-yeah.. mm.."
	if(_topic == "t4hap"):
		return "At least my belly isn’t as big anymore.. It was a-akward when people were looking at me, thinking I’m pregnant.. I’m c-curious, do the eggs taste.. a-alright?.."
	if(_topic == "s1hap"):
		return "I’m making progress but.. I’m still not that flexible... I think with a bit more practice, I’ll be able to take it all the way. Um.. you know.. get the full experience.. uh.. yoga experience.. y-yeah.. yoga.."
	if(_topic == "s2bul"):
		return "I’ve met some meanies today.. But I t-think it was.. a b-blessing in disguise?.. D-don’t worry about it.."
	if(_topic == "s2lost"):
		return "T-thank you for trying to save me.. S-sorry that it happened like that.."
	if(_topic == "s2won"):
		return "T-thank you for your help, r-really.. I think I can still.. improve. I wanna see how far I can go.. you k-know.."
	if(_topic == "s3hap"):
		return "You probably t-think that I’m a.. s-slut.. It's just.. y-you know.. um.. I c-can’t r-really say anything against t-that.."
	if(_topic == "d1hap"):
		return "I met a very helpful girl today.. Not e-everyone here seems to be mean.. Oh, I mean.. y-you’re not mean.. of c-course.. haha.. But that girl is also so h-happy.. wonder if it has a-anything to do with her.. nakedness.. hah."
	if(_topic == "d2won"):
		return "I w-was ready to g-give up.. But you h-helped me.. to push through.. mm-mh.. t-thank you for helping me keep my.. I mean.. um.. eep.. win that toy, hah.."
	if(_topic == "d2pc"):
		return "I t-thought I was gonna l-lose my.. I m-mean.. that.. t-toy.. I w-wasn’t gonna g-get.. I thought.. Um.. eep.. t-thank you.."
	if(_topic == "d3hap"):
		return "My legs are still shaky.. You c-can’t imagine how good your own.. umm.. i-ignore that.. haha.. That t-toy is really good though.. gods, I talk like a s-slut.."
	if(_topic == "p1hap"):
		return "Um.. hai.. haha.. I’m such a whore for hypnosis.. Yeah-hhh.. w-wait.. what did I just say.. gods.. What did I just say to you?.. M-my mind is s-scrambled a bit, i-ignore it if I said something s-silly.."
	if(_topic == "p2pc"):
		return "I w-was told I could k-keep the panties.. T-they are so.. cool.. I s-still can’t imagine that something like this is p-possible.. W-want me to put t-them on?.."
	if(_topic == "p2alone"):
		return "Hey.. um.. I found some cool panties.. they’re like.. um.. hard to explain.. they’re like see-through ones.. but not see.. they’re more like.. touch-through?.. Want m-me to try them on?.. I h-had a lot of fun with them.. l-lightly speaking.."
	
	return ""

func getReaction():
	var customReaction = getReactionFor(getFlag("ArticaModule.nextReaction", ""))
	if(customReaction != ""):
		setFlag("ArticaModule.nextReaction", "")
		return customReaction
	
	var theCorruption = getCorruption()
	
	if(theCorruption > 0.8):
		return RNG.pick([
			"Hey there..",
			"Heya.. Hope you're doing well, haha.",
			"Hello..",
			"Hellos..",
		])
	elif(theCorruption > 0.4):
		return RNG.pick([
			"Hey there.. Always good to see you..",
			"Hello..",
			"Heya..",
		])
	else:
		return RNG.pick([
			"Oh.. hey..",
			"Hello..",
			"Hey..",
		])
