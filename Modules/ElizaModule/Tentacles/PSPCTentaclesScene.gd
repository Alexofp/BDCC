extends SceneBase

var tentMood = ""
var firstPlay = false
var hasNeuro = false
var slaveID = ""

func _init():
	sceneID = "PSPCTentaclesScene"

func _reactInit():
	firstPlay = true

func resolveCustomCharacterName(_charID):
	if(_charID == "slave"):
		return slaveID

func _run():
	if(state == ""):
		addCharacter("PCTentacles")
		tentMood = getFlag("ElizaModule.tent_mood", "")
		hasNeuro = getFlag("ElizaModule.tent_neurolink", false)
		saynn("You approach {pcTentacles}.")

		if (tentMood == "mean"):
			playAnimation(StageScene.TentaclesDuo, "glare", {plant=true, instantSleep=firstPlay})
			saynn("It seems to be in a mean mood.")

		elif (tentMood == "kind"):
			playAnimation(StageScene.TentaclesStroke, RNG.pick(["tease", "stroke"]), {plant=true})
			saynn("It seems to be in a kind mood.")

		elif (tentMood == "lusty"):
			playAnimation(StageScene.TentaclesGrope, "tease", {plant=true})
			saynn("It seems to be in a lusty mood, idly groping you.")

		else:
			playAnimation(StageScene.TentaclesDuo, "idle", {plant=true, instantSleep=firstPlay})
			saynn("It seems to be in its usual mood.")

		firstPlay = false
		addButton("Submit", "(Sex) Submit to the tentacles and let them do whatever they want with you..", "doSubmit")
		if (GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves).size() <= 0):
			addDisabledButton("Offer slave", "You don't have any slaves at the moment..")
		else:
			addButton("Offer slave", "(Sex) Offer the tentacles one of your slaves for them to have fun with", "pick_slave_menu")
		addButton("Mood", "Interact with the tentacles to change their mood", "mood_menu")
		if (!hasNeuro):
			addDisabledButton("Neuro-link", "You need to unlock and create a neutro-link device in the bio-lab first..")
		addButton("Change name", "Change how you call the tentacles", "name_menu")
		addButton("Leave", "Leave the tentacles be", "endthescene")
	if(state == "name_menu"):
		saynn("How do you wanna name your tentacles?")

		addTentacleNameButtons()
		if (false):
			addButton("Ignore", "you shouldn't see this", "pick_name")
	if(state == "picked_name"):
		removeCharacter("PCTentacles")
		addCharacter("PCTentacles")
		saynn("[say=pc]I think.. {pcTentacles} is a good name for you.[/say]")

		saynn("The tendrils twitch as they hear you. Looks like they like this name.")

		addButton("Continue", "See what happens next", "")
	if(state == "doSubmit"):
		playAnimation(StageScene.TentaclesDuo, "glare", {plant=true, npcAction="kneel"})
		saynn("You approach {pcTentacles} and kneel in front of it.")

		saynn("As you do that, the many tendrils already begin reaching towards you and your body..")

		addButton("Continue", "See what happens next", "start_sex")
	if(state == "after_sex"):
		saynn("After that sex, you get up and step away from the tentacles..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "mood_menu"):
		saynn("What do you wanna do with the tentacles?")

		addButton("Pat", "Pat the tentacles to make them kind", "mood_pat")
		addButton("Slap", "Slap the tentacles to make them angry", "mood_slap")
		addButton("Tease", "Tease the tentacles to make them hungry for your holes..", "mood_tease")
		addButton("Just chat", "Chat with the tentacles to reset their mood", "mood_chat")
		addButton("Back", "You changed your mind", "")
	if(state == "mood_pat"):
		playAnimation(StageScene.TentaclesStroke, "fast", {plant=true})
		saynn("You approach {pcTentacles} and begin patting its tentacles!")

		saynn("The tendrils wiggle happily and lean into your pats, switching each other every few seconds.")

		addButton("Continue", "See what happens next", "")
	if(state == "mood_slap"):
		playAnimation(StageScene.TentaclesDuo, "whip", {plant=true, npcAction="shove"})
		saynn("You decide to slap {pcTentacles}, hitting one of its tendrils!")

		saynn("The tentacles recoil from your sudden attack.. and try to smack you back, their tips now glare at you.")

		addButton("Continue", "See what happens next", "")
	if(state == "mood_tease"):
		playAnimation(StageScene.TentaclesGrope, "grope", {plant=true})
		saynn("You wiggle your {pc.thick} butt in front of the tentacles.. and watch as their tips get all drippy and slick.")

		saynn("The many tendrils reach out to grope your body.")

		saynn("You let them do that for a bit.. before escaping their grasp.")

		addButton("Continue", "See what happens next", "")
	if(state == "mood_chat"):
		playAnimation(StageScene.TentaclesDuo, "idle", {plant=true})
		saynn("You just chat with the tentacles for a bit. You explain what this place is, how it works, things like that.")

		saynn("The tentacles don't seem to be able to answer.. but they seem to be listening and understanding most of it.")

		addButton("Continue", "See what happens next", "")
	if(state == "pick_slave_menu"):
		saynn("Which of your slaves do you want to be fucked by the tentacles?")

		addButton("Cancel", "You changed your mind", "endthescene")
		addSlaveButtons()
		if (false):
			addButton("Nope", "You shouldn't see this ever", "pick_slave")
	if(state == "confirm_pick_slave"):
		addCharacter(slaveID)
		playAnimation(StageScene.TentaclesGrope, "tease", {pc=slaveID, plant=true})
		saynn("You push {slave.name} into your tentacles!")

		saynn("The tendrils are quick to grab {slave.him}, about to have fun..")

		addButton("Continue", "Let the tentacles have fun with your slave on their own", "start_slave_sex")
		if (hasNeuro):
			addButton("Neuro-link", "Use the neuro-link device to control the tentacles while they're having fun with your slave", "start_slave_sex_neuro")
		else:
			addDisabledButton("Neuro-link", "You need to unlock and create a neutro-link device in the bio-lab first..")
	if(state == "after_sex_slave"):
		saynn("After that sex, you grab your slave and put {slave.him} back on a leash..")

		addButton("Continue", "See what happens next", "endthescene")
func addTentacleNameButtons():
	for theName in PlayerSlaveryTentacles.MONSTER_NAMES:
		addButton(theName, "Pick this name!", "pick_name", [theName])

func addSlaveButtons():
	var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
	for charID in slaves:
		var character:DynamicCharacter = getCharacter(charID)
		var npcSlavery:NpcSlave = character.getNpcSlavery()
		if(npcSlavery == null):
			continue
		if(npcSlavery.isDoingActivity()):
			addDisabledButton(character.getName(), "This slave is currently busy")
			continue
		addButton(character.getName(), character.getSmallDescription(), "pick_slave", [charID])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pick_name"):
		setFlag("ElizaModule.tent_name", _args[0])
		setState("picked_name")
		return

	if(_action == "start_sex"):
		getCharacter("PCTentacles").prepareForSex()
		runScene("GenericSexScene", ["PCTentacles", "pc", SexType.TentaclesSex, {}], "tentaclesSex")
		setState("after_sex")
		return

	if(_action == "mood_pat"):
		setFlag("ElizaModule.tent_mood", "kind")
		addMessage("The tentacles won't do anything mean anymore.")

	if(_action == "mood_slap"):
		setFlag("ElizaModule.tent_mood", "mean")
		addMessage("The tentacles will now act very mean during sex.")

	if(_action == "mood_tease"):
		setFlag("ElizaModule.tent_mood", "lusty")
		addMessage("The tentacles are now incredibly breed-hungry.")

	if(_action == "mood_chat"):
		setFlag("ElizaModule.tent_mood", "")
		addMessage("The tentacles now don't have any preference during sex.")

	if(_action == "pick_slave"):
		slaveID = _args[0]
		setState("confirm_pick_slave")
		return

	if(_action == "start_slave_sex"):
		getCharacter("PCTentacles").prepareForSex()
		runScene("GenericSexScene", ["PCTentacles", slaveID, SexType.TentaclesSex, {}], "tentaclesSexSlave")
		setState("after_sex_slave")
		return

	if(_action == "start_slave_sex_neuro"):
		getCharacter("PCTentacles").prepareForSex()
		runScene("GenericSexScene", ["PCTentacles", slaveID, SexType.TentaclesSex, {SexMod.PCControlsDoms:true}], "tentaclesSexSlaveNeuro")
		setState("after_sex_slave")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["tentMood"] = tentMood
	data["firstPlay"] = firstPlay
	data["hasNeuro"] = hasNeuro
	data["slaveID"] = slaveID

	return data

func loadData(data):
	.loadData(data)

	tentMood = SAVE.loadVar(data, "tentMood", "")
	firstPlay = SAVE.loadVar(data, "firstPlay", false)
	hasNeuro = SAVE.loadVar(data, "hasNeuro", false)
	slaveID = SAVE.loadVar(data, "slaveID", "")
