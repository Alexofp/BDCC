extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TaviQuest2CaptainsOffice"


func _run():
	if(state == ""):
		addCharacter("captain")
		addCharacter("tavi")
		addCharacter("risha")
		playAnimation(StageScene.Duo, "defeat", {npc="captain", npcAction="stand"})
		
	if(state == ""):
		aimCameraAndSetLocName("cd_captain_office")
		#playAnimation(StageScene.Solo, "defeat")
		
		saynn("The doors close behind you as you enter the captain's office. You look around, speechless. Walls are made out of red wood with an added golden trim, many carpets are covering the floor. The tall ceiling features a grand chandelier in a gothic style. A lot of antique design is incorporated into the furniture, there is even a huge old school radio in the corner. The center of a room is taken by a big wooden desk and a rich chair made out of black leather. Then there are two more smaller chairs before it and a few little tables placed around the room, a bookshelf. The main desk features a golden name plate saying ‘Cpt. Wright’, some writing utensils and a lamp. Everything looks pretty clean.")

		saynn("Behind the table you see the captain, just standing there with a book in his hand and reading glasses on.")

		saynn("[say=captain]I was thinking about this. Do you know why the wars will never end?[/say]")

		saynn("[say=tavi]Cut the crap.[/say]")

		saynn("Tavi swiftly asserts the room and dashes forward but her attempt at jumping over the table was quickly stopped by the captain pressing a button on his remote. Yours and Tavi’s collars send a sudden strong shock through your bodies, you drop to your knees and suffer while watching Tavi doing the same. Captain speaks through his headset.")

		saynn("[say=captain]Cuff ‘em up for me.[/say]")

		saynn("Two guards come in and apprehend you both. Tavi tries to resist but she is met with more shock that sends her body to squirm around on the floor.")

		saynn("[say=captain]Thanks, I will handle it from here. At ease.[/say]")

		saynn("One of the guards is Risha, a heavily armored lynx with a mean face.")

		saynn("[say=risha]Really? I wanted to have some fun though.[/say]")

		saynn("[say=captain]Fine, stay.[/say]")

		saynn("Your hands were cuffed behind your back, you rattle them and realize you can’t escape their bounds.")

		saynn("The captain puts away the book and walks up to restrained Tavi. He looks down at her while she offers him her growl.")

		saynn("[say=captain]Anti-war people can’t win any. That’s why. If you wanna win - you pick the strongest side. It’s simple, really.[/say]")

		saynn("He helps Tavi to get up, though she shoves him back immediately. Then he helps you too while Risha is watching.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("[say=tavi]I don’t choose sides.[/say]")

		saynn("[say=captain]Then someone will make the choice for you. Listen, Tavi. You’re very lucky to not be spaced after everything that you did. But I don’t take easy paths.[/say]")

		saynn("[say=tavi]Fuck off.[/say]")

		saynn("He sits on the corner of his desk and grabs Tavi by the chin. She avoids it and even tries to bite back. The captain sighs.")

		saynn("[say=captain]Gag her.[/say]")

		saynn("[say=risha]With pleasure. Now don’t move, slutty red.[/say]")

		saynn("Risha produces a ball gag and grabs Tavi by her hair before shoving the ball into her mouth and securing the straps behind her back. She growls and hisses but any word she tries to say now comes out as very muffled.")

		saynn("[say=captain]I tried to help you. You will be punished.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		saynn("Then he directs his attention at you.")

		saynn("[say=captain]As for you, I think there is still hope. Listen, Tavi is a very manipulative person, your best bet is to avoid her. You know what she did?[/say]")

		saynn("[say=pc]Assasination, blackmail, something about destroying a station.[/say]")

		saynn("The captain chuckles slightly. Tavi glares at you both while Risha holds her still.")

		saynn("[say=captain]First, she gathers information. Through social engineering. It could be her presenting herself as a prostitute for hire for example. She doesn’t have to leave her computer, she just uses someone’s photos and pulls all the info out of someone. Then she blackmails them.[/say]")

		saynn("Tavi tries to kick the guy but Risha puts the unruly inmate into a choke grab.")

		saynn("[say=captain]And it works. The more they chat with her the more data she has against them. And then she orders them to kill her real target. She is like a virus.[/say]")

		saynn("[say=pc]What if her targets were bad people?[/say]")

		saynn("The captain tilts his head down.")

		saynn("[say=captain]That’s what the prisons are for. That is why I’m here. Justice can not be accomplished through the use of violence. Violence only leads to even more violence.[/say]")

		saynn("Tavi’s mouth is forced open for so long she starts to drool.")

		saynn("[say=risha]This bitch clearly likes it. Can I fuck her later?[/say]")

		saynn("[say=captain]What was her plan anyway? Calling Syndicate? Do you know what the Syndicate is?[/say]")

		saynn("[say=pc]Not really.[/say]")

		saynn("[say=captain]They’re slavers. Capturing planets and entire worlds one by one. Strong people become their army, beatiful ones become their sex slaves. And the rest.. well.. it’s their currency and cheap workforce. AlphaCorp has been at war with them for many years. What do you think would happen to you if they arrive?[/say]")

		saynn("Tavi makes muffled noises and struggles against her restraints. She looks at you and shakes her head rapidly. Risha presses a stun baton to Tavi’s crotch and sends another painful shock through her.")

		saynn("[say=risha]This whore is so unruly.[/say]")

		saynn("The captain stands up and produces a riding crop.")

		saynn("[say=captain]Bend her over the table.[/say]")

		saynn("Risha chuckles and does as the captain says, bringing Tavi to the desk and bending her forward, providing easy access to her butt for spanking and such. She voices her complaints with lots of muffled incoherable noises.")

		saynn("Captain fidgets with the riding crop in his hands.")

		saynn("[say=captain]So. You have a choice. You can let her keep manipulating you, I don’t care that much about some inmate, this whole facility is too big to fail from you two. The second option is, you forget about Tavi. And join my side. I have loyal guards but not that many loyal inmates. You help me, provide me with inside information, do little tasks for me, and I can help you to get out of this prison quicker. What will it be?[/say]")

		saynn("Tavi glares at you while awaiting her faith.")

		# (Options are Stay with Tavi, Betray Tavi)

		addButton("Stay with Tavi", "You’re not gonna betray her now (Tavi route, you can’t change this choice later)", "stay_with_tavi")
		addButton("Betray Tavi", "Spying for the captain doesn’t seem like such a bad idea (Good inmate route, you can’t change this choice later)", "betray_tavi")

	if(state == "betray_tavi"):
		saynn("[say=pc]Well. Fine. I will do what you want.[/say]")

		saynn("[say=captain]Great. You made a right choice.[/say]")

		saynn("Tavi glares at you, she looks exactly into your eyes. You see pure hatred. Looks like you just made an enemy. Though her evil gaze is quickly broken when the captain raises his riding crop and delivers a powerful strike on Tavi’s butt. She grunts and growls back, she is not here to give the guy satisfaction. Risha holds the feline still when she tries to struggle.")

		saynn("[say=risha]Keep still, painslut, don’t get too excited.[/say]")

		saynn("He continues to her crop marks until her butt is glowing green, due to her blood. By the end of it, Tavi is whimpering after every hit and arches her back. She is panting heavily and the captain just chuckles. The captain looks at you.")

		saynn("[say=captain]I will find you when I need you. Just enjoy your stay for now.[/say]")

		saynn("Then he directs his gaze at Risha.")

		saynn("[say=captain]Drop this inmate at the cellblock, I will finish with Tavi here.[/say]")

		saynn("[say=risha]Aww, but captain. I wanted to breed her cute green pussy.[/say]")

		saynn("Tavi buckles and receives a firm spank from the captain.")

		saynn("[say=captain]Not in my office. Obey the orders.[/say]")

		saynn("[say=risha]Fine, time to go inmate.[/say]")

		saynn("She leashes you and walks you out the office. Captain continues to deliver more strikes to the rebellious Tavi.")

		saynn("(( There is no good inmate route yet so you will be brought back to the choice, sorry ))")
		addButton("Continue", "See what happens next", "continue1")

	if(state == "stay_with_tavi"):
		saynn("[say=pc]I’m not gonna betray Tavi and be a spy for you, no way.[/say]")

		saynn("[say=captain]Well. Then you'll join her.[/say]")

		saynn("The captain walks behind you and moves you forward until you’re in line with Tavi. Then he bends you over the desk.")

		saynn("[say=captain]To be frank, I don’t care. I just enjoy seeing inmates squirm and blush.[/sat]")

		saynn("He raises his riding crop and delivers a strike to your {pc.thick} butt. You yelp and try to protect yourself with your cuffed hands. Captain then does the same to Tavi, giving her feline butt a firm blow. She grunts and growls back, she is not here to give the guy satisfaction.")

		saynn("[say=risha]Keep still, painslut, don’t get too excited.[/say]")

		saynn("He continues to leave you two crop marks until your butts are glowing red. By the end of it, Tavi is whimpering after every hit and arches her back. You both panting heavily and the captain just chuckles.")

		saynn("[say=captain]Drop them at the cellblock, I think they got their lesson.[/say]")

		saynn("[say=risha]Aww, but captain. I wanted to breed the purple one.[/say]")

		saynn("Tavi buckles and receives a firm spank from Risha.")

		saynn("[say=captain]Not in my office. Obey the orders.[/say]")

		saynn("[say=risha]Fine, time to go, inmates.[/say]")

		saynn("She leashes you both and walks you out the office. Captain holds his palms together behind his back and watches you all leave.")

		addButton("Continue", "Oww", "continue2")

	if(state == "continue2"):
		playAnimation(StageScene.Solo, "walk")
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		removeCharacter("captain")
		
		saynn("Risha brings you back into the cellblock and unleashes you.")

		saynn("[say=risha]Now get lost before I change my mind.[/say]")

		# (scene end)

		addButton("Continue", "That was an adventure", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		GM.main.setModuleFlag("TaviModule", "Tavi_Quest2Completed", true)
		addMessage("Task completed")
		addExperienceToPlayer(50)
		endScene()
		return


	setState(_action)


