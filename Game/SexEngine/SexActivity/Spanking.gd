extends SexActivityBase

var didSpankThisTime:bool = false
var didBigSpankThisTime:bool = false

var subShouldCount:bool = false
var correctSpankAmount:int = 0

var isFakeSpank:bool = false
var awaitsAnswer:bool = false

var correctTimer:int = 0
var wrongTimer:int = 0

var needToSayTooLate:bool = false
var needToSayAvoidedTrap:bool = false

var targetSpanks:int = 0
var coverButtTimer:int = 0

func _init():
	id = "Spanking"
	
	activityName = "Spank"
	activityDesc = "Smack their butt!"
	activityCategory = ["Humiliate"]

func getGoals():
	return {
		SexGoal.SpankSub: 1.0,
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_domInfo.getChar().hasBlockedHands() || _domInfo.getChar().hasBoundArms()):
		return false
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed, SexActivityTag.HavingSex]
	if(_indx == SUB_0):
		return [SexActivityTag.AnusUsed, SexActivityTag.VaginaUsed, SexActivityTag.PenisUsed, SexActivityTag.HavingSex, SexActivityTag.PreventsSubTeasing]
	return []

func getCheckTagsSub() -> Array:
	return [SexActivityTag.AnusUsed, SexActivityTag.VaginaUsed, SexActivityTag.PenisUsed, SexActivityTag.HavingSex]

func startActivity(_args):
	targetSpanks = RNG.randi_range(5, 16)
	affectSub(getSubInfo().fetishScore({Fetish.Masochism: 1.0})+0.0, 0.1, -0.1, -0.01)
	addText("{dom.You} {dom.youVerb('prepare')} to spank {sub.you}.")
	talkText(DOM_0, RNG.pick([
		"Give me that {butt}.",
		"I think you were a bad {sub.boy}.",
		"Shut up and stick that {butt} up.",
		"Don't cover yourself up.",
		"Don't you dare cover yourself up.",
	]))

func init_processTurn():
	var text:String = ""
	var domSay:String = ""
	
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
			getDomInfo().addAnger(0.3)
			domSay = RNG.pick([
				"How are you this bad at counting?",
				"Time's up!",
				"Think faster!",
			])
	
	if(text != ""):
		addText(text)
	if(domSay != ""):
		talkText(DOM_0, domSay)


func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop spanking", "Stop spanking them")
		if(state in [""]):
			addAction("fakespank", 0.4-getDomInfo().getAngerScore()/3.0, "Rub butt", "Rub that butt lightly and see if they react")
			addAction("spank", 1.0-getDomInfo().getAngerScore()/1.2, "Spank", "Spank that sub once")
			addAction("bigspank", getDomInfo().getAngerScore(), "Hard Spank!", "Spank that sub hard")
		if(!subShouldCount):
			addAction("startcount", 1.0, "Make sub count", "Make sub count the spanks")
		else:
			addAction("stopcount", 0.0, "Stop counting", "Enough spank counting")
	
	if(_indx == SUB_0):
		if(state in ["", "rimming"]):
			addAction("pullaway", getResistScore(SUB_0), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(10.0, 5.0)})

		if(coverButtTimer <= 0 && !getSub().hasBoundArms()):
			addAction("coverbutt", 0.05-fetish(SUB_0, Fetish.Masochism)*0.1, "Cover butt", "Try to avoid some of the pain")

		if(isReadyToCumHandled(SUB_0)):
			addAction("cum", 1.0, "Cum!", "You gonna cum.", {A_PRIORITY: 1001})

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
					mult *= max(0.05, getSubInfo().personalityScore({PersonalityStat.Naive: 0.2}))
				elif(!isCorrect):
					mult *= max(0.05, getSubInfo().personalityScore({PersonalityStat.Brat: 0.3}))
				addAction(("correctnumber" if isCorrect else "badnumber"), getComplyScore(SUB_0) * mult, str(answer), "Say this", {A_ARGS: [answer]})

