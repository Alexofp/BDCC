extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AlexRynardPantiesQuestGivePanties"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})

	if(state == ""):
		# (You give him the panties. Foxy starts modifying them by putting little portals inside and attaching them. He also somehow modifies them to be unremovable?)

		# (He gives you the panties to wear.)

		saynn("You bring the panties that the foxy asked for. He takes them, quickly checks their size and quality.")

		saynn("[say=alexrynard]Yeah, whatever, these will do. Let me prepare them.[/say]")

		saynn("He puts on a respirator mask and uses a spray paint can to paint them into purple. After that, he uses some kind of special heater that makes the paint dry up pretty much instantly, saving a lot of time.")

		saynn("[say=alexrynard]That way they will be more noticable.[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("After the panties are sprayed, he starts attaching a few of these disk-like devices directly to the cloth, placing a few in a row across the crotch region. They are quite thin, barrely adding to the thickness of the panties. Foxy then slots a blue crystal into each device, causing them to power on with a slight hum.")

		saynn("[say=alexrynard]Seems to work. Now put them on.[/say]")

		saynn("Huh? You raise your brow as you are presented with the panties.")

		saynn("[say=alexrynard]What?[/say]")

		addButton("Safe?", "Ask what will happen", "safe?")
		addButton("Put them on", "See what happens", "put_them_on")

	if(state == "safe?"):
		# (You ask if its safe)

		# (Foxy asks if you want credits or not)

		saynn("[say=pc]Are you sure it’s safe?[/say]")

		saynn("Foxy gets visibly annoyed.")

		saynn("[say=alexrynard]Do you want credits or not? Wanna go back to mining rocks?[/say]")

		saynn("He has a point. Might as well test them once.")

		addButton("Put them on", "See what happens", "put_them_on")

	if(state == "put_them_on"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", 
			bodyState={exposedCrotch=true},
		})
		
		# (You put the panties on, cold metal rubs against your privates)

		# (But when he turns the portals on, you suddenly feel your privates free)

		# (He shows you the fleshlights and plays with one maybe. You feel it and moan)

		# (He offers for you to wear them long term. One credit for each TEST.)

		# (The guy says he will keep the fleshlights. You wonder if anyone will have access to them. He says there might be some testing done, nothing too much.)

		saynn("[say=pc]You gonna look?[/say]")

		saynn("[say=alexrynard]You’re holding millions of credits in your hands, of course I’m gonna look.[/say]")

		saynn("He might be right but it still makes you frown. Whatever.")

		# (if masculine)
		if(GM.pc.getFemininity() <= 40):
			saynn("You grab the panties and start putting them on. They don’t really fit your masculine look but they seem to be stretchy enough.")

		# (if else)
		else:
			saynn("You grab the panties and start putting them on. The material seems quite stretchy, allowing for a good fit.")

		# (if has cock and pussy)
		if(GM.pc.hasPenis() && GM.pc.hasVagina()):
			saynn("Although, you do feel the cold metal brushing against your dick and pussy, causing some discomfort. The panties also bulge out quite a bit in the front, their shape doesn’t really hide your genitals.")

		# (else if has cock)
		elif(GM.pc.hasPenis()):
			saynn("Although, you do feel the cold metal brushing against your dick, causing some discomfort. The panties also bulge out quite a bit in the front, their shape doesn’t really hide your genitals.")

		# (else if has pussy)
		elif(GM.pc.hasVagina()):
			saynn("Although, you do feel the cold metal brushing against your pussy, causing some discomfort. But otherwise, they look and feel like normal panties.")

		# (else)
		else:
			saynn("Although, you do feel the cold metal brushing against your crotch, causing some discomfort. But otherwise, they look and feel like normal panties.")

		saynn("You show off the purple panties to the foxy, he seems satisfied enough for now.")

		saynn("[say=pc]What next?[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		saynn("[say=alexrynard]Now we can start the test.[/say]")

		saynn("You carefully watch his actions. Foxy grabs a few tube-like objects, they look like cylinders but with a few buttons. You also notice that the top side has some kind of aperture, the same kind that the devices in your panties have. You begin to wonder..")

		# (if has cock and pussy)
		if(GM.pc.hasPenis() && GM.pc.hasVagina()):
			saynn("But just before you can realize what’s going on, the foxy turns on all the tubes, causing them to start humming. And a few seconds later, the apertures on them open, revealing.. your genitals. Yes, one of the tubes seems to have your exact {pc.cock} sticking out of it with the two others showing your pussy and your {pc.analStretch} anus! You look down and realize that you can’t take off your panties anymore, it's like they’re glued to your skin! And the bulge that was once there is now missing.")

		# (if has just cock)
		elif(GM.pc.hasPenis()):
			saynn("But just before you can realize what’s going on, the foxy turns on all the tubes, causing them to start humming. And a few seconds later, the apertures on them open, revealing.. your genitals. Yes, one of the tubes seems to have your exact {pc.cock} sticking out of it with the two others showing your {pc.analStretch} anus! You look down and realize that you can’t take off your panties anymore, it's like they’re glued to your skin! And the bulge that was once there is now missing.")

		# (if has just pussy)
		elif(GM.pc.hasVagina()):
			saynn("But just before you can realize what’s going on, the foxy turns on all the tubes, causing them to start humming. And a few seconds later, the apertures on them open, revealing.. your genitals. Yes, one of the tubes seems to have your pussy on top of it and the other one showing off your {pc.analStretch} anus! You look down and realize that you can’t take off your panties anymore, it's like they’re glued to your skin!")

		# (if nothing)
		else:
			saynn("But just before you can realize what’s going on, the foxy turns on all the tubes, causing them to start humming. And a few seconds later, the apertures on them open, revealing.. your genitals. Yes, the tube seems to be showing off your {pc.analStretch} anus on top of it! You look down and realize that you can’t take off your panties anymore, it's like they’re glued to your skin!")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your eyes open wide as you see the foxy fidgeting with the tube that has your pussy on it. Alex seems just as fascinated as you, he places a digit on your clit and gives it a rub, causing you to moan. Even though you’re a few steps away. He then spreads your {pc.pussyStretch} pussy folds open and shows off to you how wet they are..")

		# (else)
		else:
			saynn("Your eyes open wide as you see the foxy fidgeting with the tube that has your tailhole on it. Alex seems just as fascinated as you, he places a digit on it before prodding a few times, causing you to moan. Even though you’re a few steps away. He then spreads your {pc.analStretch} anal hole open with two digits and shows it off to you..")

		saynn("There is no denying it, you have portals in your panties!")

		saynn("[say=pc]Wow..[/say]")

		saynn("[say=alexrynard]It works, who would have thought. And we didn’t even create a singularity in the process. Do you like your portal panties?[/say]")

		saynn("[say=pc]The what panties?[/say]")

		saynn("[say=alexrynard]I think that’s a fitting name, isn’t it? I made sure that you can’t take them off unless I disable them. You know, for safety.[/say]")

		saynn("Yeah, for safety, sure. You look down at your panties and notice a little heart symbol shining through the purple cloth. Probably means that the lock is working.")

		saynn("The foxy fidgets with the tubes, doing some visual inspection on them. The more you look at them the more they remind you of.. fleshlights.")

		saynn("[say=alexrynard]So. Here is my offer. You will wear these panties.[/say]")

		saynn("He then points at the fleshlights. Him having such easy access to your lewd bits makes you clench.")

		saynn("[say=alexrynard]And these things are staying here so we can do some tests. For each ‘test’ you will be given a single work credit. Sounds better than mining?[/say]")

		addButton("Agree", "(Includes noncon) Keep them for now", "agree")
		addButton("Nah", "(Disables portal panties content) You don’t want them", "nah")


	if(state == "agree"):
		# (You agree and keep the panties)

		# (You leave and the panties events start)

		saynn("[say=pc]Sure, I like credits.[/say]")

		saynn("Some more concerns spawn in your head.")

		saynn("[say=pc]What kind of tests though?[/say]")

		saynn("Foxy relaxes in his chair and offers you a cunning smile.")

		saynn("[say=alexrynard]You might get poked or touched. Basic interactions tests, you know. No one is gonna fuck you through one, its too dangerous at this point anyways.[/say]")

		saynn("Good to know. Even if you feel slightly disappointed inside. When the foxy grabs the fleshlights and moves them away, you feel the breeze washing over your bits, so exciting.")

		saynn("[say=alexrynard]Well, you’re free, inmate.[/say]")

		saynn("You nod and make your way out, now wearing some very unique panties.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

	if(state == "nah"):
		# (You disagree and take off the panties before giving them to him)

		# (He says he will find a more willing inmate then.)

		saynn("You think about it more and realize how big of a danger this is. Who knows what these ‘tests’ are.")

		saynn("[say=pc]I.. I think I will decline your offer.[/say]")

		saynn("Foxy shows no obvious emotion and just shrugs.")

		saynn("[say=alexrynard]Well, whatever then.[/say]")

		saynn("He switches off all the fleshlights. They begin their shutdown routine, each one slowly closes its aperture, allowing you to pull your private bits out without a risk of getting injured. That allows you to take off the portal panties and give them back to the foxy.")

		saynn("[say=alexrynard]I will find a more willing inmate.[/say]")

		saynn("You leave him with his prototype.")

		# (scene ends)

		addButton("Continue", "Time to go", "endthescene")


func _react(_action: String, _args):

	if(_action == "put_them_on"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("PortalPanties"))
		
	if(_action == "nah"):
		var item:ItemBase = GM.pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom)
		if(item != null):
			GM.pc.getInventory().unequipItem(item)
			item.destroyMe()
		setFlag("PortalPantiesModule.Panties_PcDenied", true)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func getDevCommentary():
	return "So yeah, portal panties. I don't even know if any other game has them. I'm sure there are some now but back then this tag was pretty empty even on the e621 side x3. No, there were some great art pieces already ^^. Just not that much. They are what made me want to try my hand at writing a portal panties quest.\n\nThe idea of portal sex is pretty lewd. Someone make portal panties irl pls, you will solve so many problems x3"

func hasDevCommentary():
	return true
