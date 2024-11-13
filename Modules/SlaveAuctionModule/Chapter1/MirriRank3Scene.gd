extends SceneBase

var lastChoice = ""

func _init():
	sceneID = "MirriRank3Scene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		lastChoice = getFlag("SlaveAuctionModule.r2outcome", "")
		# (( # kiss nohate luxeisright silence ))
		if (lastChoice == "kiss"):
			saynn("Mirri smiles and sticks her tongue out at you.")

			saynn("[say=mirri]Hey, lover, look, I reached the third rank! Yay and stuff.[/say]")

		elif (lastChoice == "nohate"):
			saynn("Mirri purrs softly.")

			saynn("[say=mirri]Hey, look, I reached the third rank! Yay and stuff.[/say]")

		elif (lastChoice == "luxeisright"):
			saynn("Mirri pokes your shoulder.")

			saynn("[say=mirri]I know you'd probably rather be sitting in my dad's lap but look, I reached the third rank![/say]")

		else:
			saynn("Mirri pokes your shoulder.")

			saynn("[say=mirri]I remember that our last talk didn't end so well. But look, I reached the third rank.[/say]")

		saynn("She points at her name in the big list of slavers.")

		saynn("[say=pc]Good job, you totally deserve it.[/say]")

		saynn("Her feline ears do pick up on the sarcasm notes in your voice.")

		saynn("[say=mirri]I wasn't sitting on my pretty butt all day, I was enslaving and selling too.. And fuck me, it's a lot of work breaking these stupid slaves..[/say]")

		saynn("[say=pc]So you know how I feel now, huh.[/say]")

		saynn("Mirri sits on the corner of her desk and pouts.. but then throws her head back and sighs at the ceiling.")

		saynn("[say=mirri]Yeah-h-h-h. I ain't gonna tell you I'm sorry. I'm too fucking tired for that.[/say]")

		saynn("She was this close to being nice to you for once.")

		saynn("[say=pc]Sounds like you need to reset.[/say]")

		saynn("[say=mirri]Reset? That's what the mind rewriter does, it resets your brain down to a blank slate.. maybe I could use something like that..[/say]")

		saynn("Her feline eyes look at you again.")

		saynn("[say=mirri]I could use some rest though.[/say]")

		saynn("She looks at the walls.. and then at her soft-looking bed. Bed that you would kill for..")

		saynn("[say=mirri]Nah.. There is no rest for me here. This place only reminds me of pointless grind and constant suffering.[/say]")

		saynn("Mirri genuinely looks tired, even her tail just lazily hangs from the side of her desk.")

		saynn("[say=pc]Prison has a few cozy spots.[/say]")

		saynn("A slight tilt of her head, her ears perk.")

		saynn("[say=mirri]Oh yeah?[/say]")

		addButton("Never mind", "(Cancel date) You'd rather not do anything with this woman", "cancel_date")
		addButton("Waterfall", "Show Mirri the waterfall", "waterfall")
	if(state == "cancel_date"):
		saynn("After what Mirri did, she doesn't deserve your kindness.")

		saynn("[say=pc]Actually, scratch that.[/say]")

		saynn("Mirri stays quiet.. and then nods a few times.")

		saynn("[say=mirri]Your prison is a giant dump, you don't have to give me more confirmation.[/say]")

		saynn("[say=pc]Rude. Your room is not much better.[/say]")

		saynn("[say=mirri]You couldn't have been more wrong actually. I fucking hate how clean it is.[/say]")

		saynn("[say=pc]You just hate everything.[/say]")

		saynn("You hear growling.")

		saynn("[say=mirri]You're very observant, slave. Just leave me alone, I need to think.[/say]")

		saynn("Best to just let her stir in her own emotions for now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "waterfall"):
		saynn("[say=pc]There is a good place. A bit loud though.[/say]")

		saynn("[say=mirri]You know, anything is better than total void. Let's go![/say]")

		saynn("Mirri springs back to her hind paws and heads to the teleporter.")

		saynn("A blue rift illuminates the space.. It leads back to your cell.")

		saynn("[say=mirri]C'mon, what are you waiting for?[/say]")

		addButton("Lead her", "Bring Mirri to the place", "waterfall_tp")
	if(state == "waterfall_tp"):
		aimCameraAndSetLocName("yard_waterfall")
		playAnimation(StageScene.GivingBirth, "idle", {pc="mirri"})
		saynn("The journey to the waterfall wasn't too eventful. Mirri's armor.. even if incomplete.. seems to be enough to fool most staff members.")

		saynn("You lead Mirri to the prison's yard.")

		saynn("[say=mirri]Green.. I like it here. Can't remember the last time I saw any greenery.[/say]")

		saynn("You follow the neat stone pathways.. and after a few turns.. you end up near a little waterfall.")

		saynn("[say=mirri]Ohhh![/say]")

		saynn("Mirri rushes to it and dips her paw into the artificial pond beneath it.")

		saynn("[say=mirri]I hate water.. but this feels nice.[/say]")

		saynn("She lays down near and just watches the water flow.. while you just sit on the bench nearby.")

		saynn("[say=mirri]Sounds like.. static.. white noise, you know?[/say]")

		saynn("[say=pc]Yeah, too loud?[/say]")

		saynn("She shakes her head.")

		saynn("[say=mirri]It's perfect.. Wanna cuddle maybe?[/say]")

		saynn("Cuddling with that crazy Syndicate bitch?.. Although, she doesn't seem to be very crazy at the moment..")

		saynn("Her blue eyes catch your hesitation.")

		saynn("[say=mirri]Listen.. I know that I'm annoying sometimes.[/say]")

		saynn("[say=pc]Sometimes?[/say]")

		saynn("Her feline gaze pierces you.. but quickly pulls its daggers out.")

		saynn("[say=mirri]Yes, only sometimes. C'mon, it's a nice view. Get over here, I won't kill you if you do. It was your idea after all.[/say]")

		saynn("That's one way to invite someone.")

		addButton("Cuddle Mirri", "Rest together", "cuddle_mirri")
	if(state == "cuddle_mirri"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="mirri"})
		saynn("You get off the bench and join Mirri near the water, your hands wrap around her girly curves and pull her close to your chest.")

		saynn("The high-pitched sounds of running water are now interlaced with a quiet purring.")

		saynn("The peaceful view soothes your mind as well. A nice break from the slave business..")

		saynn("[say=mirri]Thank you. I don't have anyone to hang out with.[/say]")

		saynn("[say=pc]Wait. Don't you have a whole family?[/say]")

		saynn("[say=mirri]I do. It's a huge ass family.. But, you know, you know how dad usually talks with me already. He is busy with his stupid wars and politics..[/say]")

		saynn("Mirri catches herself getting loud again and just stays quiet for some time, her paw playing with the water.")

		saynn("[say=mirri]..I think I know what's up with him and me.. I always knew, deep inside..[/say]")

		saynn("[say=pc]And what is that?[/say]")

		saynn("[say=mirri]Isn't it obvious? I'm different. Different from him. Different from the rest of the family. I don't even have a black tail like they all do.. and that's like, the whole thing of my family.. haha.[/say]")

		saynn("That's.. not wrong. Mirri wraps her red tail around her and yours waists.. like a rope.")

		saynn("[say=pc]What about the coords? Wasn't it because of them?[/say]")

		saynn("She shrugs.")

		saynn("[say=mirri]Yeah, that too. I guess he likes me less and less with each day because of my.. stubbornness. Still, he will have to accept me and my decision at some point. What other choice does he have? I'm Blacktail, his genes are in me.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "cancel_date"):
		processTime(3*60)

	if(_action == "waterfall"):
		processTime(3*60)

	if(_action == "waterfall_tp"):
		processTime(3*60)

	if(_action == "cuddle_mirri"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["lastChoice"] = lastChoice

	return data

func loadData(data):
	.loadData(data)

	lastChoice = SAVE.loadVar(data, "lastChoice", "")
