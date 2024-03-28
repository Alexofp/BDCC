extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _reactInit():
	npc.getNpcSlavery().addTired(1)
	if(!GM.pc.hasEffect(StatusEffect.Yoga)):
		npc.getNpcSlavery().addExperience(10)
	GM.pc.addEffect(StatusEffect.Yoga)

func _init():
	sceneID = "ActionSlaverySubMassageToPC"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Massage, "back", {pc=npcID, npc="pc"})
		
		saynn("You instruct your submissive to give you a back massage before laying down on your inmate bed.")
		
		saynn("[say=npc]Yes, {npc.pcOwner}.[/say]")
		
		saynn("Without hesitation, {npc.he} obediently complies, sitting nearby. As {npc.heShe} starts to knead your shoulders with a tender touch, you feel a wave of warmth spreading through them.")
		
		saynn("[say=npc]"+RNG.pick([
			"Let's see.. Wow. Your shoulders feel so strong.. under my hands.",
			"Here we go. Hah.. Your shoulders can carry the world.. Let me lighten that load a bit.",
			"Let's start.. Your shoulders are my favorite place. I could get used to this..",
		])+"[/say]")
		
		saynn("After removing any tension from your shoulders, your sub’s hands glide over your {pc.masc} back, following and caressing the curves at a slow, relaxing pace.")
		
		saynn("[say=npc]"+RNG.pick([
			"These curves, they're intoxicating. I could drown in them, happily.",
			"Feels nice, eh? Your back could make anyone jealous. Lucky me, right here.",
			"Great back, lets get all the tension out of it..",
		])+"[/say]")
		
		saynn("You can’t help but to moan softly, the gentle touch coupled with {npc.his} words feel quite good.")
		
		saynn("This massage has warmed up your back the same way a yoga session would!")
		
		addButton("Continue", "See what happens next", "endthescene")
		if(npc.getNpcSlavery().getSlaveSkill(SlaveType.Submissive) >= 11):
			addButton("Butt massage", "Order them to massage your butt too", "butt_massage")
		else:
			addDisabledButton("Butt massage", "Requires submissive skill at least A")

	if(state == "butt_massage"):
		playAnimation(StageScene.Massage, "butt", {pc=npcID, npc="pc"})
		
		saynn("You ask your submissive to continue. And so {npc.his} hands venture lower, gently caressing your buttocks with a sensuality that sends shivers down your spine.")
		
		saynn("[say=npc]"+RNG.pick([
			"Your butt's a real treat, you know that, {npc.pcOwner}?",
			"Feels good to give it a little love. So soft and firm at the same time.",
			"Thank you for letting me massage your butt, {npc.pcOwner}, it feels nice.",
		])+"[/say]")
		
		saynn("As {npc.he} works to remove the tension from your muscles, you find yourself lost in the sensations.")
		
		saynn("By the end of it, you feel quite energized.")
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "butt_massage"):
		processTime(10*60)
		if(npc.getNpcSlavery().getSlaveSkill(SlaveType.Submissive) >= 15):
			GM.pc.addEffect(StatusEffect.WorkOut)
		else:
			GM.pc.addEffect(StatusEffect.WorkOutLight)
		GM.pc.addStamina(100)
		npc.getNpcSlavery().addTired(1)
		
	
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
