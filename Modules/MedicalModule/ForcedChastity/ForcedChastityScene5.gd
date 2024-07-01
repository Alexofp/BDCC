extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ForcedChastityScene5"

func _reactInit():
	GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))

func _run():
	
	if(state == ""):
		aimCameraAndSetLocName("medical_confessionary")
		GM.pc.setLocation("medical_confessionary")
		playAnimation(StageScene.Solo, "kneel", {bodyState={naked=true}})
		
	if(state == ""):
		saynn("You don’t really feel like opening your eyes because the bed feels so damn soft today. Did they finally decide to address that? They forgot to give you the pillow though but you just bring your hands to your face.. wait.. are they cuffed? Yeah, they totally are. Feeling the cold metal makes you snap out of it and finally open your eyes..")

		saynn("You’re in that dimly lit room named ‘The Confessionary’. And you’re lying on the soft carpet of all things. Huh, did Eliza forget to chain you to that hook above you? You look around and can’t find her anywhere. There is a crate with some things on the couch though.")

		# (Options are Try to escape, Chain yourself, Crate)

		addButton("Crate", "Might as well look at what’s inside", "crate")
		addButton("Chain yourself", "Fix doctor’s mistake", "chain_yourself")
		addButton("Try to escape", "Well, that was lucky", "try_to_escape")
		

	if(state == "try_to_escape"):
		saynn("You quickly get up and approach the bulky metal door that leads into the medical corridor. Heck, it seems this door requires staff access that you obviously don’t have.")

		# (Options are Chain yourself, Crate)

		addButton("Crate", "Might as well look at what’s inside", "crate")
		addButton("Chain yourself", "Fix doctor’s mistake", "chain_yourself")

	if(state == "chain_yourself"):
		setFlag("MedicalModule.Chastity_Event4Choice1", "nothing")
		
		playAnimation(StageScene.HangingSolo, "idle", {bodyState={naked=true}})
		
		saynn("This whole situation makes you feel like Eliza just forgot to chain you. The chains are still there attached to the hook in the ceiling so you just reach with your hands and make the chains latch onto your chains. Crises averted.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={naked=true}})
		
		saynn("Very soon Eliza walks into the room with her morning coffee and a datapad in her paws. Seeing you, she raises her brow and looks you into the eyes, realizing that you’re awake already.")

		saynn("[say=eliza]Good morning, patient.[/say]")

		saynn("[say=pc]What’s the plan, doc?[/say]")

		saynn("Eliza smiles and sips her coffee while eyeing you out, including your chastity cage that is, of course, still there.")

		saynn("[say=eliza]Not much actually. But at the same time, this is a very important day. Let’s get you down first, don’t know why the nurses chained you if I told them not to.[/say]")

		saynn("Oops. But it seems you avoided that problem gracefully. Eliza unchains you from the ceiling and lets you stand.")

		saynn("[say=pc]Uh.. Cuffs?[/say]")

		saynn("[say=eliza]They can stay.[/say]")

		saynn("Fair enough.")

		# (Continues as normal)

		addButton("Continue", "See what happens next", "startquestions")

	if(state == "crate"):
		playAnimation(StageScene.HorsecockDildoSex, "tease", {bodyState={naked=true}})
		
		saynn("You get up off the carpet and approach the crate on the couch. Luckily it wasn’t locked today but you still have to awkwardly work your cuffed hands to try and open it. Inside you see two things that catch your attention, a magic wand vibrator and a huge ass horsecock dildo. And of course many strapons and other sex toys that have no use for you.")

		saynn("Just looking at them makes you feel lusty though. You probably have some time before Eliza arrives, maybe it’s your time to try one.")

		# (Options are Chain yourself, Magic wand, Horsecock dildo)

		addButton("Horsecock dildo", "Use it for your pleasure..", "horsecock_dildo")
		addButton("Magic wand", "Use vibrations to make yourself cum", "magic_wand")
		addButton("Chain yourself", "Fix doctor’s mistake", "chain_yourself")

	if(state == "magic_wand"):
		setFlag("MedicalModule.Chastity_Event4Choice1", "magicwand")
		
		playAnimation(StageScene.Solo, "kneel", {bodyState={naked=true}})
		
		saynn("Cumming from anal is good and all but you’re really missing being able to stroke yourself. And this magic wand just might be the thing you need.")

		saynn("You must be swift though, you reach and grab it with your cuffed hands before sitting down on the floor and positioning it so the big rubber sphere is pressed up against your chastity cage.")

		saynn("Your hand finds the button to turn the wand on and presses it. The bulky rubber ball instantly begins to buzz against your chastity, sending pleasurable vibrations through your shaft. It feels good, really good, the cage obviously absorbs a big chunk of the vibrations but what’s left is enough to make you squirm and curl your toes.")

		saynn("You begin to pant heavily and even hump the wand, wanting more from it. You try different positions, surprisingly pressing it against your crotch and balls feels pretty much the same as pressing it against the cage.")

		saynn("But the real show starts when you find the wand’s power setting. Even just setting it to medium makes you grip into the carpet and let out a muffled noise, the pleasure you receive suddenly spikes through the roof. You really feel like you can cum from that soon, your dick desperately tries to get hard in its cage but the metal shows it its place. You’re leaking pre all over the wand’s tip, who needs anal when you have this.")

		saynn("Surprisingly you got used to that setting too, you slowly raise the power of the vibrations even higher and realize that contrast is where it’s at. The wand buzzes against your cage very loudly. But it also brings you close and then over your peak in a flash.")

		saynn("As the orgasmic waves hit your body, you can’t help but to let out some passionate moans, your locked dick is pulsating while shooting {pc.cum} so much that it feels kinda painful even. The powerful penile orgasm is mixed with a strong periodic pain as your dick desperately tries to pump the seed through itself.")

		saynn("That’s when Eliza walks into the room..")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={naked=true}})
		
		saynn("[say=eliza]Really?[/say]")

		saynn("You hear her disappointed sigh as she steals your source of pleasure and turns it off. She then grabs you by the collar and suddenly shoves you into the mess you left on the carpet.")

		saynn("[say=eliza]You’re not allowed to cum normally. Bad, very bad. You’re ruining the experiment.[/say]")

		saynn("She sighs again and then calms down eventually, letting you get up. Eliza sips some coffee and pulls up a datapad, bringing some data up.")

		saynn("[say=eliza]Well, it’s partly my fault I guess. Let’s hope this little slip up won’t interfere with the results.[/say]")

		saynn("[say=pc]Will I get punished?[/say]")

		saynn("Eliza chuckles softly.")

		saynn("[say=eliza]What, you want me to put glue into your lock? I have better solutions.[/say]")

		saynn("Eliza reaches out and grabs you by the collar again. Her free paw produces some kind of stick, kinda like the stun baton but for animals. A cattle prod. Eliza presses it against your balls and engages it, causing your orbs to suddenly tense up from a painful shock that goes through them.")

		saynn("[say=eliza]Useful for milking. But also for making someone regret their decisions. Mhm?[/say]")

		saynn("The message was clear. You nod.")

		saynn("[say=eliza]Now, where were we..[/say]")

		# (Progresses as normally)
		addButton("Continue", "See what happens next", "startquestions")

	if(state == "horsecock_dildo"):
		setFlag("MedicalModule.Chastity_Event4Choice1", "horsecockdildo")
		
		playAnimation(StageScene.HorsecockDildoSex, "sex", {bodyState={naked=true}})
		
		saynn("Eliza was playing with your butt for too long, time to take things into your own hands. And this giant dildo looks so enticing to try.")

		saynn("You must be swift though, you reach and grab it with your cuffed hands before placing it on the floor. It has a handy suction cup and seems balanced enough to stand on its own without any support. You hover over the flared tip with your butt and begin to slowly lower yourself onto it..")

		saynn("It’s a big one for sure, your {pc.analStretch} tailhole struggles to stretch enough to fit it. But you don’t stop trying, gradually applying more pressure with your butt. It’s not inside yet but you sure feel how much it tries to stretch you, the thoughts going through your head are very arousing..")

		saynn("After a few attempts you stretched yourself enough to let the flat head slide inside you. It instantly puts pressure onto your pleasure bean, causing a spike of sensations. You don’t stop there though, you start bouncing on that rubber dildo, forcing it deeper down your butt each time.")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		playAnimation(StageScene.HorsecockDildoSex, "fast", {pcCum=true, bodyState={naked=true}})
		
		saynn("You proceed to ride the fuck out of that horsecock, rising your lower part of the body before bringing it down along the fat shaft. You’re going so deep that you feel the cock’s bumpy ring that is roughly in the middle of it, your belly shows an outline of the shaft while you’re at the lowest point.")

		saynn("This horsecock is great, it smashes your prostate so much that your locked cock is leaking pre all over the floor. You feel yourself getting super close, that feeling is rising faster the harder you ride that cock.")

		saynn("And you really want that orgasm, you’ve been craving for more lately. That’s why you keep bouncing on it while focusing on this feeling of being stretched, imagining that this is not a toy but a real stud cock that you’re riding. The right mindset is what finally brings you over the edge.")

		saynn("Your whole body tenses up, you bring yourself down that shaft as deep as you can and arch your back, moaning passionately while your caged up dick shoots weak strings of {pc.cum} one after another. The wet orgasm is so strong that your eyes roll up.")

		saynn("And that’s when Eliza walks into the room..")

		addButton("Continue", "Well, this is awkward", "continue3")

	if(state == "continue3"):
		playAnimation(StageScene.HorsecockDildoSex, "inside", {pcCum=true, bodyState={naked=true}})
		
		saynn("She of course instantly spots you riding that dildo.")

		saynn("[say=eliza]Oh wow~. Not sure if I should be disappointed or impressed. Yeah, I’m impressed.[/say]")

		saynn("Eliza giggles and just stands near one of the walls, sipping her morning coffee and watching you. It’s embarrassing, of course. But it feels so good.. Even just clenching around that fat rubber shaft is enough for you to produce another stifled moan.")

		saynn("[say=eliza]Sorry for disrupting you~. But I’m guessing you’re done, judging from the.. obvious signs.[/say]")

		saynn("You slowly rise, letting Eliza see how big of a dildo was inside you. You’re met with another surprised look.")

		saynn("[say=eliza]Well then~.[/say]")

		saynn("She reaches out and puts the dildo away. After that ride, your legs are shaking a bit. But you’re so satisfied.")

		saynn("[say=eliza]I almost forgot why I came here. Right..[/say]")

		# (Progresses as normal)

		addButton("Continue", "See what happens next", "startquestions")

	if(state == "startquestions"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={naked=true}})
		
		saynn("Doctor Quinn holds her datapad and seemingly goes through some menus before pulling up something.")

		saynn("[say=eliza]This experiment is going for.. at least 3 weeks now. Time flies huh. Just gonna ask you some questions and let you go.[/say]")

		saynn("She looks at you.")

		saynn("[say=eliza]That’s okay?[/say]")

		saynn("You nod to her.")

		saynn("[say=eliza]Did you.. enjoy it? The experiences that you had, the things that were done to you. Was it fun?[/say]")

		# (Options are Yes, Some parts, No)

		addButton("Yes", "You did enjoy it", "yes")
		addButton("Some parts", "It was fun but had some bad moments", "some_parts")
		addButton("No", "It was terrible", "no")


	if(state == "yes"):
		setFlag("MedicalModule.Chastity_Event4Choice2", "yes")
		
		saynn("You admit that you enjoyed it quite a bit. Your cheeks blush explaining it all. Eliza watches you with great interest before pressing something in her datapad.")

		saynn("[say=eliza]Glad to hear that. It was fun for me too, not gonna lie.[/say]")


	if(state == "some_parts"):
		setFlag("MedicalModule.Chastity_Event4Choice2", "someparts")
		
		saynn("You admit that you enjoyed some parts of it. But some things were too humiliating or degrading. You explain that sometimes Eliza went too far. She tilts her head slightly and nods-nods while marking something in her datapad.")

		saynn("[say=eliza]Fair enough. You gotta understand that your satisfaction wasn’t the focus there. You’re still a convicted criminal.[/say]")


	if(state == "no"):
		setFlag("MedicalModule.Chastity_Event4Choice2", "no")
		
		saynn("You explain to Eliza that everything that happened to you was cruel and unfair and painful even. Too humiliating, too degrading, too much force and you’re not even a fan of anal. Eliza puts on a calm face and nods before marking some checkbox in her datapad.")

		saynn("[say=eliza]You’re being very rude, not gonna lie. Everything was done by a professional hand and with the usage of high-tec equipment.[/say]")

		# (Same from here)
	if(state in ["yes", "some_parts", "no"]):
		saynn("Eliza scrolls down to the next question.")

		saynn("[say=eliza]Your cage. Do you like it? Have you enjoyed wearing it so far?[/say]")

		# (Options are Yes, Too restrictive, No)

		addButton("Yes", "You love it", "yes1")
		addButton("Too restrictive", "It’s fun but you can’t see yourself wearing it forever", "too_restrictive")
		addButton("No", "You want that cage gone", "no1")


	if(state == "yes1"):
		setFlag("MedicalModule.Chastity_Event4Choice3", "yes")
		
		saynn("You explain that you can’t see yourself without it anymore, it’s that good. Eliza chuckles and marks your answer.")

		saynn("[say=eliza]It’s great that you can’t live without it~.[/say]")


	if(state == "too_restrictive"):
		setFlag("MedicalModule.Chastity_Event4Choice3", "toorestrictive")
		
		saynn("You explain to Eliza how the cage could be fun in certain scenarios with certain people but wearing it long-term is too much for you. She nods-nods and marks your answer.")

		saynn("[say=eliza]Just a matter of getting used to it.[/say]")


	if(state == "no1"):
		setFlag("MedicalModule.Chastity_Event4Choice3", "no")
		
		saynn("You explain to Eliza how unfair it is that some people get locked up and are forced to learn to cum from anal. She listens to you silently.")

		saynn("[say=eliza]I have no regrets doing that to criminals. You might think it’s unfair but it's for your own good really.[/say]")

		# (Same from here)
	if(state in ["yes1", "too_restrictive", "no1"]):
		saynn("Eliza scrolls down to the next question.")

		saynn("[say=eliza]Last one. Do you feel like your behavior has improved? Are you obedient?[/say]")

		# (Options are Yes, No)

		addButton("Yes", "Tell her that you are obedient", "yes2")
		addButton("No", "It didn’t made you obedient at all", "no2")

	if(state == "no2"):
		setFlag("MedicalModule.Chastity_Event4Choice4", "no")
		
		saynn("You tell Eliza that nothing has changed. You’re still as you were. And nothing will change that. Doctor sighs.")

		saynn("[say=eliza]That’s.. unfortunate. Means I failed. Well..[/say]")

		saynn("Eliza marks your answer and puts the datapad away.")

		saynn("[say=pc]Does that mean you will take off the cage?[/say]")

		saynn("[say=eliza]Nope. I have your answers, it's valuable data that will be studied. Obviously I can’t just go off your words, your actions and how you react matter too. So try to enjoy what meetings we will still have~.[/say]")

		saynn("Eliza then reaches to scritch you under the chin.")

		saynn("[say=eliza]Choose who is gonna visit you next.[/say]")

		saynn("[say=pc]Again?..[/say]")

		saynn("[say=eliza]Yeah. And the checkup after that will be our last one. So decide wisely~.[/say]")

		# (Has a choice between Rahi, Tavi, etc)
		addChoices()

	if(state == "tell_who"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("medical_nearconfessionary")
		GM.pc.setLocation("medical_nearconfessionary")
		
		saynn("You tell her the name of who you wanna be fucked by.")

		var pickedPerson = getFlag("MedicalModule.Chastity_SecondChosenPerson", "eliza")
		# (if Eliza)
		if(pickedPerson == "eliza"):
			saynn("[say=eliza]Ohh, you want more of me? Sure~. That’s a safe choice but I appreciate that you enjoy my company.[/say]")

		# (if Risha)
		if(pickedPerson == "risha"):
			saynn("[say=eliza]Risha, huh? Well, she does have a cock. Can’t say that I like her but I will see what I can do.[/say]")

		# (if Rahi)
		if(pickedPerson == "rahi"):
			saynn("[say=eliza]The cute brown kitty? Yeah, I know her. Name is Rahi. We did some tests on her to try to help her but some mental disorders just can’t be helped. I will see if she will be up for this though.[/say]")

		# (Tavi)
		if(pickedPerson == "tavi"):
			saynn("[say=eliza]Tavi? You serious? I mean, she is friendly and all. I would say she is too friendly though, something about her is off. But I will grab her.[/say]")

		# (Nova)
		if(pickedPerson == "nova"):
			saynn("[say=eliza]Oh, you want Nova? Yeah, I could arrange that~. She will be perfect for this.[/say]")


		saynn("Eliza then guides you out of the room and uncuffs your hands.")

		saynn("[say=eliza]See you around~.[/say]")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")

	if(state == "yes2"):
		setFlag("MedicalModule.Chastity_Event4Choice4", "yes")
		
		saynn("You tell Eliza that everything that has happened to you indeed improved your behavior and made you more obedient. Eliza listens to your words and hums. A cunning smile appears on her face.")

		saynn("[say=eliza]Ready to prove that?[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("Eliza puts the datapad away and reaches out to scritch you under the chin.")

		saynn("[say=eliza]Words are good and all but sometimes actions speak louder, you know how it is~. Start by getting on your knees.[/say]")

		# (Options are Obey, Disobey)

		addButton("Obey", "Do everything that Eliza tells you to do", "obey")
		addButton("Disobey", "You’re not gonna humiliate yourself", "disobey")

	if(state == "disobey"):
		setFlag("MedicalModule.Chastity_Event4ObeyedEliza", false)
		
		saynn("You shake your head.")

		saynn("[say=pc]That has nothing to do with my behavior or obedience. You just wanna humiliate me.[/say]")

		saynn("Eliza chuckles and lets you feel her claws on your chin as she extends them.")

		saynn("[say=eliza]There is nothing wrong with feeling embarrassed for what you enjoy, we all have our kinks~. There are much worse things that will happen to you here. I’m just trying to help you ease into it~.[/say]")

		saynn("She pulls her paw away, leaving some light scratches on your chin in the process. Ow.")

		saynn("[say=eliza]Choose who is gonna visit you next.[/say]")

		saynn("[say=pc]Again?..[/say]")

		saynn("[say=eliza]Yeah. And the checkup after that will be our last one. So decide wisely~.[/say]")

		# (Has a choice between Rahi, Tavi, etc)

		# (Then Tell her gets called)
		addChoices()

	if(state == "obey"):
		playAnimation(StageScene.Duo, "kneel", {npc="eliza", bodyState={naked=true}})
		
		setFlag("MedicalModule.Chastity_Event4ObeyedEliza", true)
		
		saynn("You nod and slowly lower yourself to your knees. Your hands are still cuffed so it's a bit hard to balance but you just about manage. Eliza steps closer and gazes down upon you, her cunning smirk is still there.")

		saynn("[say=eliza]Lower. Until you feel the floor.[/say]")

		saynn("You nod and begin to slowly bend forward and lower yourself even lower until you lay your head on the soft carpet underneath.")

		saynn("Eliza purrs softly and places her hind paw on the back of your head while checking something in her datapad.")

		saynn("[say=eliza]That’s a good patient. Allowing yourself to be a footrest, an object, is one of the best forms of obedience.[/say]")

		saynn("She takes off her paw from your head and then raises her long skirt until her black lace panties become visible.")

		saynn("[say=eliza]You know what to do~.[/say]")

		# (Options are Lick and refuse)

		addButton("Lick", "Lick her pussy through the panties", "lick")
		addButton("Refuse", "You’re not gonna lick her panties", "refuse")

	if(state == "refuse"):
		setFlag("MedicalModule.Chastity_Event4LickedPussy", false)
		
		saynn("You shake your head and just get up. Licking her underwear would be too much.")

		saynn("[say=eliza]Aww. It was worth a try.[/say]")

		saynn("Eliza shows you the datapad.")

		saynn("[say=eliza]Choose who is gonna visit you next.[/say]")

		saynn("[say=pc]Again?..[/say]")

		saynn("[say=eliza]Yeah. And the checkup after that will be our last one. So decide wisely~.[/say]")

		# (Has a choice between Rahi, Tavi, etc)

		# (Then Tell her gets called)
		addChoices()

	if(state == "lick"):
		playAnimation(StageScene.SexOral, "lick", {pc="eliza", npc="pc", npcBodyState={naked=true}})
		
		setFlag("MedicalModule.Chastity_Event4LickedPussy", true)
		
		saynn("You raise your head off the floor and follow the lines of Eliza’s thighs as you get under her skirt. Eliza purrs even louder as she feels your warm breath near her panties. You follow your heart and decide to stick your tongue out before giving the black cloth a good lick. Then you do another one, applying more pressure this time and feeling the two mounds that are her pussy lips.")

		saynn("Eliza chuckles softly as she continues to mark things on her datapad. She sneakily rubs your cage with her hind paw while you keep working under her skirt, licking her panties. You’re leaking pre..")

		saynn("[say=eliza]Very good. I probably should have recorded what was the baseline of your behavior before caging you but this data is still Very Much invaluable~.[/say]")

		saynn("She lets you work for a few more seconds before taking a step back and seeing your blushing face.")

		saynn("[say=eliza]Up~.[/say]")

		saynn("Well, at least you got to tease her. You do as she says and get up.")

		saynn("[say=eliza]Choose who is gonna visit you next.[/say]")

		saynn("[say=pc]Again?..[/say]")

		saynn("[say=eliza]Yeah. And the checkup after that will be our last one. So decide wisely~.[/say]")

		# (Has a choice between Rahi, Tavi, etc)

		# (Then Tell her gets called)
		addChoices()
		
func addChoices():
	var firstPickedPerson = getFlag("MedicalModule.Chastity_FirstChosenPerson", "eliza")
	
	if(firstPickedPerson != "eliza"):
		addButton("Eliza", "Pick the doctor", "pick", ["eliza"])
	else:
		addDisabledButton("Eliza", "You have already chosen her")
	
	if(firstPickedPerson != "risha"):
		addButton("Risha", "Pick the guard lynx herm", "pick", ["risha"])
	else:
		addDisabledButton("Risha", "You have already chosen her")
		
	if(firstPickedPerson != "rahi"):
		if(getFlag("RahiModule.Rahi_Introduced")):
			addButton("Rahi", "Pick the shy brown kitty", "pick", ["rahi"])
		else:
			addDisabledButton("Rahi", "You haven't met Rahi")
	else:
		addDisabledButton("Rahi", "You have already chosen her")
		
	if(firstPickedPerson != "tavi"):
		if(getFlag("TaviModule.Tavi_IntroducedTo")):
			addButton("Tavi", "Pick the purple tall cat", "pick", ["tavi"])
		else:
			addDisabledButton("Tavi", "You haven't met Tavi")
	else:
		addDisabledButton("Tavi", "You have already chosen her")
		
	if(firstPickedPerson != "nova"):
		if(getFlag("NovaModule.Nova_SawPC") || getFlag("NovaModule.Nova_Introduced")):
			addButton("Nova", "Pick the guard husky herm", "pick", ["nova"])
		else:
			addDisabledButton("Nova", "You haven't met Nova")
	else:
		addDisabledButton("Nova", "You have already chosen her")

func _react(_action: String, _args):
	if(true):
		processTime(RNG.randi_range(3,8)*60)

	if(_action == "continue1"):
		GM.pc.addPain(20)
	
	if(_action in ["continue2", "magic_wand"]):
		GM.pc.orgasmFrom("pc")

	if(_action == "pick"):
		setFlag("MedicalModule.Chastity_SecondChosenPerson", _args[0])
		setState("tell_who")
		return

	if(_action == "endthescene"):
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Wrists)
		endScene()
		return
	
	setState(_action)

func getDevCommentary():
	return "The first scene where you get some agency. Kinda x3. It's still linear af but you do get a good dilemma. Do you accept that you maybe enjoy anal or not??\n\nIt's also a scene that I had to animate the horsecock dildo for. Just like fuckmachine, its a separate rigged object that has a skeleton and stuff. Just so I would be able to bend it and stuff x3. Otherwise it would probably look kinda stiff."

func hasDevCommentary():
	return true
