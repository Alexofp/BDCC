extends SceneBase

var askedDatapad = false
var askedFreq = false
var askedGrenades = false

func _init():
	sceneID = "Ch5s1PlanningScene"

func _reactInit():
	GM.pc.removeAllRestraints()

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("As you slowly open your eyes.. a sudden gasp escapes your lips when you see Tavi creepily staring at you with a little smile on her face.")

		saynn("[say=pc]W-what the fuck, Tavi..[/say]")

		saynn("You are still in your bed. Tavi is looming over your bed for a bit longer but then straightens her posture and chuckles softly.")

		saynn("[say=tavi]What? I wasn't watching you sleep. And even if I was.. watching your pets sleep is considered normal, okay?[/say]")

		saynn("You slowly get up and rub your eyes.")

		saynn("[say=tavi]I got a plan.[/say]")

		addButton("Another one?", "Which one is it already?", "another_one")
		addButton("Plan?", "Ask about the plan", "ask_plan")
	if(state == "another_one"):
		saynn("[say=pc]Another one? Listen, Tavi.. or Miss Tavi, whoever..[/say]")

		saynn("She flicks your nose.")

		saynn("[say=tavi]I am your Miss, yes.[/say]")

		saynn("The tall feline leans closer, her face showing little emotion apart from the little smile. Seeing her eyes staring at you.. sends shivers down your spine. But then Tavi sighs and lowers her chin.")

		saynn("[say=tavi]And I can't do this without you.[/say]")

		saynn("Tavi reaches one of her paws out and tugs at your collar a little. It's still sitting firmly around your neck.. Too firmly.. The smile disappears.")

		saynn("[say=tavi]I just.. Don't want others to be like me.. I've never had a choice of who I wanna be.. Never had a proper childhood even.. We all deserve to have at least some choice, cutie..[/say]")

		saynn("Hard to argue with that.")

		saynn("[say=pc]What if somebody likes having no choice?[/say]")

		saynn("[say=tavi]That's their choice, cutie.[/say]")

		saynn("Tavi's little smile is there again like it always was.")

		saynn("[say=tavi]Wanna hear what I came up with? I think this plan is the best one yet..[/say]")

		addButton("Sure", "Listen to Tavi's plan", "ask_plan")
	if(state == "ask_plan"):
		playAnimation(StageScene.Duo, "sit", {npc="tavi"})
		saynn("[say=pc]Well, let me hear it..[/say]")

		saynn("Tavi looks around to make sure there is no one around. Then she offers you a chair.")

		saynn("[say=tavi]We.. just pay the captain a visit.[/say]")

		saynn("You cough a little. Is she offering a suicide mission?")

		saynn("[say=pc]Wasn't that the first plan?[/say]")

		saynn("Tavi nods and chuckles.")

		saynn("[say=tavi]But now we know more. About everything.[/say]")

		saynn("[say=pc]I don't know about that, Tavi..[/say]")

		saynn("You try to stand up but Tavi keeps you seated by holding onto your collar. The thing is still sitting around your neck as firm as it was before..")

		saynn("[say=tavi]These collars are our biggest weakness.[/say]")

		saynn("[say=pc]Yeah, they can shock us at any moment.[/say]")

		saynn("Tavi winks.")

		saynn("[say=tavi]They won't if we jam the bluespace signal.[/say]")

		saynn("Huh. They indeed couldn't shock you while the transmitter was out.")

		saynn("[say=pc]The captain probably increased the security near the transmitter. They will expect us.[/say]")

		saynn("[say=tavi]We don't need to touch that one~. All we need is a bigger bluespace crystal than the one in our collars. You know where we can get that~?[/say]")

		saynn("Huh. There aren't that many things that use bluespace.. The only other one that comes to your mind is..")

		saynn("[say=pc]Datapads.[/say]")

		saynn("Tavi pats you on the head.")

		saynn("[say=tavi]Exactly. We will need one datapad.. A bluespace frequency for the collars.. And some grenades.[/say]")

		saynn("You raise a brow and tilt your head to the side. Tavi sees your confusion and giggles.")

		saynn("[say=tavi]Not the normal grenades. Aphrodisiac ones. Guards use small ones but I know that there is a prototype version with a bigger range.[/say]")

		saynn("That's an interesting list.")

		saynn("[say=tavi]Can you get that for me, cutie?[/say]")

		addAskButtons()
	if(state == "ask_datapad"):
		askedDatapad = true
		saynn("[say=pc]Where can I get a working datapad? Last one didn't last for too long.[/say]")

		saynn("Tavi rubs her chin, thinking.")

		saynn("[say=tavi]Technically.. we don't need the full datapad.. I can make a little signal jammer using the crystal and some electronic parts. So just get one in any condition. As for where..[/say]")

		saynn("The feline looks at the ceiling of your cell, thinking even harder.")

		saynn("[say=tavi]You can try to beat up guards until you find one.. or..[/say]")

		saynn("A wide smile appears on Tavi's face.")

		saynn("[say=tavi]Or you can find Nova. I'm pretty sure she has one.[/say]")

		saynn("Nova? The husky that humiliated Tavi? Interesting.")

		saynn("[say=tavi]She won't give it to you willingly of course.[/say]")

		saynn("Tavi leans in closer to your ear.")

		saynn("[say=tavi]But feel free to be a little rough with her. That puppy will love it, trust me.[/say]")

		saynn("Tavi straightens her posture again, still smiling wide.")

		saynn("[say=tavi]Datapads have cameras by the way~. Might come handy to stop her from coming after you.[/say]")

		addAskButtons()
	if(state == "ask_freq"):
		askedFreq = true
		saynn("[say=pc]Collar frequency? Where can I get that?[/say]")

		saynn("[say=tavi]Check the computers in engineering. I saw it while we were trying to communicate with the Syndicate.. But I don't remember it.. It's just a string of letters and numbers.[/say]")

		if (askedGrenades):
			saynn("So both the grenades and the frequency are somewhere in engineering.. Good. Makes it a little easier.")

		else:
			saynn("Right. The engineering..")

		addAskButtons()
	if(state == "ask_grenades"):
		askedGrenades = true
		saynn("[say=pc]Why would you need those grenades? And where can I get them?[/say]")

		saynn("[say=tavi]They will be perfect to cause a little.. panic. You will see. As for where..[/say]")

		saynn("Tavi hums and rubs her feline snout.")

		saynn("[say=tavi]Since it's still a prototype.. It must be somewhere in engineering. You will have to look around for them, cutie.[/say]")

		if (askedFreq):
			saynn("So both the grenades and the frequency are somewhere in engineering.. Good. Makes it a little easier.")

		else:
			saynn("Right. The engineering..")

		addAskButtons()
		if (false):
			addButton("Nothing", "You shouldn't see this", "accept_task")
	if(state == "accept_task"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("[say=pc]Alright, I will try to get all of that.[/say]")

		saynn("As you get up, Tavi walks up closer to you and scrtiches you behind the ear. Such a simple gesture.. But her feline claws always feel so good..")

		saynn("[say=tavi]Such a good little pet..[/say]")

		saynn("[say=pc]Can't you help me though, Miss Tavi?..[/say]")

		saynn("[say=tavi]I'm afraid not. I shouldn't get anywhere close to Nova after.. the last time. And engineering.. you know it better than I do by this point..[/say]")

		saynn("That's fair. You lean into the scritches.")

		saynn("[say=pc]What about Kait.. I did talk to her and..[/say]")

		saynn("She cuts you off.")

		saynn("[say=tavi]Is that problem solved, cutie?[/say]")

		saynn("You nod softly.")

		saynn("[say=tavi]Then don't worry about her for now, she can't stop us.[/say]")

		saynn("Tavi gives you a big hug and prepares to leave your cell. She stops near the entrance and looks at you.")

		saynn("[say=tavi]We're close. I can feel it. This time everything is gonna be different.[/say]")

		saynn("The feline steps out of your cell. And that means.. it's time for you to go too.")

		addButton("Continue", "See what happens next", "endthescene")
func addAskButtons():
	if(!askedDatapad):
		addButton("Datapad?", "Ask where you can get the datapad", "ask_datapad")
	if(!askedFreq):
		addButton("Frequency?", "Ask where you can find out the bluespace frequency", "ask_freq")
	if(!askedGrenades):
		addButton("Grenades?", "Ask where you can get the grenades", "ask_grenades")
	if(askedDatapad && askedFreq && askedGrenades):
		addButton("Continue", "See what happens next", "accept_task")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "another_one"):
		processTime(3*60)

	if(_action == "ask_plan"):
		processTime(3*60)

	if(_action == "accept_task"):
		processTime(10*60)
		addMessage("Tasks added!")

	setState(_action)

