extends SexActivityBase

var didSpankThisTime = false
var didBigSpankThisTime = false

var subShouldCount = false
var correctSpankAmount = 0

var isFakeSpank = false
var awaitsAnswer = false

var correctTimer = 0
var wrongTimer = 0

var needToSayTooLate = false
var needToSayAvoidedTrap = false

var targetSpanks = 0
var coverButtTimer = 0

func _init():
	id = "Spanking"

func getGoals():
	return {
		SexGoal.SpankSub: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_domInfo.getChar().hasBlockedHands() || _domInfo.getChar().hasBoundArms()):
		return false
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Spank"

func getCategory():
	return ["Humiliate"]

func getDomTags():
	return [SexActivityTag.HandsUsed, SexActivityTag.HavingSex]

func getSubTags():
	return [SexActivityTag.AnusUsed, SexActivityTag.VaginaUsed, SexActivityTag.PenisUsed, SexActivityTag.HavingSex, SexActivityTag.PreventsSubTeasing]

func startActivity(_args):
	state = ""
	targetSpanks = RNG.randi_range(5, 16)
	var text = ""
	affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0})+0.0, 0.1, -0.1, -0.01)
	text += RNG.pick([
		"{dom.You} {dom.youVerb('prepare')} to spank {sub.you}.",
	])
	return {
		text = text,
		domSay = RNG.pick([
			"Give me that {butt}.",
			"I think you were a bad {sub.boy}.",
			"Shut up and stick that {butt} up.",
			"Don't cover yourself up.",
			"Don't you dare cover yourself up.",
		]),
		#subSay = subSay,
	}

func onSwitchFrom(_otherActivity, _args):
	return .onSwitchFrom(_otherActivity, _args)

func processTurn():
	if(state == ""):
		var text = ""
		var domSay = null
		
		if(subShouldCount):
			if(correctTimer > 0):
				correctTimer = 0
				if(RNG.chance(20)):
					domSay = RNG.pick([
						"Mhm",
						"Correct.",
						"Good.",
						"Keep counting",
						"Uh huh",
						"Good job",
					])
			if(wrongTimer > 0):
				wrongTimer = 0
				domSay = RNG.pick([
					"Nope!",
					"Wrong!",
					"Think again, stupid bitch.",
					"Wrong answer.",
					"Nuh uh.",
					"Are you really that bad at counting?",
					"Really?",
					"Can't even count right?",
				])
			
			if(needToSayAvoidedTrap):
				needToSayAvoidedTrap = false
				text += RNG.pick([
					"{sub.You} avoided the trap!",
				])
				#isFakeSpank = false
				pass
			if(needToSayTooLate):
				needToSayTooLate = false
				text += RNG.pick([
					"{sub.You} didn't answer in time!",
				])
				domInfo.addAnger(0.3)
				domSay = RNG.pick([
					"How are you this bad at counting?",
					"Time's up!",
					"Think faster!",
				])
		
		return {
			text = text,
			domSay = domSay,
		}


func getDomActions():
	var actions = []
	actions.append({
		"id": "stop",
		"score": getStopScore(),
		"name": "Stop spanking",
		"desc": "Stop spanking them",
		"priority" : 0,
	})
	if(state in [""]):
		actions.append({
			"id": "fakespank",
			"score": 0.4-domInfo.getAngerScore()/3.0,
			"name": "Rub butt",
			"desc": "Rub that butt lightly and see if they react",
			"priority" : 0,
		})
		actions.append({
			"id": "spank",
			"score": 1.0-domInfo.getAngerScore()/1.2,
			"name": "Spank",
			"desc": "Spank that sub once",
			"priority" : 0,
		})
		actions.append({
			"id": "bigspank",
			"score": domInfo.getAngerScore(),
			"name": "Hard Spank!",
			"desc": "Spank that sub hard",
			"priority" : 0,
		})
	if(!subShouldCount):
		actions.append({
			"id": "startcount",
			"score": 1.0,
			"name": "Make sub count",
			"desc": "Make sub count the spanks",
			"priority" : 0,
		})
	else:
		actions.append({
			"id": "stopcount",
			"score": 0.0,
			"name": "Stop counting",
			"desc": "Enough spank counting",
			"priority" : 0,
		})
	return actions

