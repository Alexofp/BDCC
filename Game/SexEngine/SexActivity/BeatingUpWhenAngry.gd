extends SexActivityBase

var ticks:int = 0

func _init():
	id = "BeatingUpWhenAngry"
	
	activityName = "Beat up"
	activityDesc = "Start hitting them!"
	activityCategory = ["Violence"]

func getGoals():
	return {
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
		SexType.BitchsuitSex: true,
		SexType.TentaclesSex: true,
	}

func canStopSexWithThisActivity() -> bool:
	return true

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_subInfo.isUnconscious()):
		return -1.0
	var theScore:float = _domInfo.getIsAngryScore() * 1.0 * max(0.1, 0.1 + _domInfo.personalityScore({PersonalityStat.Mean: 1.0})) - _subInfo.getAboutToPassOutScore() * _domInfo.fetishScore({Fetish.UnconsciousSex: -1.0})
	return min(theScore, 0.2)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed]
	return []

func startActivity(_args):
	if(isTentaclesSex()):
		addText("The angry tentacles begin whipping {sub.you}!")
	else:
		addText("{dom.You} {dom.youVerb('start')} beating {sub.you} up!")
	react(SexReaction.AboutToBeatUp)

func init_processTurn():
	ticks += 1
	strike(DOM_0, SUB_0, STRIKE_NORMAL)
	
	var texts:Array = [
		"{dom.You} {dom.youVerb('punch', 'punches')} {sub.youHim}.",
		"{dom.You} {dom.youVerb('punch', 'punches')} {sub.youHim} violently.",
		"{dom.You} {dom.youVerb('punch', 'punches')} {sub.yourHis} jaw.",
		"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.youHim}.",
		"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.youHim} helpless.",
		"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.yourHis} neck.",
		"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.yourHis} back.",
		"{dom.You} {dom.youVerb('pull')} on {sub.yourHis} hair.",
	]
	if(getSexType() == SexType.SlutwallSex):
		texts = [
			"{dom.You} {dom.youVerb('punch', 'punches')} {sub.youHim}.",
			"{dom.You} {dom.youVerb('punch', 'punches')} {sub.youHim} violently.",
			"{dom.You} {dom.youVerb('squeeze', 'squeezes')} {sub.yourHis} ass painfully.",
			"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.youHim}.",
			"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.youHim} helpless.",
			"{dom.You} {dom.youVerb('scratch', 'scratches')} {sub.yourHis} thighs.",
		]
	elif(getSexType() == SexType.TentaclesSex):
		texts = [
			"A tentacle whips {sub.youHim}.",
			"A tentacle strikes {sub.yourHis} chest.",
			"A tentacle lashes {sub.yourHis} back.",
			"A tentacle whips {sub.yourHis} legs.",
			"Tentacles slap and strike {sub.youHim}.",
			"A tentacle lashes {sub.yourHis} shoulders.",
			"Tentacles whip {sub.youHim} violently.",
			"A tentacle strikes {sub.yourHis} belly.",
			"A tentacle whips {sub.yourHis} arms.",
		]
	
	var text:Array = []
	var amount = RNG.randi_range(1, Util.mini(3, texts.size()))
	for _i in range(amount):
		text.append(RNG.grab(texts))
	
	if(RNG.chance(1)):
		var damageText := damageClothes(SUB_0)
		if(damageText != ""):
			text.append(damageText)
			
	addText(Util.join(text, " "))
	react(SexReaction.BeatingUp, [30.0, 30.0])

func getActions(_indx:int):
	if(_indx == DOM_0):
		var stopScore:float = 1.0 - getDomInfo().getIsAngryScore() + getSubInfo().getAboutToPassOutScore() * fetish(DOM_0, Fetish.UnconsciousSex, 0.5)
		if(ticks < 2):
			stopScore *= 0.1
		addAction("stop", stopScore, "Stop beating up", "Enough violence")
		var hitHardScore:float = getDomInfo().getIsAngryScore()*fetish(DOM_0, Fetish.Masochism)*0.4 - getSubInfo().getAboutToPassOutScore() * fetish(DOM_0, Fetish.UnconsciousSex, 0.5)
		addAction("hithard", hitHardScore, "Hit really hard", "Make that bitch regret it")

func doAction(_indx:int, _actionID:String, _action:Dictionary):
	if(_actionID == "stop"):
		endActivity()
		if(isTentaclesSex()):
			addText("The tentacles have stopped whipping {sub.you}.")
		else:
			addText("{dom.You} {dom.youVerb('have', 'has')} stopped beating {sub.you} up.")
	
	if(_actionID == "hithard"):
		strike(DOM_0, SUB_0, STRIKE_FULLFORCE)
		
		var text:String
		if(isTentaclesSex()):
			text = RNG.pick([
				"A thick tentacle whips across {sub.your} body [b]really hard[/b].",
				"The tentacles slam {sub.youHim} against the floor [b]really hard[/b].",
				"A tentacle strikes {sub.youHim} [b]really hard[/b]."
			])
		else:
			text = RNG.pick([
				"{dom.You} {dom.youVerb('hit')} {sub.youHim} [b]really hard[/b].",
				"{dom.You} {dom.youVerb('slam')} {sub.youHim} against the wall [b]really hard[/b].",
				"{dom.You} {dom.youVerb('punch', 'punches')} {sub.youHim} [b]really hard[/b].",
			])
		
		if(RNG.chance(33)):
			var damageText := damageClothes(SUB_0)
			if(damageText != ""):
				text += " "+(damageText)
		
		addText(text)
		react(SexReaction.BeatingUpHard, [100.0, 40.0])
		if(RNG.chance(50)):
			doWound(DOM_0, SUB_0)

func saveData():
	var data = .saveData()
	
	data["ticks"] = ticks

	return data
	
func loadData(data):
	.loadData(data)
	
	ticks = SAVE.loadVar(data, "ticks", 0)