func saveData():
	var data = .saveData()

	data["askedDatapad"] = askedDatapad
	data["askedFreq"] = askedFreq
	data["askedGrenades"] = askedGrenades

	return data

func loadData(data):
	.loadData(data)

	askedDatapad = SAVE.loadVar(data, "askedDatapad", false)
	askedFreq = SAVE.loadVar(data, "askedFreq", false)
	askedGrenades = SAVE.loadVar(data, "askedGrenades", false)

func getDevCommentary():
	return "This scene.. It just shows that Tavi is a bit strange x3. She is not yandere no. But she doesn't exactly know how to act normal. She is doing her best though x3.\n\nWhy did Tavi make so many plans and why did all of them fail? Well, it's a complicated topic, heh. Obviously I wanted to make the game take longer than 20 minutes to complete x3. And if you actually think about it, you and Tavi do make some progress each time ^^. You learn more about the prison, the captain, the staff, Tavi, the world.\n\nIs the world that I'm showing that deep though? I mean.. I went pretty generic with it x3. Megacorporation vs evil group that tries to destroy it. The point of AlphaCorp is that all of the power is in one person's hands. Since the Alpha x3. And Syndicate.. is made out of a few families. Dictatorship vs Oligarchy basically.. Strong vision vs Strong bond. What about democracy?? We're constantly trying to make democracy work but someone always abuses it, sabotaging the voting process or eliminating other candidates. I'm not saying democracy is bad, I think it's great.. Let people choose what they want. But modern tech proved that we are fooled too easily ;-;. And that will only get worse in the future.\n\nSorry about the politics rant x3. I'm not really a political person. I just wanna be happy ;-;"

func hasDevCommentary():
	return true