func getAssDescriptionAfterImpact(_isHard=false):
	var subHealth = getSub().getPainLevel()
	
	if(subHealth < 0.1):
		return RNG.pick([
			"{sub.YourHis} {butt} is still fine.",
			"{sub.YourHis} {butt} doesn't look red yet.",
			"{sub.YourHis} {butt} can take way more spanks than that.",
			"{sub.YourHis} {butt} can take more than that.",
		])
	if(subHealth < 0.3):
		return RNG.pick([
			"{sub.YourHis} {butt} is starting to feel a bit warm.",
			"{sub.YourHis} {butt} is beginning to blush.",
			"{sub.YourHis} {butt} is warming up nicely.",
			"{sub.YourHis} {butt} is getting a light shade of pink.",
		])
	if(subHealth < 0.6):
		return RNG.pick([
			"{sub.YourHis} {butt} is turning pink from the spanks.",
			"{sub.YourHis} {butt} is showing signs of a good spanking.",
			"{sub.YourHis} {butt} is starting to get a rosy hue.",
			"{sub.YourHis} {butt} is responding well to the spanks.",
		])
	if(subHealth < 0.9):
		return RNG.pick([
			"{sub.YourHis} {butt} is noticeably red now.",
			"{sub.YourHis} {butt} is taking a good beating.",
			"{sub.YourHis} {butt} is showing signs of a proper spanking.",
			"{sub.YourHis} {butt} is getting quite red and warm.",
		])
	return RNG.pick([
		"{sub.YourHis} {butt} is burning hot from the intense spanks.",
		"{sub.YourHis} {butt} is thoroughly spanked and glowing.",
		"{sub.YourHis} {butt} is a beautiful shade of crimson.",
		"{sub.YourHis} {butt} is well-spanked and ready for more.",
	])

func doDomAction(_id, _actionInfo):
	if(_id == "stop"):
		var text = ""
		text += "{dom.You} {dom.youVerb('stop')} making {sub.you} rim you."
		endActivity()
		return {
			text = text,
		}
	
	if(_id == "startcount"):
		subShouldCount = true
		correctTimer = 0
		wrongTimer = 0
		correctSpankAmount = 0
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('tell')} {sub.you} to start counting the spanks.",
		])
		var addSay = ""
		if(!getDom().isPlayer()):
			addSay = " I will stop at "+str(targetSpanks)+" spanks."
		
		return {
			text = text,
			domSay="Count how many time I hit your ass."+addSay,
		}
	
	if(_id == "stopcount"):
		subShouldCount = false
		correctTimer = 0
		wrongTimer = 0
		correctSpankAmount = 0
		awaitsAnswer = false
		needToSayAvoidedTrap = false
		needToSayTooLate = false
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('tell')} {sub.you} to stop counting the spanks.",
		])
		
		return {
			text = text,
			domSay="You may stop counting.",
		}
	
	if(_id == "fakespank"):
		didSpankThisTime = true
		if(subShouldCount):
			if(awaitsAnswer):
				if(isFakeSpank):
					needToSayAvoidedTrap = true
				else:
					needToSayTooLate = true
			awaitsAnswer = true
			isFakeSpank = true
			#correctSpankAmount += 1
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('rub')} {sub.your} {butt}!",
			"{dom.You} gently {dom.youVerb('rub')} {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('caress', 'caresses')} {sub.your} rear!",
			"{dom.You} {dom.youVerb('brush', 'brushes')} {dom.yourHis} palm against {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('poke')} {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('touch', 'touches')} {sub.your} {butt} lightly!",
		])
		
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0})+0.6, 0.1, -0.01, -0.01)
		
		if(RNG.chance(50)):
			text += " "+getAssDescriptionAfterImpact(true)
		
		#subInfo.addPain(1)
		#affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0})-0.3, 0.05, -0.1, -0.01)
		#affectDom(subInfo.fetishScore({Fetish.Sadism: 1.0})+0.3, 0.05, -0.01)
		
		return {
			text = text,
		}
	
	if(_id == "spank"):
		didSpankThisTime = true
		if(subShouldCount):
			if(awaitsAnswer):
				if(isFakeSpank):
					needToSayAvoidedTrap = true
				else:
					needToSayTooLate = true
			awaitsAnswer = true
			correctSpankAmount += 1
			isFakeSpank = false
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('spank')} {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('smack')} {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('hit')} {sub.your} rear!",
			"{dom.You} {dom.youVerb('deliver')} an impact on {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('make')} {sub.your} {butt} jiggle from a smack!",
			"{dom.You} {dom.youVerb('spank')} {sub.your} {butt} lightly!",
		])
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0})+0.3, 0.05, -0.1, -0.01)
		
		if(coverButtTimer > 0):
			coverButtTimer -= 1
			if(coverButtTimer <= 0):
				text += " {sub.YourHis} hands hurt too much to keep covering."
			else:
				text += " {sub.YourHis} hands softened the blow."
		else:
			subInfo.addPain(1)
			sendSexEvent(SexEvent.PainInflicted, domID, subID, {pain=1,isDefense=false,intentional=true})
		
		if(RNG.chance(50)):
			text += " "+getAssDescriptionAfterImpact(true)
		


		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0}, -0.5), 0.1, -0.2, 0.0)
		affectDom(domInfo.fetishScore({Fetish.Sadism: 0.5}, 0.5), 0.1, 0.0)
		
		subInfo.addArousalSex(max(0.0, subInfo.fetishScore({Fetish.Masochism: 0.1})+0.02))
		
		sendSexEvent(SexEvent.Spanked, domID, subID, {strongSpank=false, pain=(0 if coverButtTimer > 0 else 1)})
		
		return {
			text = text,
		}
	
	if(_id == "bigspank"):
		didBigSpankThisTime = true
		if(subShouldCount):
			if(awaitsAnswer):
				if(isFakeSpank):
					needToSayAvoidedTrap = true
				else:
					needToSayTooLate = true
			awaitsAnswer = true
			correctSpankAmount += 1
			isFakeSpank = false
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('spank')} {sub.your} {butt} [b]hard[/b]!",
			"{dom.You} {dom.youVerb('smack')} {sub.your} {butt} with [b]full force[/b]!",
			"{dom.You} {dom.youVerb('hit')} {sub.your} rear [b]sadistically[/b]!",
		])
		var damageDivider = 1
		if(coverButtTimer > 0):
			damageDivider = 2
			coverButtTimer -= 2
			if(coverButtTimer <= 0):
				text += " {sub.YourHis} hands hurt too much to keep covering."
			else:
				text += " {sub.YourHis} hands softened the blow."
		
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0}, -0.5), 0.1, -0.05, 0.0)
		affectDom(domInfo.fetishScore({Fetish.Sadism: 0.5}, 0.5), 0.2, 0.0)
		
		if(RNG.chance(50)):
			text += " "+getAssDescriptionAfterImpact(true)
		
		var addPain:int = int(round(10/damageDivider))
		subInfo.addPain(addPain)
		sendSexEvent(SexEvent.PainInflicted, domID, subID, {pain=addPain,isDefense=false,intentional=true})
		affectSub(subInfo.fetishScore({Fetish.Masochism: 1.0})-0.6, 0.05, -0.1, -0.01)
		affectDom(subInfo.fetishScore({Fetish.Sadism: 1.0})+0.3, 0.05, -0.01)
		
		subInfo.addArousalSex(max(0.0, subInfo.fetishScore({Fetish.Masochism: 0.2})+0.02))
		
		sendSexEvent(SexEvent.Spanked, domID, subID, {strongSpank=true, pain=addPain})
		
		return {
			text = text,
		}
	

