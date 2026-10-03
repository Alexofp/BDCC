extends RecruitSceneBase

func _init():
	sceneID = "ElizaRecSceneBloodplayBreathplay"

func _reactInit():
	getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
	putOn("eliza", "LatexStraitjacket")
	putOn("eliza", "oldcollar")

func _run():
	if(state == ""):
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You prepare everything that you will need for this on a little tray.. a glass shard, extremely sharp and dangerous, carefully cleaned.. some bandages.. and a small bottle of antiseptic. Luckily, Eliza had most of it on her.. except for the shard.")

		saynn("Then.. you enter the cell. Eliza Quinn is standing still, her collar leashed to the pipe above her, preventing her from most things. She can't even sit on a chair that's here.")

		saynn("Her tits are still out.. and her eyes are still really angry.")

		saynn("[say=eliza]A piece of glass? So barbaric.. Could have at least stolen a scalpel..[/say]")

		saynn("[say=pc]"+str(ch1("...", "That's all that I need to make you regret everything.", "Someone like you doesn't deserve more."))+"[/say]")

		addButton("Continue", "See what happens next", "shard_neck")
	if(state == "shard_neck"):
		playAnimation(StageScene.GropeBehind, "neck", {pc="eliza", npc="pc"})
		saynn("You pick up the shard and get behind the feline, your hand brings the sharp edge close to her chest, touching her pretty fur but avoiding any damage.")

		saynn("[say=eliza]You think I'm scared of a little cut?[/say]")

		saynn("[say=pc]"+str(ch1("...", "You should be.", "You will be."))+"[/say]")

		saynn("[say=eliza]You're not gonna kill me.[/say]")

		saynn("Gotta make her feel like you will then.")

		saynn("The glass shard hovers just above her left nipple. One quick, precise flick later.. and you cut a shallow line across her breast. A thin, red trail appears soon after. Eliza's breath hitches slightly.. but otherwise.. She takes it well. Her eyes watch the lonely drops of blood appearing from the little cut.")

		saynn("[say=eliza]It looks kinda hot..[/say]")

		saynn("Who are you to deny her the pleasure then? You press the sharp edge against the same breast.. and make another cut, perpendicular to the first, leaving another bleeding shallow wound. Eliza flinches and bites her lip, a shaky noise of pain gets trapped in her closed maw.")

		saynn("Her nips get visibly stiffer..")

		saynn("[say=pc]"+str(ch1("...", "This is just the start.", "Cry for me, you worthless thing."))+"[/say]")

		saynn("Next, you bring the glass to her right breast.. and press the pointy tip directly against her nipple. Gradually, you put more force into it, making the make-shift weapon dig into her sensitive nub.. all the while it gets even stiffer.")

		saynn("This makes the feline start hissing from pain. That's not all though. Your free hand finds her neck.. and squeezes her throat.. just enough to make breathing annoyingly hard to do.. this quickly makes the hiss die down.")

		saynn("[say=eliza]Mhh.. ghh-..[/say]")

		saynn("Eliza parts her lips and breathes deeply.. while the sharp edge draws blood.. directly from her perky nipple. Eliza arches her back slightly, your grip on her neck makes her raise her chin high.")

		saynn("Lonely drips of her red nectar make their journey down the curve of her tits.. and then start hitting the cold floor. Plap, plap..")

		saynn("[say=pc]"+str(ch1("...", "How long can you last like this?", "What a mess you are."))+"[/say]")

		saynn("[say=eliza]I'm not.. hh.. scared.. screw you..[/say]")

		saynn("What a brave tongue she got. You could just increase the pressure on her throat.. steal the air completely.. but you got a better idea.")

		addButton("Continue", "See what happens next", "cut_tongue")
	if(state == "cut_tongue"):
		saynn("You bring the glass away from her chest.. and instead let it hover in front of her face. Eliza's eyes track it, still shining with defiance.")

		saynn("[say=eliza]What now? Gonna carve your name into me? That ain't gonna change anything.[/say]")

		saynn("[say=pc]"+str(ch1("...", "Open your mouth. I need your stupid tongue.", "Stick out your tongue."))+"[/say]")

		saynn("When you bring the shard closer to her lips.. her ears flatten against her head a bit.")

		saynn("[say=eliza]Fuck you.[/say]")

		saynn("You try to catch her tongue.. but she holds her mouth shut. Seconds pass.. you get impatient.")

		saynn("You bring your free hand up and cover her nostrils shut. Her eyes go wide immediately.. probably because she knows this trick.")

		saynn("She tries to breathe through her mouth.. but you're already scrapping the glass against her fangs.. threatening.")

		saynn("And so she holds her breath. Ten seconds.. twenty.. Her chest starts trying to gasp. Thirty.. Her lips part involuntarily, trying to sneakily grab any air. You cover her nostrils harder.")

		saynn("For the first time.. panic begins to flicker in her angry eyes.")

		saynn("After about a minute, her mouth opens wide to take a big breath. That's when you strike. A quick, precise flick of the glass.. it makes the feline yelp from sudden pain.. followed by a thin line opening up across the surface of her barbed tongue. Blood starts dripping from it immediately, pooling in her mouth.")

		saynn("You release her nose. She sucks in the air desperately.")

		saynn("[say=eliza]Ugh.. hh.. f-fuchk..[/say]")

		saynn("The wound makes it harder for her to speak clearly. She doesn't want to swallow the blood so she spits it out when enough gathers.")

		saynn("That's when you grab her ponytail and yank on it, forcing her to throw her head back.. and keep it like that, her maw directed up, her mouth.. becoming a perfect well.")

		saynn("The blood has nowhere to flow but down, along her wounded tongue, into her throat.")

		saynn("It doesn't take long before Eliza starts gagging.. choking.. her whole body jerking against yours.")

		saynn("[say=eliza]Ghh-.. kff-.. hhkk-..[/say]")

		saynn("[say=pc]"+str(ch1("...", "Yeah, drown, bitch.", "Your own useless body working against you. So sad."))+"[/say]")

		saynn("Your other hand finds her neck again, gripping tight, enough to make every swallow a struggle.")

		saynn("[say=eliza]Ghh-hhh.. KHHhh..[/say]")

		saynn("Her eyes are still extremely wide.. tears begin gathering at the corners. She tries to break free.. desperately.. She even tries to step on your {pc.feet}.. so rude of her. You lean close to her ear.")

		saynn("[say=pc]"+str(ch1("...", "Is this how you want to die? Choking on your own blood?", "Is this how you want to die? Choking on your own blood?"))+"[/say]")

		saynn("More and more blood drips down her throat. Some of it is probably in her lungs now.. making her cough. She is getting weaker and weaker.. her eyes frantically looking around the dirty cell that she is in.")

		saynn("A few seconds later.. something changes in her.. something shatters.")

		saynn("Her ears go flat again.. her anger goes poof.. swallowed by something else.. fear. Real fear.")

		saynn("She starts tapping her rear paw against the floor.. many times. Her whole body language shifts, shoulders slumping, her head shaking.. as much as your hand allows it.")

		saynn("You hold her there a moment longer.. just to make sure she understands. And then, you finally release her ponytail, letting her head fall forward.")

		saynn("Eliza gasps, spitting blood onto the floor and proceeding to cough wildly.")

		saynn("[say=eliza]KGGHHhh.. GHHhkh.. KHhh-.. HGHHh..[/say]")

		saynn("Her voice sounds raspy, her body shaking. She makes her best effort to talk.")

		saynn("[say=eliza]I.. I.. f-fuh.. I w-will do whatever.. t-the fuck you want..[/say]")

		saynn("She keeps spitting the blood. Her cute pastel fur has received that bright scarlet accent to it.")

		saynn("You put the shard away and pick up the bandages. Methodically, you clean and wrap the cuts on her breasts. Then you wipe the blood from her mouth.")

		saynn("[say=eliza]The g-green stuff.. it's a coagulant.. hit me with it.. please..[/say]")

		saynn("From the tray, you take a small syringe. And fill it with the drug that she shows. Then you inject it into her bloodstream.")

		saynn("Soon, the bleeding from her tongue starts to lessen.")

		saynn("And with that.. you grab the tray and step out.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