func getAssDescriptionAfterImpact(_isHard:bool=false) -> String:
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

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stop"):
		addText("{dom.You} {dom.youVerb('stop')} the spanking session with {sub.you}.")
		endActivity()
		return
	if(_id == "startcount"):
		subShouldCount = true
		correctTimer = 0
		wrongTimer = 0
		correctSpankAmount = 0
		
		var text:String = RNG.pick([
			"{dom.You} {dom.youVerb('tell')} {sub.you} to start counting the spanks.",
		])
		var addSay:String = ""
		if(!getDom().isPlayer()):
			addSay = " I will stop at "+str(targetSpanks)+" spanks."
		
		addText(text)
		talkText(DOM_0, "Count how many time I hit your ass."+addSay)
		return
	if(_id == "stopcount"):
		subShouldCount = false
		correctTimer = 0
		wrongTimer = 0
		correctSpankAmount = 0
		awaitsAnswer = false
		needToSayAvoidedTrap = false
		needToSayTooLate = false
		
		addText("{dom.You} {dom.youVerb('tell')} {sub.you} to stop counting the spanks.")
		talkText(DOM_0, "You may stop counting.")
		return
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
		
		addTextPick([
			"{dom.You} {dom.youVerb('rub')} {sub.your} {butt}!",
			"{dom.You} gently {dom.youVerb('rub')} {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('caress', 'caresses')} {sub.your} rear!",
			"{dom.You} {dom.youVerb('brush', 'brushes')} {dom.yourHis} palm against {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('poke')} {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('touch', 'touches')} {sub.your} {butt} lightly!",
		])
		
		affectSub(getSubInfo().fetishScore({Fetish.Masochism: 1.0})+0.6, 0.1, -0.01, -0.01)
		
		if(RNG.chance(50)):
			addText(getAssDescriptionAfterImpact(true))
		
		#getSubInfo().addPain(1)
		#affectSub(getSubInfo().fetishScore({Fetish.Masochism: 1.0})-0.3, 0.05, -0.1, -0.01)
		#affectDom(getSubInfo().fetishScore({Fetish.Sadism: 1.0})+0.3, 0.05, -0.01)
		
		return
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
		
		var text:String = RNG.pick([
			"{dom.You} {dom.youVerb('spank')} {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('smack')} {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('hit')} {sub.your} rear!",
			"{dom.You} {dom.youVerb('deliver')} an impact on {sub.your} {butt}!",
			"{dom.You} {dom.youVerb('make')} {sub.your} {butt} jiggle from a smack!",
			"{dom.You} {dom.youVerb('spank')} {sub.your} {butt} lightly!",
		])
		affectSub(getSubInfo().fetishScore({Fetish.Masochism: 1.0})+0.3, 0.05, -0.1, -0.01)
		
		if(coverButtTimer > 0):
			coverButtTimer -= 1
			if(coverButtTimer <= 0):
				text += " {sub.YourHis} hands hurt too much to keep covering."
			else:
				text += " {sub.YourHis} hands softened the blow."
		else:
			getSubInfo().addPain(1)
			sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=1,isDefense=false,intentional=true})
		
		if(RNG.chance(50)):
			text += " "+getAssDescriptionAfterImpact(true)
		
		affectSub(getSubInfo().fetishScore({Fetish.Masochism: 1.0}, -0.5), 0.1, -0.2, 0.0)
		affectDom(getDomInfo().fetishScore({Fetish.Sadism: 0.5}, 0.5), 0.1, 0.0)
		
		getSubInfo().addArousalSex(max(0.0, getSubInfo().fetishScore({Fetish.Masochism: 0.1})+0.02))
		
		sendSexEvent(SexEvent.Spanked, DOM_0, SUB_0, {strongSpank=false, pain=(0 if coverButtTimer > 0 else 1)})
		
		addText(text)
		return
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
		
		var text:String = RNG.pick([
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
		
		affectSub(getSubInfo().fetishScore({Fetish.Masochism: 1.0}, -0.5), 0.1, -0.05, 0.0)
		affectDom(getDomInfo().fetishScore({Fetish.Sadism: 0.5}, 0.5), 0.2, 0.0)
		
		if(RNG.chance(50)):
			text += " "+getAssDescriptionAfterImpact(true)
		
		var addPain:int = int(round(10/damageDivider))
		getSubInfo().addPain(addPain)
		sendSexEvent(SexEvent.PainInflicted, DOM_0, SUB_0, {pain=addPain,isDefense=false,intentional=true})
		affectSub(getSubInfo().fetishScore({Fetish.Masochism: 1.0})-0.6, 0.05, -0.1, -0.01)
		affectDom(getSubInfo().fetishScore({Fetish.Sadism: 1.0})+0.3, 0.05, -0.01)
		
		getSubInfo().addArousalSex(max(0.0, getSubInfo().fetishScore({Fetish.Masochism: 0.2})+0.02))
		
		sendSexEvent(SexEvent.Spanked, DOM_0, SUB_0, {strongSpank=true, pain=addPain})
		
		addText(text)
		return

	if(_id == "cum"):
		getSub().cumOnFloor(getDomID())
		getSubInfo().cum()
		
		#satisfyGoals()
		sendSexEvent(SexEvent.UniqueOrgasm, DOM_0, SUB_0, {orgasmType="spank"})
		addGenericOrgasmText(SUB_0)
		return
	if(_id == "coverbutt"):
		coverButtTimer = 3
		addText("{sub.You} {sub.youVerb('cover')} {sub.yourHis} {ass} with {sub.yourHis} hands.")
		return
	if(_id == "correctnumber"):
		correctTimer = 2
		var text:String = RNG.pick([
			"{sub.You} {sub.youVerb('say')} the correct number.",
		])
		
		awaitsAnswer = false
		getDomInfo().addAnger(-0.1)
		
		var randomAddition:String = RNG.pick([
			"Ngh..",
			"I think..",
			"Agh..",
			"ARgh..",
			"Ow..",
			"Fuck..",
		])
		
		var domSay:String = ""
		if(correctSpankAmount >= targetSpanks):
			satisfyGoals()
			if(!getDom().isPlayer()):
				domSay = RNG.pick([
					"Good job, that's enough.",
				])
				endActivity()
		
		addText(text)
		talkText(SUB_0, str(correctSpankAmount)+"! "+randomAddition)
		talkText(DOM_0, domSay)
		return
	if(_id == "badnumber"):
		wrongTimer = 2
		var saidNumber = _action["args"][0]
		
		var text:String = RNG.pick([
			"{sub.You} {sub.youVerb('say')} the [b]WRONG[/b] number!",
		])
		if(isFakeSpank):
			text = RNG.pick([
				"{sub.You} got fooled and said a number [b]without getting spanked[/b]!",
			])
		
		awaitsAnswer = false
		getDomInfo().addAnger(0.4)
		
		var randomAddition = RNG.pick([
			"Probably..",
			"I think.. wait..",
			"Agh.. No.. wait..",
			"ARgh.. Please..",
			"Ow.. Yeah?..",
			"Fuck.. Oh no..",
		])
		
		addText(text)
		talkText(SUB_0, str(saidNumber)+"! "+randomAddition)
		#talkText(DOM_0, "Wrong!")
		return
	if(_id == "pullaway"):
		var text:String = ""
		var successChance = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			text = RNG.pick([
				"{sub.You} {sub.youVerb('pull')} away from {dom.you}.",
			])
			getDomInfo().addAnger(0.3)
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
			getDomInfo().addAnger(0.03)
		addText(text)
		reactSub(SexReaction.Resisting, [50])
		return

func getRandomAnusWord() -> String:
	return RNG.pick(["back entrance", "anus", "tailhole"])
	
func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.7
	if(getSub().hasBoundArms()):
		theChance *= 0.7
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	if(getSub().hasBoundLegs()):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == SUB_0):
		return 5
	return -1

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
			return [StageScene.Spanking, "spankonce", {pc=DOM_0, npc=SUB_0}]
		if(didBigSpankThisTime):
			didBigSpankThisTime = false
			return [StageScene.Spanking, "fastonce", {pc=DOM_0, npc=SUB_0}]
		
		return [StageScene.Spanking, "tease", {pc=DOM_0, npc=SUB_0}]
