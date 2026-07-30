extends RecruitSceneBase

func _init():
	sceneID = "FerriRecSceneMilkingSadism"

func _reactInit():
	putOn("ferri", "inmatewristcuffs")
	putOn("ferri", "basketmuzzle")

func _run():
	if(state == ""):
		addCharacter("ferri", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Grope, "grope", {pc="ferri", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You ask if your team can supply you with a particular item. There weren't any available but Kait managed to quickly make one out of all the scrap that's around. You keep it hidden for now though.")

		saynn("And so you enter the cell. Ferri is still there, naked, muzzled, and cuffed.")

		saynn("[say=ferri]Mew.. look who finally decided to show up. Gonna unlock me already?[/say]")

		saynn("You approach her and give her exposed tits a nice juicy smack, causing them to jiggle against each other, her cyan nips bobbing in many directions.")

		saynn("[say=ferri]Ow..[/say]")

		saynn("[say=pc]"+str(ch1("You talk too much, brat.", "That's what you get, slut.", "You're just a worthless little slut."))+"[/say]")

		saynn("Ferri huffs through the basket mask.")

		saynn("[say=ferri]..Meanie.[/say]")

		saynn("Oh, she doesn't know half of it.")

		saynn("Your hands find her chest.. her massive breasts, heavy and soft. Her nips have already gotten a little stiff. You squeeze them together, seeing if anything would come out.")

		saynn("[say=ferri]M-mew..[/say]")

		saynn("You press your thumbs into her soft flesh, massaging deep circles around her areolas. Then you pinch her nips and pull on them gently.")

		saynn("[say=ferri]Mmhh-..[/say]")

		saynn("Nothing comes out still. Ferri is not lactating. But you're curious if you can make her lactate.")

		saynn("[say=pc]"+str(ch1("You might fall so you better sit on the floor.", "Down to the floor, now.", "Down to the floor, now."))+"[/say]")

		saynn("Ferri tilts her head.. but then she sees what you have brought..")

		addButton("Continue", "See what happens next", "apply_stick")
	if(state == "apply_stick"):
		playAnimation(StageScene.BreastFeeding, "tease", {pc="ferri", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Your hand is holding a makeshift cattle prod. It looks like a metal rod that's wrapped in electrical tape. It has 2 copper wires exposed at the tip.. and a small power cell duct-taped to the handle.")

		saynn("You press the switch.. causing blue sparks between the wires to appear.")

		saynn("[say=ferri]..h-hey..[/say]")

		saynn("[say=pc]"+str(ch1("You heard me.", "Obey, whore.", "Are you really that stupid? Obey."))+"[/say]")

		saynn("Ferri huffs and lowers herself down, her ears flat with the head.")

		saynn("[say=ferri]What are you gonna do with that..[/say]")

		saynn("You don't answer, instead just pressing the tip against the side of her left breasts. Just below the nipple.")

		saynn("[say=ferri]..wait![/say]")

		saynn("You trigger the prod.")

		saynn("ZAP!")

		saynn("[say=ferri]Ah![/say]")

		saynn("A sharp crack of blue light. Ferri's whole body jerks, her back arches. A strangled cry leaves her throat.")

		saynn("Her breasts bounce from her jerking away. But then.. a thin white bead appears at her nipple.")

		saynn("Milk. White, creamy milk is dripping down her cyan areola.")

		saynn("[say=pc]"+str(ch1("There we go. Good girl.", "Look at that. Your tits just needed some encouragement.", "Aww. The dumb bitch's udders finally woke up."))+"[/say]")

		saynn("[say=ferri]M-mow.. are you gonna do-.. AH![/say]")

		saynn("You press the prod to her other breast.")

		saynn("ZAP!")

		saynn("Ferri lets out another stifled noise, her hips bucking, her tail slamming against the floor. Milk squirts from her right nipple in a thin, nice arc.")

		saynn("[say=ferri]It's painful.. huff..[/say]")

		saynn("You look at her hard, perky nips.. and at her crotch that is soaked by now, her little cyan slit is dripping onto the floor.")

		saynn("[say=pc]"+str(ch1("You clearly like it.", "Shut up and enjoy it.", "You're getting wet though. How fucking pathetic."))+"[/say]")

		saynn("You poke her left breast again.. then the right one.. sending small, quick jolts. Each one makes her gasp and twitch, her nips shooting spurts of milk each time.")

		saynn("Soon both of her breasts are leaking steadily, dripping down her fur.")

		saynn("[say=ferri]Mew.. ah..[/say]")

		saynn("[say=pc]"+str(ch1("That's enough warm up. Time to get you set up.", "I'm just getting started. Time to get you set up.", "I'm just getting started. We're not done with those udders."))+"[/say]")

		addButton("Continue", "See what happens next", "ferri_stall")
	if(state == "ferri_stall"):
		playAnimation(StageScene.MilkingStallDuo, "milk", {pc="ferri", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You step out for a second to ask if anyone in your team has any big fluid containers. The best one seems to be a plain metal bucket. It will do.")

		saynn("When you return with the bucket, Ferri is back to looking mean.. but the blushing cheeks give her away.")

		saynn("[say=ferri]A bucket?[/say]")

		saynn("[say=pc]"+str(ch1("Yes, you know why I need it.", "To collect your milk, don't be dumb, slut.", "Why is a cow still talking?"))+"[/say]")

		saynn("You grab Ferri and cuff her paws to one of the pipes that is roughly at your waist height. This makes the dracat bend forward, her butt sticking out while her breasts are now dangling beneath her, still dripping milk onto the floor.")

		saynn("[say=ferri]Hey.. I'm not a cow..[/say]")

		saynn("You don't answer and just place the bucket beneath her chest, causing it to start collecting the lonely drops.")

		saynn("The process is not fast enough by itself so you reach up with your hands, cupping her breasts and then proceeding to squeeze them!")

		saynn("A stream of white milk shoots into the bucket as you do so!")

		saynn("[say=ferri]Ah..[/say]")

		saynn("You milk that dracat. Squeezing and pulling before releasing and then repeating the cycle. And the milk.. it just keeps going.")

		saynn("[say=ferri]That feels.. ah.. s-strange..[/say]")

		saynn("[say=pc]"+str(ch1("Just stand still, I will do all the work.", "Shut up and focus on producing.", "Focus on producing, cow."))+"[/say]")

		saynn("You keep working her breasts, your fingers digging into the soft tissue, squeezing the milk out. Each pull produces a thick spray of her milk.")

		saynn("The fluid level in the bucket raises! Ferri squirms lightly and rubs her thighs together, her tail sneakily caressing her pussy slit.")

		saynn("But after some time, the flow slows down dramatically. You try to squeeze her tits harder but the milk just isn't coming out as easily.")

		saynn("[say=ferri]Ah.. Maybe you've milked me dry..[/say]")

		saynn("You still feel the weight though.")

		saynn("You pick up the cattle prod again and press it against her breast.")

		saynn("ZAP!")

		saynn("Ferri throws her head back and lets out a painful cry, her whole body convulses against the cuffs, her back arching again, her tail whipping sideways.")

		saynn("Her breasts.. erupt with milk again!")

		saynn("[say=ferri]M-mow..[/say]")

		saynn("[say=pc]"+str(ch1("There we go. That's my good little cow.", "Yeah. Keep squirting like that. Don't you dare stop.", "Look at that. You're nothing but a pair of milky tits."))+"[/say]")

		saynn("You keep milking her more. After the zap, the trickle of her milk has turned into a steady flow. The bucket fills faster now, the fluid level is way above half!")

		saynn("[say=ferri]Mrowrl.. ah..[/say]")

		saynn("Ferri moans into the air, her legs keep rubbing together, her cyan eyes are unfocused..")

		saynn("[say=ferri]..moo..[/say]")

		saynn("So cute, she is making cow noises now. Milk sprays from her nips in the form of many thin fountains.")

		saynn("Eventually the flow dies down again.. so you zap the dracat's tits again!")

		saynn("[say=ferri]Ah.. moo-..[/say]")

		saynn("Her body locks up for a second but she seems to be getting used to it by now.")

		saynn("And so you keep going, milking that dracat for all of the milk that she's got. You pull and pinch her nips, grope and squeeze her breasts..")

		saynn("The bucket reaches the brim!")

		saynn("You step back, your hands are all wet. When you're done milking Ferri, she just hangs limply by her cuffs, panting, drooling.")

		saynn("[say=ferri]Mew.. meanie..[/say]")

		saynn("[say=pc]"+str(ch1("You did well. I'm impressed.", "Look at you. A mess. A beautiful fucking mess.", "Worthless as a person. But at least you can produce."))+"[/say]")

		saynn("You move the bucket out of the way and then uncuff her paws from the pipe.. causing Ferri to collapse instantly onto the floor. Her eyes struggle to focus on you.. they struggle to focus on anything really.")

		saynn("[say=ferri]M-mew..[/say]")

		saynn("[say=pc]"+str(ch1("If you want more of that, you should obey us. Now have some rest.", "Do what I tell you to do.. and you might just get more of this. Now rest.", "Not bad. You're gonna obey me, cow. Now rest."))+"[/say]")

		saynn("You grab the bucket and head out.")

		saynn("[say=pc]Hey, I got us some grade-A milk.[/say]")

		saynn("Your team might not be very excited about it yet.. but they will certainly grow to like it.")

		addButton("Kait", "Go see what Kait thinks", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
