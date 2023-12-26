extends SceneBase

func _init():
	sceneID = "VionIntroduction"

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "stand", {npc="vion"})
		saynn("You peek inside a random cell. In addition to the standard uncomfortable bed and cheap chair, someone seems to have gone trough the effort of dragging one of the cellblocks ever-present sofas inside. As you look closer, it becomes clear its seen better days - mysterious stains and ripped cushions make up the bulk of its surface.")

		saynn("[say=vion]If you want one of your own, you'll have to wait until the next time the guards can't be bothered dragging one off for disposal.[/say]")

		saynn("You turn around to the source of the voice, coming face to face with a lean dragon in a lilac uniform, currently sporting an amused smirk. You notice he's wearing glasses, an unusual sight in the era of readily accesible eye correction surgery.")

		addButton("Just looking", "Didn't mean to intrude", "just_looking")
		addButton("Introductions", "Don't believe we've met", "introduction")
	if(state == "just_looking"):
		saynn("[say=pc]I was just looking around. Didn't mean to intrude.[/say]")

		saynn("The smirk gets a fraction wider.")

		saynn("[say=vion]Well, feel free to look around. Not much to it, I'm afraid.[/say]")

		saynn("Another glance around the cell confirms his words. As a cell in the lilac cellblock, it is somewhat above the average, but ultimately it's still just a prison cell.")

		addButton("Introductions", "Don't believe we've met", "introduction")
	if(state == "introduction"):
		saynn("[say=pc]My name's {pc.name}. I don't believe we've met?[/say]")

		saynn("[say=vion]I go by {vion.name}. Pleasure. Now, care to clear the door and let me into my parlor?[/say]")

		saynn("You do seem to be blocking the doorway.")

		addButton("Oops", "Let me get out of your way", "gang_way")
	if(state == "gang_way"):
		saynn("[say=pc]Oh. Lemme get out of your way.[/say]")

		saynn("You step aside and watch as {vion.name} walks inside, then plops down on the bed.")
		
		saynn("[say=vion]So {pc.name}, do you need anything?[/say]")

		addButton("Talk", "While you're here...", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		runScene("VionRepeatConversation")
		return

	setState(_action)
