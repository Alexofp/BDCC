extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RahiChillScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand"})
		
	if(state == ""):
		saynn("You were heading out the cellblock when you noticed a familiar feline waiting and then slowly approaching you. Kitty seems to be acting quite shy, her gaze directed downwards as she gathers enough willpower to start a conversation.")

		saynn("[say=pc]Hey there, Kitten.[/say]")

		saynn("[say=rahi]Oh. Yes, hello.. She was wandering around.. And then she saw you..[/say]")

		saynn("Kitty rubs her snout, then fixes her ponytail, then grabs her wrist with another hand.")

		saynn("[say=rahi]Wanna hang around a bit? You know, just sit somewhere..[/say]")

		addButton("Sure", "Agree to hang out with the kitty", "sure")
		addButton("Busy", "Ask her to do this some other time because you have things to do", "busy")
		addButton("Nah", "Say that you’re not interested at all, this will stop any further interactions from Rahi", "nah")

	if(state == "nah"):
		setModuleFlag("RahiModule", "Rahi_Denied", true)
		
		saynn("[say=pc]Sorry, nothing wrong with you but I’m just not interested.[/say]")

		saynn("Kitty blinks many times in a short time.")

		saynn("[say=rahi]Oh.. that’s okay. She understands.. Meow.. Thanks for the apple..[/say]")

		saynn("She rubs her eyes and walks away, probably to her favorite spot. You are left to wonder if you were too rude.")

		# (stop random events with rahi)

		# (scene ends)
		addButton("Continue", "Continue on your way", "endthescene")

	if(state == "busy"):
		setModuleFlag("RahiModule", "Rahi_ChillCooldown", RNG.randi_range(4, 10))
		
		saynn("[say=pc]I’m deeply sorry but can you find me some other time?[/say]")

		saynn("Kitty’s eyes brighten slightly with hope.")

		saynn("[say=rahi]Of course! Kitty can do that. Take care![/say]")

		saynn("She swiftly dashes away, letting you return to your business.")

		# (a few days cooldown)

		# (scene ends)
		addButton("Continue", "Continue on your way", "endthescene")

	if(state == "sure"):
		setModuleFlag("RahiModule", "Rahi_ChillHappened", true)
		
		saynn("[say=pc]Yeah, sure, we can do that. Know any good spots?[/say]")

		saynn("Kitty is visible bouncing up and down hearing your response, she is probably not realizing that.")

		saynn("[say=rahi]Ohh. She does![/say]")

		saynn("The feline grabs your wrist and tugs you to follow.")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		aimCameraAndSetLocName("yard_firstroom")
		playAnimation(StageScene.Solo, "walk")
		
		saynn("She brings you up to the main hall and then walks you towards the yard. The whole yard area looks like a big garden, many stone pathways have tall greenery by each side. The air here feels quite fresh.")

		saynn("[say=rahi]She will show you her second favorite spot. After the bench.[/say]")

		saynn("[say=pc]Your life isn’t very interesting, is it?[/say]")

		saynn("[say=rahi]It’s.. well, it used to be.[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		aimCameraAndSetLocName("yard_waterfall")
		GM.pc.setLocation("yard_waterfall")
		playAnimation(StageScene.Solo, "sit")
		
		saynn("She brings you to the little blue pond. Around you are a few bushes, stones and a bench. A little waterfall is going down from the top floor where the greenhouses are down into the pond, making it into more of a stream. Kitty takes her spot on the bench.")

		saynn("[say=pc]I can totally see why you like this place.[/say]")

		saynn("You sit near her and try to relax, the firm nature of the bench makes that kinda tough though. The sound of running water is nice, it’s irregular and noisy but also quite calming.")

		saynn("[say=rahi]Kitty is from a cold planet, Ahdomai. Sights like these are incredibly rare there. They began disappearing as more towns were being built.. Thanks to AlphaCorp..[/say]")

		saynn("Kitty strokes her tail and then remembers something.")

		saynn("[say=rahi]Oh. She can offer you something.[/say]")

		saynn("She jumps to her feet and leaps over the pond where a little ledge is. She then sneaks under the waterfall without getting wet and shifts one of the bricks to the side. Under it you notice a little stash with alcohol. Kitty grabs a whiskey bottle, a glass and then leaps back to you.")

		saynn("[say=pc]Where did you get that.[/say]")

		saynn("Kitty puts on a cunning smile as she carefully opens the bottle, as to not attract extra attention.")

		saynn("[say=rahi]One of the guards gave this one to her. She loves whiskey. Wanna try?[/say]")

		addButton("Take a sip", "Accept the offer", "take_a_sip")
		addButton("Nah", "You don’t drink", "nah1")
		

	if(state == "take_a_sip"):
		saynn("[say=pc]Sure[/say]")

		saynn("You take the offered glass and sip out of it. The orange-colored drink is sweet but then it also burns your mouth quite a bit, you cough and breathe through your mouth.")

		saynn("[say=pc]That’s strong.[/say]")

		saynn("You hand the glass back to the brown feline and watch her, she pours some whiskey in and then starts lapping at it with her rough lengthy tongue, it looks kinda cute. You can hear subtle purring coming from her.")

		saynn("[say=pc]Never seen anyone drink like that.[/say]")

		saynn("[say=rahi]It’s not that strong to her anymore.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "nah1"):
		saynn("[say=pc]I’d rather not. Don’t want any staff to spot me drunk.[/say]")

		saynn("[say=rahi]Being drunk usually helps her instead.[/say]")

		saynn("Kitty pours some whiskey into her glass and then starts lapping at it with her rough lengthy tongue, it looks kinda cute. You can hear subtle purring coming from her.")

		saynn("[say=pc]Never seen anyone drink like that.[/say]")

		saynn("[say=rahi]She likes the taste. It’s very sweet.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		saynn("The kitten relaxes in her seat and keeps lapping her whiskey. You spot a slight blush appearing on her cheeks. You both focus on admiring the view. With all the green and blue around you almost forget that you are stuck in a giant metal box floating through space.")

		saynn("The feline sighs.")

		addButton("Hug her", "Make the kitty feel better", "hug_her")
		addButton("Gotta go", "It was nice but you feel it’s enough", "gotta_go")

	if(state == "gotta_go"):
		saynn("You stand up and give the kitty a pat on the head, she mewls and blinks at you.")

		saynn("[say=pc]Thanks for showing me this, you’re a good kitten.[/say]")

		saynn("[say=rahi]Leaving?.. Take care! Thanks for spending some time with her..[/say]")

		# (scene ends)
		addButton("Continue", "Continue on your way", "endthescene")

	if(state == "hug_her"):
		saynn("You put your arm on the feline’s shoulder and pull her closer, giving her a hug. She tilts her head down and rests against you, still with a bottle in her paw.")

		saynn("[say=pc]Something is wrong?[/say]")

		saynn("[say=rahi]It’s much better now.. meow..[/say]")

		saynn("You softly chuckle and headpat the cat.")

		saynn("[say=rahi]She stole this bottle, she lied..[/say]")

		saynn("You raise your brow.")

		saynn("[say=rahi]It’s not like they’re gonna miss it, they got their pockets full.[/say]")

		saynn("You can’t really argue with that logic, your hand just keeps patting the half-drunk kitten.")

		addButton("Kiss her", "Kiss kitten’s cheek", "kiss_her")
		addButton("Gotta go", "It was nice but you feel it’s enough", "gotta_go")

	if(state == "kiss_her"):
		saynn("While she is busy lapping her alcohol you land a little kiss on her cheek, making her blush even harder. She returns the favor by nuzzling you back and purring happily. You wrap your arms around the feline and put her on your lap, she leans in and rests her head on your chest.")

		saynn("You give the kitty a kind look and then just watch the waterfall. It feels like nothing can ruin this moment.")

		saynn("[say=pc]Hey, kitty..[/say]")

		saynn("No response. You look down at her and notice that she is in fact sleeping. Her eyes are closed, ears are drooping down, tail is resting between her legs. You can hear her snoozing subtly. Adorable.")

		addButton("Bring her home", "She can’t be that heavy", "bring_her_home")

	if(state == "bring_her_home"):
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		GM.pc.setLocation("cellblock_orange_nearcell")
		playAnimation(StageScene.Solo, "walk")
		
		saynn("You decide not to mess with her sleep and carefully stand up while holding her. The kitten is quite light, probably the reason why she is so agile. You bring her back to the cellblock and look for her cell. Luckily they are numbered and the number corresponds to the one she has on her uniform. You enter her cell and gently put her into bed. You hide her bottle under the pillow and then cover the feline with a blanket. She doesn’t look to be too disturbed by the change of place, still snoozing away.")

		saynn("Though she suddenly grabs onto you, pulls herself closer and then lands a little kiss on your lips before letting go and landing back onto her firm bed. Is she a sleepkisser?")

		saynn("You leave her cell and continue on your way.")

		# (scene ends)

		addButton("Continue", "What now", "endthescene")
		

func _react(_action: String, _args):
	if(_action in ["follow", "continue", "continue1", "take_a_sip", "hug_her", "kiss_her", "bring_her_home"]):
		processTime(RNG.randi_range(3, 10)*60)
	
	if(_action == "take_a_sip"):
		GM.pc.addIntoxication(0.3)
		
	if(_action == "bring_her_home"):
		if(GM.pc.getPain() > 0):
			GM.pc.addPain(-40)
			addMessage("That made you feel better")
			
		setModuleFlag("RahiModule", "Rahi_NotThereToday", true)

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func getDevCommentary():
	return "I didn't really know at that point where I would go with Rahi while writing this chill scene. But I'm glad I included the stealing and drinking bits, they both are kinda hinting about Rahi's problems ^^.\n\nBut yeah. The game has a lot of.. conflicts. And I just wanted something calm to happen at least once. And Rahi seemed perfect for that. But you know what they say, the good stuff never lasts long..\n\nBtw, I literally never drank alcohol a single time irl x3. I have many other addictions and problems though, so don't worry"

func hasDevCommentary():
	return true