func getSubActions():
	var actions = []
	if(state in ["", "rimming"]):
		actions.append({
			"id": "pullaway",
			"score": subInfo.getResistScore(),
			"name": "Pull away",
			"desc": "Try to pull away",
			"priority" : 0,
			"chance" : getSubResistChance(10.0, 5.0),
		})

	if(coverButtTimer <= 0 && !getSub().hasBoundArms()):
		actions.append({
			"id": "coverbutt",
			"score": 0.05-subInfo.fetishScore({Fetish.Masochism: 0.1}),
			"name": "Cover butt",
			"desc": "Try to avoid some of the pain",
			"priority" : 0,
		})

	if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
		actions.append({
			"id": "cum",
			"score": 1.0,
			"name": "Cum!",
			"desc": "You gonna cum.",
			"priority": 1001,
		})

	if(subShouldCount && awaitsAnswer):
		var answers = [correctSpankAmount]
		while(answers.size() < 3):
			var randomNumber = RNG.randi_range(Util.maxi(correctSpankAmount-3, 0), correctSpankAmount+3)
			if(!answers.has(randomNumber)):
				answers.append(randomNumber)
		answers.shuffle()
		
		for answer in answers:
			var isCorrect = (answer==correctSpankAmount)
			if(isFakeSpank):
				isCorrect = false
			var mult = 1.0
			if(isFakeSpank):
				mult *= max(0.05, subInfo.personalityScore({PersonalityStat.Naive: 0.2}))
			elif(!isCorrect):
				mult *= max(0.05, subInfo.personalityScore({PersonalityStat.Brat: 0.3}))
			actions.append({
				"id": ("correctnumber" if isCorrect else "badnumber"),
				"score": subInfo.getComplyScore() * mult,
				"name": str(answer),
				"args": [answer],
				"desc": "Say this",
				"priority" : 0,
			})

	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "cum"):
		getSub().cumOnFloor(domID)
		subInfo.cum()
		
		#satisfyGoals()
		sendSexEvent(SexEvent.UniqueOrgasm, domID, subID, {orgasmType="spank"})
		return getGenericSubOrgasmData()
	
	if(_id == "coverbutt"):
		coverButtTimer = 3
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('cover')} {sub.yourHis} {ass} with {sub.yourHis} hands.",
		])
		return {text=text}
	
	if(_id == "correctnumber"):
		correctTimer = 2
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('say')} the correct number.",
		])
		
		awaitsAnswer = false
		domInfo.addAnger(-0.1)
		
		var randomAddition = RNG.pick([
			"Ngh..",
			"I think..",
			"Agh..",
			"ARgh..",
			"Ow..",
			"Fuck..",
		])
		
		var domSay = null
		if(correctSpankAmount >= targetSpanks):
			satisfyGoals()
			if(!getDom().isPlayer()):
				domSay = RNG.pick([
					"Good job, that's enough.",
				])
				endActivity()
		
		return {
			text = text,
			subSay = str(correctSpankAmount)+"! "+randomAddition,
			domSay = domSay,
		}
	
	if(_id == "badnumber"):
		wrongTimer = 2
		var saidNumber = _actionInfo["args"][0]
		
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('say')} the [b]WRONG[/b] number!",
		])
		if(isFakeSpank):
			text = RNG.pick([
				"{sub.You} got fooled and said a number [b]without getting spanked[/b]!",
			])
		
		awaitsAnswer = false
		domInfo.addAnger(0.4)
		
		var randomAddition = RNG.pick([
			"Probably..",
			"I think.. wait..",
			"Agh.. No.. wait..",
			"ARgh.. Please..",
			"Ow.. Yeah?..",
			"Fuck.. Oh no..",
		])
		
		return {
			text = text,
			#domSay = domSay,
			subSay = str(saidNumber)+"! "+randomAddition,
		}
	
	if(_id == "pullaway"):
		var text = ""
		var domSay = null
		var subSay = null
		var successChance = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('pull')} away from {dom.you}.",
			])
			domInfo.addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				satisfyGoals()
				endActivity()
		else:
			text = RNG.pick([
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to pull away from {dom.your} hands.",
				"{sub.You} desperately {sub.youVerb('try', 'tries')} to pull away from {dom.your} hand.",
			])
			domInfo.addAnger(0.03)
		subSay = subReaction(SexReaction.Resisting, 50)
		return {
			text = text,
			domSay = domSay,
			subSay = subSay,
		}


