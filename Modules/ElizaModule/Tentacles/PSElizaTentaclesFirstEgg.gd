extends SceneBase

var didArtica = false

func _init():
	sceneID = "PSElizaTentaclesFirstEgg"

func _run():
	if(state == ""):
		didArtica = getFlag("ArticaModule.gaveBirthToEggs", false)
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You show Eliza one of the eggs.")

		saynn("[say=eliza]Ohh, perfect~. Follow me.[/say]")

		if (didArtica):
			saynn("[say=pc]Couldn't you use the ones that you have?[/say]")

			saynn("[say=eliza]You know.. They're just too tasty~.[/say]")

		saynn("The feline invites you to follow her.")

		addButton("Follow", "See where she brings you", "in_lab")
	if(state == "in_lab"):
		aimCameraAndSetLocName("med_researchlab")
		saynn("The feline brings you into the lab.")

		saynn("[say=eliza]Let's begin![/say]")

		saynn("[say=pc]What are you gonna do?[/say]")

		saynn("[say=eliza]I need the egg so I can scan it. Pretty please?[/say]")

		saynn("Why not? You let her grab the egg from your hands and carefully place it into some kind of big machine.")

		saynn("Seconds later, the machine begins doing its job. You hear a faint hiss of escaping steam and the high-pitched whir of scanning lasers.")

		saynn("It will clearly take a while..")

		saynn("[say=pc]You just wanna scan it? Why?[/say]")

		saynn("[say=eliza]I've realized that.. these fruits.. You know.. What if there is a way to.. turn a single apple into a whole apple tree! Wouldn't that be cool?[/say]")

		saynn("She sounds so excited that she can barely contain herself.")

		saynn("[say=eliza]Yes.. we have some specimens here already. But they're all kinda dumb and not very productive. If we just do some selection.. We can make a perfect apple tree. Yes-s-s..[/say]")

		saynn("The machine is still humming away.")

		saynn("[say=pc]You're talking about growing your own type of tentacles? I'm not sure that this is a good idea.[/say]")

		saynn("[say=eliza]Yeah~. Why else are we here? We're here to have fun exploring. I wanna explore.[/say]")

		saynn("[say=pc]You already have access to some kind of tentacles. Why not experiment on them?[/say]")

		saynn("[say=eliza]Listen.. I don't wanna. I wanna grow my own from scratch. We.. are gonna grow our own~. The perfect tentacles.[/say]")

		saynn("The machine suddenly beeps! Eliza learns towards the computer screen that's now full of graphs and numbers.")

		saynn("[say=eliza]Hm.. Mhmm.. uh.. mhm mhm.. mm-m..[/say]")

		saynn("She rubs her chin with her clawed digits.")

		saynn("[say=eliza]Yeah.. hm.. There is some good news and some bad news.[/say]")

		saynn("[say=pc]Shoot.[/say]")

		saynn("[say=eliza]The more they are exposed to air, the more damaged their DNA becomes. I guess shining bright lasers as it didn't help either.[/say]")

		saynn("Sounds like overall it was a failure..")

		saynn("[say=eliza]The good news is!..[/say]")

		saynn("She throws her paws up suddenly while saying that.")

		saynn("[say=eliza]I've got some great data to analyze![/say]")

		saynn("[say=pc]That doesn't sound very useful.[/say]")

		saynn("[say=eliza]Nah, you don't understand. Data is everything in this world. If you have enough of it, you can reconstruct the past, change the now, and predict the future.[/say]")

		saynn("You shrug. Somehow you find it hard to believe that a single weird fruit could be that useful.")

		saynn("[say=pc]Can I have the egg back?[/say]")

		saynn("She hums and raises a brow.")

		saynn("[say=eliza]Well.. This one has gotten an unhealthy dose of radiation, I wouldn't recommend eating it. But.. what if we.. YES![/say]")

		saynn("Oh no. You watch as Eliza quickly opens the machine and grabs the egg. As she does it, every single Geiger counter in the room gets set off all at once.")

		saynn("Eliza runs with it into a different room.. some kind of testing chamber.. You watch through the glass as she injects it with something and then just places it on the floor, in the middle of the room.")

		saynn("Just as fast, she returns to you and joins, observing the lonely egg.")

		saynn("[say=pc]Don't tell me you've injected it with mutagen.[/say]")

		saynn("[say=eliza]No-o~. Of course not. The radiation alone is already enough to scramble the DNA. It was just a growth accelerator.[/say]")

		saynn("Just a growth accelerator..")

		saynn("Soon.. something about the egg begins to change.")

		saynn("It starts.. growing.. That's to be expected.. but it also starts changing color and growing some kind of appendages.. that's less expected.")

		addButton("Watch", "See what happens next", "egg_grows")
	if(state == "egg_grows"):
		playAnimation(StageScene.SoloBigEgg, "stand")
		saynn("That white egg grows a green shiny shell around itself. Underneath it.. some kind of weird nest-like structure, made out of little tendrils. These tendrils move a bit.. but then they quickly turn purple and seemingly die..")

		saynn("[say=eliza]Fascinating. It looks like some of the tentacles got underdeveloped.. They tried to grow too fast. And that shell.. wow.. It reminds me of the peel that some fruits have.[/say]")

		saynn("[say=pc]Do you have any weapons here? Just in case..[/say]")

		saynn("She looks at you and smiles.. before giving you a few pats.")

		saynn("[say=eliza]I can space everything that's in that room with a single button press, don't worry~.[/say]")

		saynn("[say=pc]I worry that you won't press it.[/say]")

		saynn("Eliza chuckles.")

		saynn("[say=eliza]Haha. That'd be funny, wouldn't it?[/say]")

		saynn("The egg is huge now. And the process of growth doesn't stop. At some point the egg starts shivering ever so slightly. Little thumps.")

		saynn("[say=eliza]Woah. Isn't that cool?[/say]")

		saynn("[say=pc]I'm trusting you with a lot here.[/say]")

		saynn("[say=eliza]Everything is under control, can't you see? Just relax and watch~.[/say]")

		saynn("She shows you a remote with a few buttons. It seems to be the one that is controlling things in the testing chamber.")

		saynn("The egg starts shaking harder.. and faster. The pressure is rising inside it. The light shining behind the egg illuminates the dark inner contours.. of something.")

		saynn("[say=pc]What if a monster pops out of there and kills us all?[/say]")

		saynn("[say=eliza]Monster-shmonster.. The risk is always worth it.[/say]")

		saynn("The egg is thrashing now. Violent, erratic movements that shake the entire testing chamber. The green shell pulses with each impact that comes from within, cracks begin appearing all across its surface. Some kind of dark green fluid starts leaking through the holes, pooling on the floor.")

		saynn("[say=pc]Doctor. Press the button.[/say]")

		saynn("[say=eliza]Not yet. Look, it's almost here! It's gonna be beautiful![/say]")

		saynn("The feline is pressed against the glass, her tail going absolutely rigid with excitement.")

		saynn("You have zero trust in Eliza by this point. You try to grab the remote out of her paw.. but she instantly raises it high above her head, out of your reach.")

		saynn("The egg convulses.. You can clearly see a limb of sorts.. pressing against the shell from inside, stretching it like it's made out of rubber. There is more than one of it inside, for sure.")

		saynn("[say=pc]Give me the damn remote.[/say]")

		saynn("[say=eliza]No![/say]")

		saynn("She pushes you away, her claws digging painfully into your skin as she does it.")

		saynn("The egg convulses one last time. The shell bulges outward, ready to burst..")

		saynn("But then.. everything stops.")

		saynn("For one perfect, silent second, everything is still..")

		addButton("Continue", "See what happens next", "egg_boom")
	if(state == "egg_boom"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("And then.. the egg explodes.")

		saynn("Green shell fragments fly across the chamber.. together with torn bits of green limbs. Thick, viscous fluid sprays in all directions, painting the whole room in it in an instant.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_lab"):
		processTime(5*60)

	if(_action == "egg_grows"):
		processTime(30*60)

	if(_action == "egg_boom"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["didArtica"] = didArtica

	return data

func loadData(data):
	.loadData(data)

	didArtica = SAVE.loadVar(data, "didArtica", false)
