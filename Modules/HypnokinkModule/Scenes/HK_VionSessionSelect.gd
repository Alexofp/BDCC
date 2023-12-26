extends SceneBase

const SessionCooldownTime = 8*60*60

const SessionCostMap = {
	HK_Sessions.BodySessionZero: 1,
	HK_Sessions.BodyStaminaRestore: 3,
	HK_Sessions.BodyDodgeBuff: 3,
	HK_Sessions.BodyMaxPainBuff: 3,
	HK_Sessions.BodyBondage: 5
	}

func _init():
	sceneID = "VionSessionSelect"

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "stand", {npc="vion"})
		
		saynn("[say=pc]I'm up for a session.[/say]")
		
		if(onCooldown()):
			saynn("[say=vion]Not yet you aren't. Give your head some time to settle.[/say]")
		else:
			saynn("[say=vion]What did you have in mind?[/say]")
		
		addSessionButton("Session zero", "An introductory session", HK_Sessions.BodySessionZero)
		addSessionButton("Relaxation", "Drift in peace for a while", HK_Sessions.BodyStaminaRestore)
		addSessionButton("Tension relief", "Relieve tension and become more flexible", HK_Sessions.BodyDodgeBuff)
		addSessionButton("Pain tolerance", "Increase your pain tolerance", HK_Sessions.BodyMaxPainBuff)
		addSessionButton("Bondage", "Experience a bondage scenario in the safety of your own mind", HK_Sessions.BodyBondage)

		addButton("Nevermind", "Changed your mind about changing your mind", "endthescene")
		# (scene ends)

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	runSessionScene(_action)
	return

	#setState(_action)

func addSessionButton(name: String, desc: String, sessionId: String):
	if(GM.pc.isBlindfolded()):
		addDisabledButton(name, desc + "\n\nYou can't participate while blindfolded")
		return
	if(GM.pc.isGagged()):
		addDisabledButton(name, desc + "\n\nYou can't participate while gagged")
		return
	if(GM.pc.hasBoundArms() or GM.pc.hasBoundLegs()):
		addDisabledButton(name, desc + "\n\nYou can't participate while restrained")
		return
	if(getFlag("HypnokinkModule.DidSessionZero") || sessionId == HK_Sessions.BodySessionZero):
		if(onCooldown()):
			addDisabledButton(name, desc + "\n\nIt's too soon since the last session")
			return
		if(!canAfford(sessionId)):
			addDisabledButton(name, desc + "\n\n" + getCostString(sessionId))
			return
		addButton(name, desc+ "\n\n" + getCostString(sessionId), sessionId)
		return
	else:
		addDisabledButton(name, "Do Session Zero first")
		return
		
func onCooldown() -> bool:
	return (getFlag("HypnokinkModule.LastSessionTime", -24*60*60) + SessionCooldownTime) > (GM.main.timeOfDay + (GM.main.currentDay * 24*60*60))

func getCostString(bodyId: String) -> String:
	if(getFlag("HypnokinkModule.FreebieSessionSample", true)):
		return "First one is free"
	elif(getFlag("HypnokinkModule.RushSubdued", false)):
		return "Your sessions are on the house"
	elif(getFlag("HypnokinkModule.OnTheHouseSessions", 0) > 0):
		var freebies = getFlag("HypnokinkModule.OnTheHouseSessions")
		return "You have "+str(freebies)+" free " + ("sessions" if freebies > 1 else "session") + " remaining"
	else:
		return str(SessionCostMap[bodyId]) + (" credits" if SessionCostMap[bodyId] != 1 else " credit")

func purchase(bodyId: String):
	if(getFlag("HypnokinkModule.RushSubdued", false)):
		return
	if(getFlag("HypnokinkModule.FreebieSessionSample", true)):
		setFlag("HypnokinkModule.FreebieSessionSample", false)
		return
	elif(getFlag("HypnokinkModule.OnTheHouseSessions", 0) > 0):
		setFlag("HypnokinkModule.OnTheHouseSessions", getFlag("HypnokinkModule.OnTheHouseSessions") - 1)
		return
	else:
		GM.pc.addCredits(-SessionCostMap[bodyId])
		return

func canAfford(bodyId: String) -> bool:
	if(getFlag("HypnokinkModule.FreebieSessionSample", true)):
		return true
	elif(getFlag("HypnokinkModule.OnTheHouseSessions", 0) > 0):
		return true
	elif(GM.pc.getCredits() >= SessionCostMap[bodyId]):
		return true
	return false
	
func runSessionScene(sessionId: String):
	purchase(sessionId)
	endScene()
	runScene(pickInduction(), [sessionId])
	
func pickInduction():
	if(!getFlag("HypnokinkModule.DidSessionZero")):
		return HK_Sessions.InductionFirstTime
		
	if(HypnokinkUtil.isHypnotized(GM.pc)):
		return HK_Sessions.InductionAlreadyHypnotized
	
	var pool = [
		HK_Sessions.InductionFlashlight,
		HK_Sessions.InductionPendulum
	]	
	
	if(GM.pc.getSkillLevel(Skill.Hypnosis) >= 2):
		pool.append(HK_Sessions.InductionRapid)
	
	var pick = RNG.pick(pool)
	return pick
