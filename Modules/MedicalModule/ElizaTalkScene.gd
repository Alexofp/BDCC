extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ElizaTalkScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		if(!GM.main.getFlag(MedicalModule.Eliza_IntroducedMedical)):
			GM.main.setFlag(MedicalModule.Eliza_IntroducedMedical, true)
			
			saynn("Medical wing lobby looks bright, the walls are made out of white concrete and are well-lit by many fluorescent lights. Behind the counter you see a doctor, a familiar face, the one who processed you on the day of your arrival. She is sitting on an office chair and sipping coffee. Her mug seems to be a personal one, your gaze catches the words ‘best mom’ written on it.")

			saynn("She yawns and then notices your presence. She shifts in her chair and quickly fixes her loose hair bang.")

			saynn("[say=eliza]Hey there, inmate. Need something?[/say]")

			saynn("[say=pc]Just wandering around.[/say]")

			saynn("[say=eliza]Well this is the medical wing, a place where the inmates get fixed, one way or another. I’m just one of the doctors, name is doctor Quinn in case you forgot.[/say]")

			saynn("You look around, the wide counter separates the lobby itself from the staff-only area. On both ends of the lobby there are two airlocks with panels that seem to require special access. There is also a way to another room.")

			saynn("[say=eliza]Without special permission you’re only allowed to stay in the lobby. And the nursery.[/say]")

			saynn("[say=pc]Nursery?[/say]")

			saynn("[say=eliza]Yeah. Do you need something, inmate?[/say]")
		else:
			saynn("You approach the counter and are greeted by the familiar feline face. The doc seems to always be sipping coffee out of her mug.")

			saynn("[say=eliza]Dr. Quinn here. Need something?[/say]")

		addButton("Talk", "Ask her some questions", "talk")
		addButton("Appearance", "Take a closer look", "appearance")
		addDisabledButton("Experiments", "Ask to be experimented on")
		addDisabledButton("Milking", "Ask to be milked")
		addButton("Leave", "Do something else", "endthescene")
		
	if(state == "appearance"):
		saynn("Doctor Quinn looks like your typical doctor, she is pretty tall for a feline, about 1.8 meters tall, her fur is of a pastel yellow color with some white and pink accents. Her long hair is made into a ponytail. She is wearing glasses and a white labcoat with her badge attached to it. Under it you can spot a green top and a black knee length skirt. You do spot her wearing some dark transparent tights. She seems to be carrying quite a bit of equipment in her pockets and on her belt, mostly medical stuff but also a shock remote.")

		saynn("Covered by all that clothing you can guess that her bust is a modest C-cup.")

		saynn("You’re too afraid to stick your head under her skirt but you can’t see a bulge between her legs.")

		saynn("Overall, she looks like a cute feline doctor.")
		
		addButton("Back", "Go back", "")
		
	if(state == "talk"):
		saynn("[say=pc]Can I ask you something?[/say]")

		saynn("Doctor shifts in her chair slightly and looks at you.")

		saynn("[say=eliza]Go ahead, inmate.[/say]")
		
		addButton("Best mom?", "Ask her why she has that mug", "best_mom?")
		addButton("Work", "What kind of stuff happens here", "work")
		if(getFlag(MedicalModule.Med_pcKnowsAboutWork)):
			addButton("Pregnancies", "Ask about how the childbirth is handled", "pregnancies")
			addButton("Research", "Ask about what are they researching here", "research")
		else:
			addDisabledButton("Pregnancies", "You don't know about this yet")
			addDisabledButton("Research", "You don't know about this yet")
		if(getFlag(MedicalModule.Med_pcKnowsAboutBreeding)):
			addButton("Milking", "What’s up with that", "milking")
		else:
			addDisabledButton("Milking", "You don't know about this yet")

		addButton("Back", "Go back", "")


	if(state == "best_mom?"):
		saynn("[say=pc]Your mug. Are you a mother?[/say]")

		saynn("Doctor looks at her own coffee mug and sighs audibly.")

		saynn("[say=eliza]Kinda rude to ask that. But.. No, I’m not. And it’s a long story.[/say]")

		saynn("Seems like that item is related to some sad memories.")

		addButton("Continue", "Continue talking", "talk")

	if(state == "work"):
		setFlag(MedicalModule.Med_pcKnowsAboutWork, true)
		
		saynn("[say=pc]Inmates that are beaten up badly end up here?[/say]")

		saynn("Doctor fixes her glasses position with a single finger.")

		saynn("[say=eliza]Well, yeah. We do treat physical traumas here but also much more than that. We do surgeries, dental work, taking care of the pregnancies and the kids. We have a mental ward for the ones who need that kind of help. And we also do research work here as a side business.[/say]")

		saynn("Wow, that’s quite a lot.")

		addButton("Continue", "Continue talking", "talk")

	if(state == "pregnancies"):
		setFlag(MedicalModule.Med_pcKnowsAboutBreeding, true)
		
		saynn("[say=pc]What happens to the inmates that become pregnant?[/say]")

		saynn("[say=eliza]Inmates are allowed to give birth but they can’t keep their children. For obvious reasons. We can help to accelerate the development of the child, modern tech allows for that. After the birth, they are taken away. But they do receive proper treatment. Care, education, work, all of that. They get a chance for a normal life.[/say]")

		saynn("Doctor looks away at a wall for a second, her face shows little emotion.")

		saynn("[say=eliza]You don’t have to worry about any of that, inmate. Inmates that are lactating can help donate their milk here if they want to.[/say]")

		saynn("[say=pc]So you’re saying inmates can be fucked and bred and it’s not discouraged?[/say]")

		saynn("Doctor frowns at you.")

		saynn("[say=eliza]You lost any human rights when you ended up here, inmate. Sterilizing everyone would be too costly.[/say]")

		saynn("Now that’s a system, of course inmates are gonna breed with each other if given the chance. And it doesn’t seem like the prison has any financial problems from what you can tell.")

		addButton("Continue", "Continue talking", "talk")

	if(state == "research"):
		setFlag(MedicalModule.Med_pcKnowsAboutTests, true)
		
		saynn("[say=pc]What types of research are you doing here?[/say]")

		saynn("Doctor’s eyes show excitement after that question.")

		saynn("[say=eliza]Many in fact. Here, in the lab, we synthesize new types of medicine and medical drugs. That is actually my job primarily. But we also do prototype tech testing and other kinds of experiments that are usually banned in normal environments.[/say]")

		saynn("You take a second to process all that. Drugs? Tests? All of that sounds very concerning.")

		saynn("[say=pc]What do you mean banned? You talking about using inmates as guinea pigs? How safe is all that?[/say]")

		saynn("Doctor exhales and sips some more coffee before answering.")

		saynn("[say=eliza]We have all the paperwork, everything is fully legal. AlphaCorp pays top coin for any breakthroughs. Safety and morality concerns are not your problems, inmate. For each successful test you will be paid with work credits, enough to cover the risks.[/say]")

		saynn("Well at least it’s for free, you will be paid with currency that has no value literally anywhere else, wow!")

		addButton("Continue", "Continue talking", "talk")

	if(state == "milking"):
		setFlag(MedicalModule.Med_pcKnowsAboutMilking, true)
		
		saynn("[say=pc]If I’m lactating I can donate milk here?[/say]")

		saynn("Doctor smiles.")

		saynn("[say=eliza]Yes, we have an array of milking stations here. We can collect milk, seed, male and female pre-ejaculate. You will be paid of course but some do it just cause they enjoy it.[/say]")

		saynn("[say=pc]Well, that’s nice, I guess.[/say]")

		addButton("Continue", "Continue talking", "talk")


func _react(_action: String, _args):
	if(_action == "giveapple"):
		GM.main.setFlag(RahiModule.Rahi_GaveApple, true)
		GM.pc.getInventory().removeXOfOrDestroy("appleitem", 1)
	
	if(_action == "who_are_you"):
		GM.main.setFlag(RahiModule.Rahi_AskedName, true)
	
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
