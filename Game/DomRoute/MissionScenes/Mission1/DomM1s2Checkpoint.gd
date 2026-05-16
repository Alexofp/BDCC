extends SceneBase

func _init():
	sceneID = "DomM1s2Checkpoint"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait", pc="rahi"})
		setCharacters(["kait", "avy", "rahi"])
		saynn("You meet the team near the checkpoint, Rahi included.")

		saynn("[say=rahi]Meow..[/say]")

		saynn("[say=kait]We need a staff badge. Think you can get us one? Quietly. We will return it after.[/say]")

		saynn("The brown feline hums.")

		saynn("[say=rahi]Hm.. yeah.. she can try. Give her some time..[/say]")

		saynn("Kait nods. Rahi starts wandering around the area, looking for lonely staffers.")

		addButton("Continue", "See what happens next", "avy_gives_painkillers")
	if(state == "avy_gives_painkillers"):
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("[say=kait]Once she gets us a badge, two of us will have to stay here and keep the guard busy while someone else goes up there and gets the records. Fast.[/say]")

		saynn("The second task sounds more fun than the first one.")

		saynn("[say=pc]I will get them.[/say]")

		saynn("[say=kait]There are probably gonna be a few offices up there. Search them until you find one with a printer.[/say]")

		saynn("You nod.")

		saynn("A few seconds later Avy approaches you and hands you something. A few pill bottles it seems.")

		saynn("[say=avy]I brought you some painkillers. Pop one if it hurts. It's not like I give a fuck but you might as well have them.[/say]")

		saynn("[say=pc]Thanks, might come in handy.[/say]")

		saynn("Before you can get a hold of them, Kait shoves herself in and swipes them to check their labels.")

		saynn("[say=kait]Are they normal?[/say]")

		saynn("[say=avy]Are you normal?[/say]")

		saynn("[say=kait]Yes. But you're not.[/say]")

		saynn("[say=avy]I'm high above normal.[/say]")

		saynn("[say=kait]Yeah, very high.[/say]")

		saynn("You notice Rahi approaching someone.")

		saynn("[say=pc]Psst.[/say]")

		saynn("That gets others to stop arguing and pay attention. Kait gives the pills back.")

		addButton("Continue", "See what happens next", "rahi_talks_with_nova")
	if(state == "rahi_talks_with_nova"):
		setCharacters(["rahi", "nova"])
		playAnimation(StageScene.Duo, "stand", {pc="rahi", npc="nova"})
		saynn("[say=rahi]Hey.. uh.. she has a..[/say]")

		saynn("The guard.. gray husky with a fancy guard armor.. turns towards the brown feline.")

		saynn("[say=nova]Well hello there, pretty kitty~.[/say]")

		saynn("[say=rahi]..meow..[/say]")

		saynn("Rahi's ears flatten, her tail wraps around her leg, her cheeks start glowing a bit.")

		saynn("[say=nova]Aw.. don't be shy~. What's a little cutie like you doing all alone here?[/say]")

		saynn("[say=rahi]She.. she got a bit lost.. meow.. And then she saw you and thought.. um..[/say]")

		saynn("The husky tilts her head, a warm smile spreading across her muzzle. Rahi's gaze is low.. watching the guard's armor, jumping from point to point. Eventually she sees something.")

		saynn("[say=nova]Thought what, sweetheart?[/say]")

		saynn("Rahi shuffles closer, trembling.")

		saynn("[say=rahi]Kitty thought.. maybe you could help her find her way back to the cellblock?..[/say]")

		saynn("She looks up at the guard with big blue eyes, her lips slightly quivering.")

		saynn("Nova's expression softens further, she reaches out and cups Rahi's chin.. and hears her purr.")

		saynn("[say=nova]Oh, you poor thing. Lost little kitten in a big scary prison.[/say]")

		saynn("Seconds later.. you hear a click..")

		addButton("Continue", "See what happens next", "rahi_gets_leashed")
	if(state == "rahi_gets_leashed"):
		playAnimation(StageScene.Duo, "stand", {pc="rahi", npc="nova", bodyState={leashedBy="nova"}})
		saynn("A leash got clipped to Rahi's collar. Her expression changes for a split second as that happens.. looks like this wasn't part of the plan.")

		saynn("[say=nova]Let's escort you back to your cell~.[/say]")

		saynn("[say=rahi]Uh.. oh.. um.. y-yeah.. um.. sure..[/say]")

		saynn("Kait starts whispering to you.")

		saynn("[say=kait]Shit.. do we help her?[/say]")

		saynn("[say=avy]Shut up. Just watch.[/say]")

		saynn("[say=kait]But we need our thief.[/say]")

		saynn("[say=avy]Don't be a pussy.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "avy_gives_painkillers"):
		processTime(3*60)
		
		addMessage("You received 3x painkillers!")
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))

	setState(_action)
