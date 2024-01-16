extends "res://Scenes/SceneBase.gd"

var npcID = ""
var sawBefore = false
var npcVariation = ""

func _init():
	sceneID = "StocksWillingDynNpcScene"

func _initScene(_args = []):
	npcID = _args[0]
	var npc = GlobalRegistry.getCharacter(npcID)
	
	if(npc.getFlag(CharacterFlag.Introduced)):
		sawBefore = true
	else:
		npc.setFlag(CharacterFlag.Introduced, true)
	
	var personality:Personality = npc.getPersonality()
	if(personality.getStat(PersonalityStat.Mean) > 0.3 || personality.getStat(PersonalityStat.Subby) < -0.6):
		npcVariation = "mean"
	if(personality.getStat(PersonalityStat.Mean) < -0.3):
		npcVariation = "kind"
	if(personality.getStat(PersonalityStat.Subby) > 0.6 || personality.getStat(PersonalityStat.Coward) > 0.8):
		npcVariation = "subby"
	
func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.StocksSexOral, "tease", {npc=npcID})

	if(state == ""):
		saynn(RNG.pick([
			"{npc.name} walks up to the stocks. {npc.He} is clearly interested in your.. offerings.",
			"{npc.name} approaches you. {npc.His} eyes are checking you out quite thoroughly.",
		]))

		if(npcVariation == "mean"):
			if(!sawBefore):
				saynn(RNG.pick([
					"[say=npc]Fuck yeah, another bitch got put into stocks. Gonna be willing?[/say]",
					"[say=npc]I see a bitch that needs some punishing. Right?[/say]",
					"[say=npc]Look at that, the slut got caught. I should punish you.[/say]",
				]))
			else:
				saynn(RNG.pick([
					"[say=npc]I remember that slutty ass. Gonna be willing?[/say]",
					"[say=npc]Bitches like you need to be punished more. Huh?[/say]",
					"[say=npc]Look at that, the slut got caught again. I should punish you.[/say]",
				]))
		elif(npcVariation == "kind"):
			if(!sawBefore):
				saynn(RNG.pick([
					"[say=npc]Hey there. Mind if I.. use you?[/say]",
					"[say=npc]Seems you did something bad. Might I do something with you?[/say]",
					"[say=npc]Hey, I’m kinda horny. May I?[/say]",
				]))
			else:
				saynn(RNG.pick([
					"[say=npc]Oh, I know you. Mind if I.. use you?[/say]",
					"[say=npc]I remember you. Might I do something with you?[/say]",
					"[say=npc]Hello friend. I’m kinda horny. May I?[/say]",
				]))
		elif(npcVariation == "subby"):
			if(!sawBefore):
				saynn(RNG.pick([
					"[say=npc]Oh hi.. Can I..?[/say]",
					"[say=npc]I know I shouldn’t ask.. But can I?..[/say]",
					"[say=npc]You seem like you need to be punished.. Can I do that maybe?..[/say]",
				]))
			else:
				saynn(RNG.pick([
					"[say=npc]Oh, it’s you.. can I maybe..?[/say]",
					"[say=npc]I kinda wanna play with you a little.. May I?..[/say]",
					"[say=npc]Can I maybe play with you a little?..[/say]",
				]))
		else:
			if(!sawBefore):
				saynn(RNG.pick([
					"[say=npc]Can I offer you a fun time?[/say]",
					"[say=npc]You seem quite exposed. Want me to fuck with you a little?[/say]",
					"[say=npc]Seems you did some bad things. Wonder if I should fuck you.[/say]",
				]))
			else:
				saynn(RNG.pick([
					"[say=npc]Oh, I remember that butt. I’d fuck it again.[/say]",
					"[say=npc]Hi there. Familiar face. And butt. Wonder if I should screw with you.[/say]",
					"[say=npc]Can I offer you a fun time?[/say]",
				]))

		addButton("Nod", "Let them do it", "startsexsubby")
		addButton("Shake head", "Maybe they will spare you", "shake_head")

	if(state == "shake_head_success"):
		saynn(RNG.pick([
			"You shake your head as best as the stocks allow. The person deliberates but decides to leave instead of forcing you.",
		]))
		
		addButton("Continue", "See what happens next", "endthescene")

	if(state == "shake_head_fail"):
		saynn("You shake your head as best as the stocks allow.")
		
		saynn(RNG.pick([
			"[say=npc]Well too bad. I’m too horny.[/say]",
			"[say=npc]Your no sounded too fake for me. Don’t mind me.[/say]",
			"[say=npc]No? What if I do it anyway?[/say]",
			"[say=npc]I don’t take no for an answer, slut.[/say]",
			"[say=npc]It’s not like you can stop me.[/say]",
		]))
		
		addButton("Get fucked", "Well, what can you do", "startsexsubby")

	if(state == "after_sex"):
		saynn("After that, {npc.he} just leaves you alone, still trapped in stocks.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "startsexsubby"):
		getCharacter(npcID).prepareForSexAsDom()
		GlobalRegistry.getCharacter(npcID).addPain(-50)
		runScene("GenericSexScene", [npcID, "pc", SexType.StocksSex], "subbysex")

	if(_action == "shake_head"):
		if(npcVariation in ["subby", "kind"]):
			setState("shake_head_success")
			return
		
		if(npcVariation == "mean" && RNG.chance(50)):
			setState("shake_head_fail")
		elif(RNG.chance(25)):
			setState("shake_head_fail")
		else:
			setState("shake_head_success")
		return

	setState(_action)


func _react_scene_end(_tag, _result):
	if(_tag in ["subbysex", "domsex"]):
		setState("after_sex")
	
			
func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["sawBefore"] = sawBefore
	data["npcVariation"] = npcVariation
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	sawBefore = SAVE.loadVar(data, "sawBefore", false)
	npcVariation = SAVE.loadVar(data, "npcVariation", "")
