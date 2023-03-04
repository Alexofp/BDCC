extends SceneBase

var deserved = true

func _init():
	sceneID = "rahiPunishmentTyingUpScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _reactInit():
	processTime(5*60)
	getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ZiptiesWrist"))
	getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ZiptiesAnkle"))

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.SexStart, "start", {npc="rahi", npcBodyState={naked=true}})
		saynn("You produce the ropes that Rahi has used before. The feline already understands what's gonna happen. She unbuttons her shirt and opens it, revealing her {rahi.breasts} to you. Then she pulls her shorts down, exposing her neat tight kitty too. The feline presents naked herself to you.")

		if (deserved):
			saynn("[say=rahi]She won't resist..[/say]")

		else:
			saynn("[say=rahi]She won't resist.. but why?..[/say]")

		saynn("Without saying anything, you grab kitty's paws before forcefully bringing them behind her back. That forces a meow out of the kitty. You wrap the rope around her wrists a few times before tying them together with a nice tight knot. That's not it though, you continue wrapping the rope around her chest, under her breasts and then above them too, trying to make it all look neat.")

		saynn("As you tighten her ropes, a small gasp escapes from Rahi, the ropes really emphasize her breasts now.")

		saynn("Then you slowly pull her down until she is sitting on the floor. Then you grab the second rope and start tying up her ankles together using a similar method, just wrapping the rope a few times around the ankles before adding a tight knot. Then you tie together her knees too, rendering kitty completely helpless.")

		saynn("After being done, you get up and look at your work. You see a kitty that's tied up pretty well. Rahi tests your restraints by wiggling but apart from moving her shoulders and bending her back, she can't do much.")

		if (deserved):
			saynn("[say=rahi]Huff.. Sorry for failing you, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

		else:
			saynn("[say=rahi]This is unfair, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

		saynn("What now.")

		addButton("Nap", "Now would be a good time to nap", "take_a_nap")
	if(state == "take_a_nap"):
		saynn("Well, might as well take a short nap while you're at it.")

		saynn("You lie down onto Rahi's bed and make yourself comfy. The feline looks at you with pleading eyes but doesn't say anything.")

		saynn("You just close yours and try to nap for some time.")

		saynn("A few hours pass. You feel better.")

		saynn("As you open your eyes you see.. kitty. She is still there. And she is still tied up. Her head is tilted down, her ears lowered.")

		if (deserved):
			saynn("Kitty's eyes look sorry, her whole expression shows that she is clearly guilty. She notices that you're awake and just keeps still.")

			saynn("You get up and begin to untie her.")

			saynn("[say=rahi]Thank you for punishing her, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

		else:
			saynn("Kitty's eyes show that she is upset. Her fluffy tail starts to wag when she notices that you're awake. She is pouting.")

			saynn("You get up and begin to untie her.")

			saynn("[say=rahi]Huff..[/say]")

		addButton("Continue", "See what happens next", "do_untie")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "take_a_nap"):
		processTime(2*60*60)
		GM.pc.addStamina(50)

	if(_action == "do_untie"):
		getCharacter("rahi").resetEquipment()
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
