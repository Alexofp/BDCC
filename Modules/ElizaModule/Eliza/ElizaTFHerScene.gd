extends SceneBase

func _init():
	sceneID = "ElizaTFHerScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You can tell Eliza to take certain transformation drugs now that you have unlocked them. She will do only some of them.")

		saynn("What do you want to change about Eliza?")

		addButton("Done", "Enough tinkering", "endthescene")
		if (getFlag("ElizaModule.tfcan_cocks") || getFlag("ElizaModule.tfcan_felinecock", false)):
			addButton("Cock", "Change Eliza's penis or get rid of it", "penis_menu")
		else:
			addDisabledButton("Cock", "You haven't unlocked a drug that can do this yet..")
		if (getFlag("ElizaModule.tfcan_species") || getFlag("ElizaModule.tfcan_demon") || getFlag("ElizaModule.tfcan_catgirl")):
			addButton("Species", "Change Eliza's species", "species_menu")
		else:
			addDisabledButton("Species", "You haven't unlocked a drug that can do this yet..")
		if (getFlag("ElizaModule.tfcan_hucow")):
			addButton("Body", "Change Eliza's body", "body_menu")
		else:
			addDisabledButton("Body", "You haven't unlocked a drug that can do this yet..")
	if(state == "penis_menu"):
		playAnimation(StageScene.Solo, "stand", {pc="eliza", bodyState={naked=true, hard=true}})
		saynn("What penis do you want Eliza to have?")

		addButton("Confirm", "Make her like this", "")
		addButton("No penis", "Tell her to stay as she normally is", "cock_no")
		if(getFlag("ElizaModule.tfcan_felinecock", false)):
			addButton("Feline", "Tell her to grow a feline cock", "cock_feline")
		else:
			addDisabledButton("Feline", "You haven't unlocked a drug that can do this yet..")
		if(getFlag("ElizaModule.tfcan_cocks")):
			addButton("Canine", "Tell her to grow a canine cock", "cock_canine")
			addButton("Dragon", "Tell her to grow a dragon cock", "cock_dragon")
			addButton("Equine", "Tell her to grow a horse cock", "cock_horse")
			addButton("Human", "Tell her to grow a human cock", "cock_human")
		else:
			addDisabledButton("Canine", "You haven't unlocked a drug that can do this yet..")
			addDisabledButton("Dragon", "You haven't unlocked a drug that can do this yet..")
			addDisabledButton("Equine", "You haven't unlocked a drug that can do this yet..")
			addDisabledButton("Human", "You haven't unlocked a drug that can do this yet..")
	if(state == "species_menu"):
		playAnimation(StageScene.Solo, "stand", {pc="eliza", bodyState={naked=true, hard=true}})
		saynn("How do you want to change Eliza's species?")

		addButton("Confirm", "Make her like this", "")
		addButton("Feline", "Make Eliza her usual self", "species_feline")
		if (getFlag("ElizaModule.tfcan_demon")):
			addButton("Demon", "Make Eliza into a half-demon", "species_demon")
		if (getFlag("ElizaModule.tfcan_catgirl")):
			addButton("Catgirl", "Make Eliza into a catgirl", "species_catgirl")
		if (getFlag("ElizaModule.tfcan_species")):
			addButton("Dragon", "Make Eliza into a dragon", "species_dragon")
			addButton("Human", "Make Eliza into a human", "species_human")
	if(state == "body_menu"):
		playAnimation(StageScene.Solo, "stand", {pc="eliza", bodyState={naked=true, hard=true}})
		saynn("How do you want to change Eliza's body?")

		addButton("Confirm", "Make her like this", "")
		addButton("Normal", "Make Eliza her usual self", "body_normal")
		if (getFlag("ElizaModule.tfcan_hucow")):
			addButton("HuCow", "Make Eliza have huge udders", "body_hucow")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "cock_no"):
		setFlag("ElizaModule.elizatf_cock", "")
		getCharacter("eliza").updateBodyparts()
		setState("penis_menu")
		return

	if(_action == "cock_canine"):
		setFlag("ElizaModule.elizatf_cock", "canine")
		getCharacter("eliza").updateBodyparts()
		setState("penis_menu")
		return

	if(_action == "cock_feline"):
		setFlag("ElizaModule.elizatf_cock", "feline")
		getCharacter("eliza").updateBodyparts()
		setState("penis_menu")
		return

	if(_action == "cock_dragon"):
		setFlag("ElizaModule.elizatf_cock", "dragon")
		getCharacter("eliza").updateBodyparts()
		setState("penis_menu")
		return

	if(_action == "cock_horse"):
		setFlag("ElizaModule.elizatf_cock", "horse")
		getCharacter("eliza").updateBodyparts()
		setState("penis_menu")
		return

	if(_action == "cock_human"):
		setFlag("ElizaModule.elizatf_cock", "human")
		getCharacter("eliza").updateBodyparts()
		setState("penis_menu")
		return

	if(_action == "species_feline"):
		setFlag("ElizaModule.elizatf_species", "")
		getCharacter("eliza").updateBodyparts()
		setState("species_menu")
		return

	if(_action == "species_demon"):
		setFlag("ElizaModule.elizatf_species", "demon")
		getCharacter("eliza").updateBodyparts()
		setState("species_menu")
		return

	if(_action == "species_dragon"):
		setFlag("ElizaModule.elizatf_species", "dragon")
		getCharacter("eliza").updateBodyparts()
		setState("species_menu")
		return

	if(_action == "species_catgirl"):
		setFlag("ElizaModule.elizatf_species", "catgirl")
		getCharacter("eliza").updateBodyparts()
		setState("species_menu")
		return

	if(_action == "species_human"):
		setFlag("ElizaModule.elizatf_species", "human")
		getCharacter("eliza").updateBodyparts()
		setState("species_menu")
		return

	if(_action == "body_normal"):
		setFlag("ElizaModule.elizatf_body", "")
		getCharacter("eliza").updateBodyparts()
		setState("body_menu")
		return

	if(_action == "body_hucow"):
		setFlag("ElizaModule.elizatf_body", "hucow")
		getCharacter("eliza").updateBodyparts()
		setState("body_menu")
		return

	setState(_action)