func getRandomAnusWord():
	return RNG.pick(["back entrance", "anus", "tailhole"])
	
func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.7
	if(getSub().hasBoundArms()):
		theChance *= 0.7
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	if(getSub().hasBoundLegs()):
		theChance *= 0.5
	
	return max(theChance, 5.0)
	
func getDomOrgasmHandlePriority():
	return -1

func getSubOrgasmHandlePriority():
	return 5

func saveData():
	var data = .saveData()

	data["subShouldCount"] = subShouldCount
	data["correctSpankAmount"] = correctSpankAmount
	data["isFakeSpank"] = isFakeSpank
	data["awaitsAnswer"] = awaitsAnswer
	data["correctTimer"] = correctTimer
	data["wrongTimer"] = wrongTimer
	data["needToSayTooLate"] = needToSayTooLate
	data["needToSayAvoidedTrap"] = needToSayAvoidedTrap
	data["targetSpanks"] = targetSpanks
	data["coverButtTimer"] = coverButtTimer

	return data

func loadData(_data):
	.loadData(_data)

	subShouldCount = SAVE.loadVar(_data, "subShouldCount", false)
	correctSpankAmount = SAVE.loadVar(_data, "correctSpankAmount", 0)
	isFakeSpank = SAVE.loadVar(_data, "isFakeSpank", false)
	awaitsAnswer = SAVE.loadVar(_data, "awaitsAnswer", false)
	correctTimer = SAVE.loadVar(_data, "correctTimer", 0)
	wrongTimer = SAVE.loadVar(_data, "wrongTimer", 0)
	needToSayTooLate = SAVE.loadVar(_data, "needToSayTooLate", false)
	needToSayAvoidedTrap = SAVE.loadVar(_data, "needToSayAvoidedTrap", false)
	targetSpanks = SAVE.loadVar(_data, "targetSpanks", 0)
	coverButtTimer = SAVE.loadVar(_data, "coverButtTimer", 0)


func getAnimation():
	if(state == ""):
		if(didSpankThisTime):
			didSpankThisTime = false
			return [StageScene.Spanking, "spankonce", {pc=domID, npc=subID}]
		if(didBigSpankThisTime):
			didBigSpankThisTime = false
			return [StageScene.Spanking, "fastonce", {pc=domID, npc=subID}]
		
		return [StageScene.Spanking, "tease", {pc=domID, npc=subID}]
