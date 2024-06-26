extends SceneBase

func _init():
	sceneID = "VionRepeatConversation"

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "stand", {npc="vion"})
		saynn("You are standing in {vion.name}'s cell.")

		if(!getFlag("HypnokinkModule.VionTopicKnown_NoSex")):
			addButton("Sex?", "Up for a fuck?", "ask_sex_fromMain")
			
		addButton("Questions", "You have questions", "questions")
		
		if(getFlag("HypnokinkModule.VionTopicKnown_Hypnotist")):
			addButton("Sessions", "You have time for a hypnotic session", "sessions")
		else:
			addDisabledButton("Sessions", "Learn more for this topic")
			
		if(not getFlag("HypnokinkModule.VionTopicKnown_Hypnotist", false)):
			addDisabledButton("Discount", "Learn more for this topic")
		elif(getFlag("HypnokinkModule.FreebieSessionSample", false)):
			addDisabledButton("Discount", "The first one is free")
		elif(getFlag("HypnokinkModule.RushSubdued", false)):
			addButton("Discount", "Ask about session prices", "discount_onthehouse")
		elif(getFlag("HypnokinkModule.OnTheHouseSessions", 0) > 0):
			addButton("Discount", "Ask about session prices", "discount_onthehouse_temporary")
		elif(not getFlag("HypnokinkModule.KnowAboutRush", false)):
			addButton("Discount", "Ask about session prices", "discount_rush_intro")
		else:
			addButton("Discount", "Ask about session prices", "discount_rush_reminder")
			
		if(getFlag("HypnokinkModule.Vion_HaveDatapad", false)):
			addButton("Use datapad", "See if you can hack it as a hacker", "use_alex_datapad")
			
			
		addButton("Goodbye", "Good for now", "endthescene")
		
		#addButton("DEBUG FIGHT", "Haha get sucker punched", "debug_fight")
		#addButton("DEBUG SEX", "Haha get sucker fucked", "debug_sex")
		#addButton("DEBUG TEXT", "text effects test", "test_effects") 
		
	if(state == "test_effects"):
		saynn("Hypno text: [tornado radius=3.0 freq=2.0 connected=1][pulse color=#FF33FF height=0.0 freq=3.0]Hypnoword[/pulse][/tornado]")
		saynn("Wave: [wave amp=50.0 freq=5.0 connected=1]The quick brown fox jumps over the lazy dog.[/wave]")
		saynn("Tornado: [tornado radius=10.0 freq=1.0 connected=1]The quick brown fox jumps over the lazy dog.[/tornado]")
		saynn("Shake: [shake rate=20.0 level=5 connected=1]The quick brown fox jumps over the lazy dog.[/shake]")
		saynn("Fade: [fade start=4 length=14]The quick brown fox jumps over the lazy dog.[/fade]")
		saynn("Rainbow: [rainbow freq=1.0 sat=0.8 val=0.8]The quick brown fox jumps over the lazy dog.[/rainbow]")
		saynn("Pulse: [pulse color=#00FFAA height=0.0 freq=2.0]The quick brown fox jumps over the lazy dog.[/pulse]")
		saynn("Matrix: [matrix clean=2.0 dirty=1.0 span=50]The quick brown fox jumps over the lazy dog.[/matrix]")
		saynn("Ghost: [ghost freq=5.0 span=10.0]The quick brown fox jumps over the lazy dog.[/ghost]")
		saynn("Corrupt: [corrupt]The quick brown fox jumps over the lazy dog.[/corrupt]")
		saynn("Console: [console freq=5.0 span=10.0]The quick brown fox jumps over the lazy dog.[/console]")
		addButton("Goodbye", "Good for now", "endthescene")
		
	if(state == "questions"):
		saynn("[say=vion]Ask away.[/say]")

		addButton("Sofa", "Ask about the sofa", "ask_sofa")
		
		if(getFlag("HypnokinkModule.VionTopicKnown_Services")):
			addButton("Services", "Ask about services", "ask_job")
		else:
			addDisabledButton("Services", "Learn more for this topic")
		addButton("Sex?", "Up for a fuck?", "ask_sex")
		
		if(not getFlag("HypnokinkModule.Vion_FreedFromCage")):
			if(getFlag("HypnokinkModule.VionTopicKnown_NoSex")):
				addButton("No sex?", "Unusual for a lilac", "ask_sex2")
			else:
				addDisabledButton("No sex?", "Learn more for this topic")
			
		if(getFlag("HypnokinkModule.VionTopicKnown_Backstory")):
			addButton("Long story", "You have plenty of time", "ask_background")
			if(not getFlag("HypnokinkModule.Vion_FreedFromCage")):
				addButton("Chastity", "Ask about the cage", "ask_chastity")
		else:
			addDisabledButton("Long story", "Learn more for this topic")
			if(not getFlag("HypnokinkModule.Vion_FreedFromCage")):
				addDisabledButton("Chastity", "Learn more for this topic")
		
		addButton("Done", "No more questions", "")
		
	if(state == "ask_sofa"):
		saynn("You sit on the sofa's armrest.")

		saynn("[say=pc]This thing looks heavy. Dragging it in here, you must be stronger than you look.[/say]")

		saynn("[say=vion]If only. I had help from some fellow inmates who appreciate my services.[/say]")

		saynn("[say=pc]And the guards just let you get away with it?[/say]")

		saynn("[say=vion]Well, if they dont they might have to explain why they never disposed of the thing properly like they were supposed to. Can't blame them for not wanting to bother - you ever try to carry a sofa into an elevator?[/say]")

		saynn("Fair point.")
		
		setFlag("HypnokinkModule.VionTopicKnown_Services", true)

		addButton("Back", "", "questions")
	if(state == "ask_job"):
		saynn("[say=pc]So when you say services...[/say]")
		
		saynn("{vion.name} holds up a hand to stop you.")
		
		saynn("[say=vion]Not what you're thinking of, I assure you.[/say]")
		
		saynn("[say=vion]Actually, my occupational skillset happens to remain somewhat useful even in a prison. I am... hm. I [i]was[/i] a licensed hypnotist.[/say]")

		saynn("Skepticism must have shown on your face, because {vion.name} quickly follows up:")
		
		saynn("[say=vion]Not the kind you'd find in cheap movies or adult-only novellas. I don't promise miracles and can't make people think they're frogs or anything like that. Think of it more as guided relaxation and basic therapy.[/say]")
		
		saynn("[say=pc]And you get a lot of use out of that, do you?[/say]")
		
		saynn("[say=vion]Is that surprising? Plenty of people in a prison like this that could use some escapism. Plenty more that want to be able to better control their less desirable impulses.[/say]")

		saynn("You consider that for a moment. Put like that, it does sound like there's some merit to the idea.")
		
		saynn("He winks at you and adds:")
		
		saynn("[say=vion]If you're doubtful, you can always give it a try yourself. The first one's free![/say]")
		
		setFlag("HypnokinkModule.VionTopicKnown_Hypnotist", true)
		
		addButton("Back", "", "questions")
	if(state == "ask_sex" || state == "ask_sex_fromMain"):
		if(not getFlag("HypnokinkModule.Vion_FreedFromCage")):
			saynn("You figure there's no reason to beat around the bush with a lilac.")
			saynn("[say=pc]You up for a fuck?[/say]")
			saynn("He closes his eyes for a moment and sighs.")
			saynn("[say=vion]I am empathically [i]not[/i].[/say]")
			saynn("Well, that was unexpected.")
			setFlag("HypnokinkModule.VionTopicKnown_NoSex", true)
		else:
			saynn("[say=pc]You up for a fuck?[/say]")
			saynn("[say=vion]Not at the moment, no.[/say]")

		addButton("Back", "", "questions" if state == "ask_sex" else "")
	if(state == "ask_sex2"):
		saynn("Your eyes linger on the color of his uniform.")

		saynn("[say=vion]...well go on, ask.[/say]")

		saynn("[say=pc]Alright. Usually lilacs are a little more...[/say]")

		saynn("[say=vion]Slutty?[/say]")

		saynn("[say=pc]Yeah.[/say]")

		saynn("He shrugs.")

		saynn("[say=vion]Long story short, I prefer my amorous adventures to be a little less [i]casual[/i]. Besides that, my preferred position is not currently an option.[/say]")

		saynn("He pulls aside his shorts for a moment, allowing you to catch a glimpse of metal in between his legs. Oof. That must be frustrating.")

		setFlag("HypnokinkModule.VionTopicKnown_Backstory", true)
		
		addButton("Back", "", "questions")
	if(state == "ask_background"):
		saynn("[say=pc]I've got time. What's the long story?[/say]")

		saynn("[say=vion]If you say so.[/say]")

		saynn("He leans back.")

		saynn("[say=vion]The usual lilac here? Got caught selling their body on the wrong street corner, or with the kind of videos in their datapads that society's decided are not acceptable. Want to know how I ended up here?[/say]")

		saynn("You gesture for him to continue.")

		saynn("[say=vion]Turns out, when your boyfriend has some worrying possessive tendencies, you should make sure said tendencies were not inherited from his father. And, indeed, that said father is not the CTO of a major technological conglomerate.[/say]")

		saynn("He stands up and begins pacing around the room.")

		saynn("[say=vion]One night, I wake up to a half dozen goons breaking down my door. Before I can even manage to protest, they throw a bag over my head and drag me off. Two hours of shivering in a cold dark cell later, I get tossed straight into a courtroom![/say]")

		saynn("[say=vion]From what I gathered during that sham trial, Daddy Dearest seemed to think I was trying to brainwash his precious offspring into a sex slave. Though personally, I suspect my bank account simply didn't have enough zeroes in it for his liking.[/say]")

		saynn("He pauses.")

		saynn("[say=vion]I have to give the old man credit though. An actual kangaroo for a judge, that was inspired.[/say]")

		saynn("[say=vion]Either way, after ten minutes without me getting a word in I get a guilty verdict, get tossed back in that cell and the very next day I'm shipped off to a questionably-legal space prison facility in the middle of nowhere.[/say]")

		saynn("He leans against the wall and crosses his arms.")

		saynn("[say=vion]So yes, not your usual lilac.[/say]")

		addButton("Back", "", "questions")
	if(state == "ask_chastity"):
		saynn("[say=pc]So I take it Dr. Quinn's up to her usual shenanigans?[/say]")

		saynn("You gesture in the direction of his crotch. He chuckles.")

		saynn("[say=vion]Hah, I wish. Then I might be able to [i]do something[/i] about it. No, this is one last gift from my ex. One of the most premium cages on the market, actually, a DeLoxe S3-Karat model. I don't have access to a device to input the password on, and anyway the one I know will have expired by now![/say]")
		
		saynn("He huffs.")
		
		saynn("[say=vion]Nothing short of of a sub-molecular disassembler is getting this off without castrating me in the process. And for some inexplicable reason, cutting tools are in very short supply in a high-security prison facility.[/say]")

		saynn("[say=vion]Funny how the usually ever so diligent guards seemed to overlook it during the intake process, isn't it?[/say]")

		saynn("He idly kicks at the chair, making it rattle across the floor. You suspect {vion.name} does [i]not[/i] find the joke very funny.")

		setFlag("HypnokinkModule.VionTopicKnown_Chastity", true)
		addButton("Back", "", "questions")
	if(state == "discount_rush_intro"):
		saynn("[say=pc]Your skills don't exactly come cheap.[/say]")

		saynn("[say=vion]Yes, I'm aware. The truth is, I would prefer to price my sessions more conservatively, but I'm rather pressed for credits.[/say]")

		saynn("[say=pc]Why? It isn't like you have to pay rent in here, at least.[/say]")

		saynn("[say=vion]Yes, well, there's a certain individual that has made it his business to make certain demands of me. So far I've been able to pay him off instead, but the asking price's been going up over time. I do have my suspicions about his motives, but given that it's [i]literally[/i] my ass on the line, I'd rather not wager on a hunch.[/say]")

		saynn("[say=pc]What's he like? Maybe I can deal with him for you.[/say]")

		saynn("[say=vion]Are you sure? Not the kind of person you want to make angry. He's... well... he's big.[/say]")

		saynn("Vion's eyes unfocus for a moment as he stares at nothing, presumably experiencing a vivid memory of unusual size.")

		saynn("[say=pc]Big?[/say]")

		saynn("[say=vion]Trust me, when you see him you'll agree its an accurate descriptor. Anyway, he's a hybrid of equine and dragon. Neon blue hair in a mohawk, dark furred. High sec inmate, goes by the name of Rush. When he's not wandering around and harrasing me, you can usually find him in the gym or the high security cellblock.[/say]")

		saynn("[say=pc]Okay, I'll see what I can do.[/say]")

		saynn("[say=vion]Just... be careful. I don't want a broken spine on my conscience. Maybe consider pursuing, well, alternate methods of diplomacy?[/say]")

		addButton("Back", "", "")
		
	if(state == "discount_onthehouse"):
		saynn("[say=pc]How much will this cost me?[/say]")
		
		saynn("[say=vion]For you? Sessions are on the house.[/say]")
		
		addButton("Back", "", "")
	if(state == "discount_onthehouse_temporary"):
		saynn("[say=pc]How much will this cost me?[/say]")
		
		saynn("[say=vion]For you? Sessions are on the house, at least until Rush bothers me again.[/say]")
		
		addButton("Back", "", "")
		
	if(state == "discount_rush_reminder"):
		saynn("[say=pc]How are things on the price front?[/say]")

		saynn("[say=vion]Rush passed by again recently. Sorry, until he's dealt with, I have to ask for my regular price.[/say]")
		
		addButton("Back", "", "")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "sessions"):
		runScene("VionSessionSelect")
		return
		
	if(_action == "discount_rush_intro"):
		setFlag("HypnokinkModule.KnowAboutRush", true)
		
	if(_action == "discount_rush_reminder"):
		if(getFlag("HypnokinkModule.RushDealStruckAtLeastOnce", false)):
			setFlag("HypnokinkModule.RushCausingMoreTrouble", true)
		
	if(_action == "use_alex_datapad"):
		endScene()
		runScene("VionFreed")
		return
		
	if(_action == "debug_fight"):
		runScene("FightScene", ["vion"], "guardfight")
		return
	if(_action == "debug_sex"):
		runScene("GenericSexScene", ["pc", "vion"], "domsex")
		return

	setState(_action)
