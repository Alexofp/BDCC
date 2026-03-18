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
			if (GM.pc.getInventory().hasItemID("TentNeuroLink")):
				addButton("Neuro-Link", "Inject the tentacles with the Neuro-Link chip", "doInjectNeuro")
			else:
				addDisabledButton("Neuro-Link", "You need to unlock and create a Neuro-Link chip in the bio-lab first..")
		addButton("Change name", "Change how you call the tentacles", "name_menu")
		addButton("Leave", "Leave the tentacles be", "endthescene")
	if(state == "doInjectNeuro"):
		playAnimation(StageScene.TentaclesDuo, "glare", {plant=true})
		saynn("You approach {pcTentacles}, trying to keep the injector out of sight.")

		saynn("But it still looks like it is suspecting something. The green tips are all glaring at you. So you decide to just show the injector and explain what it does.")

		saynn("[say=pc]This.. This is an upgrade for you. It will.. expand the horizons of what's possible.[/say]")

		saynn("You get a little closer and attempt to inject one of the tendrils.. but it is quick to dodge out of the way and smack you away.")

		saynn("It clearly doesn't trust you.")

		saynn("[say=pc]Fine.. It will apparently let me control you temporarily. That's the truth. I think it sounds fun, doesn't it?[/say]")

		saynn("The tentacles all look at each other, silently deliberating.")

		saynn("[say=pc]What do you think? I can promise not to abuse this power.. if it will even work at all.[/say]")

		saynn("Most of the tentacles focus on the main, the most thick, tendril. It stays still for a few seconds, watching you. For some reason, you feel.. warmth.. spreading, starting from your head.")

		saynn("The tentacle.. it's reading your mind? It's probably scanning it to figure out your intentions.")

		saynn("As it does it.. the green tips get all drippy and wet.. much more than before.")

		saynn("The thick tentacle slowly reaches towards you. It stops near your head.. and does a small nod.")

		saynn("It knows what you're gonna do.")

		saynn("Slowly, you bring the injector up to it.. and inject it, the tool making a quiet hissing noise.")

		saynn("After you've done that.. you realize that the injector still has something in it. Oh yeah, the receiver.")

		saynn("You've gone this far.. might as well finish it.")

		saynn("You bring the injector up to the back of your neck.. and inject yourself next.")

		saynn("For a moment, nothing happens.")

		saynn("And then.. the whole world splinters.")

		saynn("You feel a throbbing headache that's unlike anything you've ever felt before. It's like your mind is expanding.. but way too fast for your likings. You stagger, catching yourself against the wall. Your vision gets all blurry.. you senses begin to see colors that don't exist.. sounds that don't make any sense..")

		saynn("[say=pc]Argh..[/say]")

		saynn("It stays like that for about a minute.. but eventually the pain subsides and your cell comes back into focus.")

		saynn("The tentacles are watching you, their tips curious.")

		saynn("[say=PCTentacles]Do you hear us?[/say]")

		saynn("What? Oh wow.")

		saynn("[say=pc]Yeah.. I think so.[/say]")

		saynn("[say=PCTentacles]Good. But do you feel us?[/say]")

		saynn("You blink and think about it for a second.")

		saynn("Oh.")

		saynn("You feel a calm breeze. But it's not touching you.. it's touching the extension of you. You realize that you can feel each individual tendril. They're all there.. in the back of your mind.")

		saynn("You think about lifting the thick tentacle up.. And, without any conscious effort, it does so.")

		saynn("You think about releasing it. And so it obeys.")

		saynn("You reach one of the tentacles forward and touch yourself, the tip brushing against the bottom of your chin. It's a surreal feeling.. you feel both touches.")

		saynn("[say=pc]I can control you.. I can actually control you. I can make you do anything.[/say]")

		saynn("[say=PCTentacles]You can. But you won't.[/say]")

		saynn("Right.. You gotta control yourself too.")

		saynn("[say=pc]Are you able to take control over me?[/say]")

		saynn("[say=PCTentacles]We might be able to. But we won't. Because we are grateful. Without you, there won't be us.[/say]")

		saynn("You close your eyes and focus. And there they are.. the many minds of the tentacles.. their thoughts. Curiosity. Affection. Trust.. Hunger.")

		saynn("[say=pc]So.. Can I control you when I bring some-..[/say]")

		saynn("[say=PCTentacles]Please, be our guest. We wish to impregnate as many lifeforms of your kind as possible.[/say]")

		saynn("They sure are horny fuckers.")

		if (getFlag("ElizaModule.tent_eliza")):
			saynn("[say=PCTentacles]And thank you for offering us.. Eliza.. that is her name. Right. She was a great host for our eggs, we thoroughly enjoyed her company.[/say]")

			saynn("You nod.")

			saynn("[say=pc]For her it was more of a.. acquired taste.. it seems.[/say]")

		saynn("And just like that.. you all learned something new.")

		addButton("Continue", "See what happens next", "")
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
			addButton("Neuro-Link", "Use the Neuro-Link device to control the tentacles while they're having fun with your slave", "start_slave_sex_neuro")
		else:
			addDisabledButton("Neuro-Link", "You need to unlock and create a Neuro-Link device in the bio-lab first..")
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

	if(_action == "doInjectNeuro"):
		processTime(20*60)
		setFlag("ElizaModule.tent_neurolink", true)
		GM.pc.getInventory().removeXOfOrDestroy("TentNeuroLink", 1)
		addMessage("You can now choose to control the tentacles before the sex starts!")

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
