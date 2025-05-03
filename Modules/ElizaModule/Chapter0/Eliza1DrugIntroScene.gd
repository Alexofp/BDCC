extends SceneBase

func _init():
	sceneID = "Eliza1DrugIntroScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]Hey, I think I did some bounties.[/say]")

		saynn("Doctor's eyes light up as her clawed digits tap away at her keyboard.")

		saynn("[say=eliza]Oh yes, I see it. Great work, that will help my research a lot~.[/say]")

		saynn("Her cute smile is almost as bright as the harsh sterile lighting here.")

		saynn("[say=pc]Again, how are those bounties supposed to help with anything?[/say]")

		saynn("[say=eliza]The art of science is not just about theory. It's not only about boring papers..[/say]")

		saynn("Her feline nose wrinkles when she says that.")

		saynn("[say=eliza]The real science is impossible without one critical thing.. Experimentation. Only through experimentation can we figure out if we're right or wrong.[/say]")

		saynn("She spreads her arms a bit, holding something imaginary.")

		saynn("[say=eliza]Life.. is a box. Big. Cardboard. Box.[/say]")

		saynn("Cats and their boxes..")

		saynn("[say=eliza]It's unique. Perfect in every way. I love holding it in my paws, looking at it.. feeling its magic on whiskers.[/say]")

		saynn("She strokes her imaginary cardboard box and purrs softly.")

		saynn("[say=eliza]The only problem.. it's a closed box.. You know why that's a problem?[/say]")

		saynn("[say=pc]Because you can't sit inside?[/say]")

		saynn("[say=eliza]Yes! Wait.. no.. I mean..[/say]")

		saynn("She shakes the imaginary box.")

		saynn("[say=eliza]I wanna know what's inside! That's the problem![/say]")

		saynn("[say=pc]So the problem is that you're too curious.[/say]")

		saynn("She shrugs and puts the box away.")

		saynn("[say=eliza]I guess? But shouldn't we all be curious? I wanna know how this damn box of life works! I wanna poke it in all the right places until it opens and shows me all its secrets. I wanna be the person who does it.[/say]")

		saynn("She sips some coffee out of her personal mug. You notice the words 'Best mom' on it.")

		saynn("[say=pc]Messing with life can lead to death, you know.[/say]")

		saynn("She chuckles.")

		saynn("[say=eliza]I know all about it, believe me. I'm probably down to my 7th life by now.[/say]")

		saynn("A second of silence puts your mind back on track.")

		saynn("[say=pc]So.. I did what you asked. Am I your assistant now?[/say]")

		saynn("[say=eliza]Oh! Not quite. But! There is something very important you can help me with now.[/say]")

		saynn("Doctor Quinn leaves her counter and steps out of view.. just to appear behind one of the staff-only doors soon after.")

		saynn("[say=eliza]Follow me, patient.[/say]")

		saynn("[say=pc]Patient? I'm not a patient.[/say]")

		saynn("[say=eliza]Shush! Don't make me pull out the chain![/say]")

		saynn("Well.. Might as well see what she wants to show you.")

		addButton("Follow", "See what's up", "follow_eliza")
	if(state == "follow_eliza"):
		aimCameraAndSetLocName("med_researchlab")
		saynn("The feline lets you into the staff-only area and then brings you into her research lab. There is a lot of equipment around, computers, machines, a whole wall of drawers. One of the corners is dedicated to a chemistry station, obvious favourite spot of the feline.")

		saynn("There is a special table in the middle of the room. Attached to a computer, it kinda looks like an autodoc.. but who knows. There are hooks to chain someone to it..")

		saynn("The air.. it's so fresh here. Makes you wanna stay here for a bit longer.")

		saynn("[say=eliza]Give me a second.[/say]")

		saynn("Doctor Quinn puts on some latex gloves and a respirator mask.. before heading towards her station.")

		saynn("But it looks like she isn't gonna cook anything.. luckily. She just grabs a closed beaker.. that has some kind of.. powder.. in it. It's not a lot.. but you can clearly see it.")

		saynn("She shows it to you.")

		saynn("[say=eliza]This.. is a drug. Well, I crushed it.. it was a pill before. Just imagine that there is a pill here.[/say]")

		saynn("She shakes the beaker a bit. The powder shines a bit under the light.")

		saynn("[say=eliza]From the tests that I did.. I couldn't figure out what this is. It's not in our database, can you imagine that?[/say]")

		saynn("Her brows raise a little, her mask is making her voice sound a bit intimidating.")

		saynn("[say=pc]You're not planning to test that on me, are you?[/say]")

		saynn("[say=eliza]No-o-o.. of course not.. There is not enough left to do that anyway.[/say]")

		saynn("Right.")

		saynn("[say=pc]If it's not in your database, where did you get it?[/say]")

		saynn("[say=eliza]It was.. confiscated from one of the inmates. You might have seen these getting passed around yourself already.[/say]")

		saynn("Quinn directs her gaze towards one of the big machines.")

		saynn("[say=eliza]When I analyzed the molecular structure of this drug.. I realized what it looks like.. DNA. Parts of it are encoded into its structure. Whatever it is.. it has a huge.. transformative.. potential.[/say]")

		saynn("That doesn't sound like something that was made for junkies in an underground drug lab.")

		saynn("[say=pc]So the inmates here can get their hands on something that you're not even aware of existing. Something so scary. Sounds like your prison has a contraband problem.[/say]")

		saynn("You hear a chuckle behind that mask.")

		saynn("[say=eliza]Some see it as a problem.. I see it.. as an opportunity.[/say]")

		saynn("Of course she does.")

		saynn("[say=pc]You wanna research them.[/say]")

		saynn("Her eyes shine, her ears perk, her tail becomes aroused.")

		saynn("[say=eliza]Yes~. Now we're talking the same language.[/say]")

		saynn("The way she looks at you.. there is no way she is not turning you into a test subject by the end of this..")

		saynn("[say=pc]And you need me because..?[/say]")

		saynn("She looks at the beaker in her paws again.")

		saynn("[say=eliza]Well.. I kinda ruined this sample. I learned a lot.. but I need more. If I harvest enough data about its structure.. I think I might be able to reverse-engineer it.. and then.. who knows.. maybe replicate it.[/say]")

		saynn("Sounds like she wants you to go around searching for these.. strange pills.")

		saynn("[say=pc]And what do I get out of this?[/say]")

		saynn("Quinn puts the beaker away and takes off her gloves and mask.")

		saynn("[say=eliza]Mmm..[/say]")

		saynn("She leans closer to your face, her emerald eyes staring into yours.")

		saynn("[say=eliza]You will get to be my lab assistant.. And that will have some cool perks attached to it..[/say]")

		saynn("Her clawed paw scritches you under the chin.")

		saynn("[say=eliza]Trust me~.[/say]")

		saynn("She bites her lip and giggles softly, her claws following the curve of your neck.. until they find that bulky metal collar.. and slide under it, leaving even less space for you to breathe.")

		saynn("[say=eliza]Gonna be a good {pc.boy} and help me? I can always use more test subjects too, you know~.[/say]")

		saynn("Totally not a threat.")

		saynn("[say=pc]I will see what I can do.[/say]")

		saynn("She winks and lets go of your collar.")

		saynn("[say=eliza]Look out for pills that feel.. strange. No markings, no labels, no anything. You might have to.. convince.. other inmates to share some. Don't eat them, bring them here![/say]")

		saynn("Find some strange pills and bring them to Doctor Quinn.. easy enough. You nod.")

		saynn("[say=eliza]One might be enough for a start. If I tune my equipment a bit more, it should be enough for sure.[/say]")

		saynn("She looks around.")

		saynn("[say=eliza]We have some very outdated stuff here.. Quite some trash compared to the other labs that I worked at.. But what can you do, it still kinda does its job.[/say]")

		saynn("AlphaCorp is probably not exactly keen on spending extra funding on inmates.")

		saynn("Quinn sighs while looking at her chemistry station.. and then heads towards the exit.")

		saynn("[say=eliza]Let's get you out before you breathe in too much toxic stuff.[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("[say=eliza]I'm joking~. It's not that much worse than your normal prison air.[/say]")

		saynn("That's not very inspiring..")

		addButton("Follow", "Exit the lab", "exit_lab")
	if(state == "exit_lab"):
		aimCameraAndSetLocName("med_nearlab")
		GM.pc.setLocation("med_nearlab")
		saynn("You exit the lab with Quinn.")

		saynn("[say=eliza]I'm gonna go get a coffee refill from the break room. I trust you will find the exit by yourself?[/say]")

		saynn("[say=pc]Sure.[/say]")
		
		saynn("A few nurses walk by.")
		
		saynn("[say=eliza]Oh, one more thing. I helped to install more scanners all around the prison. The bounty board has a special bounty now, just for you. Go check it. It should help you find a certain kind of contraband. Wink-wink~.[/say]")

		saynn("She smiles.. and leaves you be.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "follow_eliza"):
		processTime(5*60)

	if(_action == "exit_lab"):
		processTime(5*60)
		addExperienceToPlayer(100)
		addMessage("Task updated")
		addMessage("Bounty board in the nursery can now help you find inmates that have transformation drugs on them.")

	setState(_action)
