extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "IntroScene"

func _initScene(_args = []):
		var uniform = GlobalRegistry.createItem("CasualClothes")
		
		GM.pc.getInventory().equipItem(uniform)

func _run():
	if(state == ""):
		aimCamera("intro_corridor")
		setLocationName("IBS \"Integrity\"")
		playAnimation(StageScene.Solo, "stand")
		
		addCharacter("intro_detective")
		saynn("[b]You follow a tall male figure through a long corridor[/b]. You don’t see any windows, everything is lit up by industrial-looking lights. Your head hurts, you suddenly realize that [b]you forgot where you are[/b] and what you are doing here. You panic, your eyes jump form point to point, gray floor tiles, dark-blue concrete walls, an unknown person’s back, what the heck is going on here. [b]Two guys walk by[/b], you notice their blue uniform and [b]badges that say “IIPF”[/b]. You also notice holsters and belts with equipment, the guy that you’re following has these too. You look down at your hands. No, you’re not cuffed.")

		saynn("The person that is escorting you [b]stops near one of the doors[/b], unlocks it and [b]invites you in[/b].")

		saynn("[say=intro_detective]Come in and take a seat.[/say]")

		saynn("You look at him, the [b]guy has clear canine features[/b] and a wolf mane, behind him is a fluffy tail. [b]You decide to step inside[/b]. It’s a well-lit small room with just a table, two metal chairs and a security camera in the corner. Panic is still there, the guy pushes you in slightly and locks the door behind before sitting down on one of the chairs himself and watching you.")

		addButton("Take a seat", "Well, what else is there to do", "take_a_sit")

	if(state == "take_a_sit"):
		aimCamera("intro_interogation")
		setLocationName("Interogation room")
		playAnimation(StageScene.Solo, "sit")
		
		saynn("You sit on the second chair, the one that is further from the only exit. You take a better look at the guy. He is clearly a wolf, quite tall, in his forties, gray fur, black pants and a white t-shirt.")

		saynn("[say=intro_detective]Name is Jake, IIPF, threat assessment division. If you want some water let me know, I can bring a bottle for you[/say]")

		saynn("[b]Your head is still fuzzy[/b], you could clearly use some water but you shake your head and refuse. The wolf’s voice seems quite calm, his eyes do follow your motions but he is mostly relaxed in the chair.")

		saynn("[say=intro_detective]No? Got it, just wanna make sure you have everything. I will ask you some questions if that’s okay. You’re not under arrest and are free to leave at any point. But I would really appreciate your cooperation, we need information.[/say]")

		saynn("Jake grabs a tablet-looking device from his belt and starts interacting with the holo-screen, sending a few bright particles flying with each swipe that he does. You interlock your fingers, unsure how to react.")

		saynn("[say=intro_detective]Strange, we couldn’t find your dna-print in the database. Tell me your name. I will also need your sex, race and a few more things, shouldn’t take too long.[/say]")

		addButton("Continue", "Enter your name", "askforname")

	if(state == "askforname"):
		say("Enter the name of your character:")
		
		var textBox:LineEdit = addTextbox("player_name")
		var _ok = textBox.connect("text_entered", self, "onTextBoxEnterPressed")
		
		addButton("Confirm", "Choose this name", "setname")
		

	if(state == "donecreating"):
		playAnimation(StageScene.Solo, "sit")
		saynn("Jake nods and puts the tablet away for now, he leans forward on the chair and directs his eyes at you.")

		saynn("[say=intro_detective]Alright, {pc.name}. How are you feeling?[/say]")

		saynn("[say=pc]I have so many questions. Why am I here?[/say]")

		saynn("[say=intro_detective]Don’t worry, it’s just a side effect of the procedure, the memories will soon start returning to you.[/say]")

		saynn("[say=pc]What procedure?[/say]")

		saynn("The guy straightens his posture again and moves his chair closer to you.")

		saynn("[say=intro_detective]Its short name is mindtest. It involves a machine that scans the brain and tries to find any inconsistencies in the neuron patterns, nerve cells that are close together but disconnected from the rest of the network. That's where our brain puts things that we are trying to keep away from ourselves and others, things that we are trying to hide. Usually these are some tragic memories like the deaths of relatives.[/say]")

		saynn("[say=pc]That doesn’t sound very ethical.[/say]")

		saynn("[say=intro_detective]It’s entirely automated. Going through each person's memory by hand would take years. An AI does it instead, it’s a completely self-contained process, nothing leaks out but the answer.[/say]")

		saynn("You raise a brow at his words.")

		saynn("[say=pc]So what does that mean?[/say]")

		saynn("The guy shifts even closer to you, the room starts to feel even smaller than it was, you’re cornered. Jake’s tone shifts to a more intimidating one.")

		saynn("[say=intro_detective]That’s what I was gonna ask you. You failed the procedure. Recently, you commited a crime, {pc.name}.[/say]")

		saynn("[b]You’re being confronted[/b]")

		addButton("I didn’t do it!", "There is no way", "didntdoit")
		addButton("Lawyer up", "You’re not gonna tell him shit", "wantlawyer")
		
	if(state == "didntdoit"):
		saynn("[say=pc]There is no way, I didn’t do anything, your machine failed, not me[/say]")

		saynn("Your hands shake, the panic returns.")

		saynn("[say=intro_detective]You don’t get it, we’re long past that. My job here is to figure out what you did and why you did it. And even if you don’t tell me anything, the fact alone that the mindtest has marked you is enough to put you in jail for a long time, to isolate you. I’m just here to help you explain everything. So you don’t look like a monster in the eyes of others. It might not look like that but I’m your only friend at the current moment.[/say]")

		saynn("You put your hands on the table and stare at a wall. Your mind is racing. If what he says is true then you are very screwed either way.")

		saynn("[say=pc]How can you be so sure?[/say]")

		saynn("The wolf sighs.")

		saynn("[say=intro_detective]We've been doing this for hundreds of years. I've been in the police force for 20 years. Minds are predictable, there are no secrets left anymore.[/say]")

		saynn("Jake is focused on you, arms crossed. The silence is so loud.")

		saynn("[say=intro_detective]Anyone can make a mistake, {pc.name}. But we can work through it. Together.[/say]")

		addButton("Confess", "Maybe you actually did it..", "admit")
		addButton("Stay silent", "Fuck that guy", "staysilent")
		
	if(state == "wantlawyer"):
		saynn("You frown and look away.")

		saynn("[say=pc]I’m not gonna tell you anything. I know how it works. Give me a lawyer.[/say]")

		saynn("Jake tilts his head and puts on a mean face.")

		saynn("[say=intro_detective]The amount of evidence we have is enough. You don’t have to tell me anything. But denying the facts won’t do you any favors. I’ve seen innocent people and you don’t look like one of them.[/say]")

		saynn("His gaze drills you.")

		saynn("[say=intro_detective]When people don’t know the truth, they assume the worst. I can help you. But only if you wanna help yourself first.[/say]")

		addButton("Confess", "Maybe you actually did it..", "admit")
		addButton("Stay silent", "Fuck that guy", "staysilent")
		
	if(state == "staysilent"):
		saynn("Now you feel angry. You grit your teeth and keep your mouth shut, arms crossed. Jake sees that and tilts his head down before exhaling audibly, seems like he is about to give up.")

		saynn("[say=intro_detective]’Fraid you leave me no choice[/say]")

		saynn("Jake stands up, moves the chair back and [b]grabs something off of his belt[/b]. It looks like some kind of [b]drug injector[/b]. Then he arms it and [b]begins closing distance[/b].")

		saynn("[say=pc]Hey! What is that[/say]")

		saynn("He doesn’t stop, he tries to swiftly inject it into your neck but you shove him away. And then again. He shows his fangs and growls at you before lunging forward and grabbing your arms. He is strong, you can only push him away so long before he overpowers you. [b]You feel a prick[/b]. Ow. What a fucker. Jake puts the used thing away and leaves you alone, taking a seat again. You’re still angry but.. [b]your head starts to feel.. light..[/b]")

		saynn("[say=intro_detective]It’s called truth serum. You made me do it, {pc.name}[/say]")

		saynn("[say=pc]Is t-that how police upholds j-justice now.. with drugs..[/say]")

		saynn("The guy looks away for a second.")

		saynn("[say=intro_detective]You’re gonna be fine. We can’t let bad people out on the streets. That is our job. Let’s try again. What did you do? Tell me exactly.[/say]")

		saynn("You suddenly feel like [b]you really wanna tell him the truth[/b]..")
		
		addButton("Confess", "Maybe you actually did it..", "admit")
	
	if(state == "admit"):
		saynn("[say=pc]Fine.. I will tell you everything[/say]")

		saynn("Wolf nods.")

		saynn("[say=intro_detective]I’m listening. Can go as slow as you want, you’re in a safe environment.[/say]")
		
		addButton("Innocent", "Tell him that you got set up. (You will start as a general block inmate)", "crime_innocent")
		addButton("Thief", "You stole a large sum of money (You will start as a general block inmate)", "crime_theft")
		addButton("Murderer", "You killed someone as a revenge (You start as a high security inmate)", "crime_murder")
		addButton("Prostitute", "You did some naughty stuff for money (You will start as a sexual deviant inmate)", "crime_prostitution")
		
	if(state == "crime_innocent"):
		saynn("[say=pc]I am innocent. I truly am. It was a setup. Someone really wanted to get rid of me.[/say]")

		saynn("The guy chuckles softly.")

		saynn("[say=intro_detective]Oh yeah? You know how many people say that? Who wanted to get rid of you?[/say]")

		saynn("[say=pc]Um..[/say]")

		saynn("[say=intro_detective]Name wouldn’t be enough, you need proof[/say]")

		saynn("[say=pc]I don’t..[/say]")

		saynn("[say=intro_detective]Even if you were, you failed a mindtest. And I’m afraid the judge has no reason to not believe the mindtest. Machines can’t lie[/say]")

		saynn("You feel helpless, you keep trying to come up with a worthy excuse but there is nothing. After about ten seconds of silence Jake stands up and grabs something from his belt, metal handcuffs.")

		saynn("[say=intro_detective]I understand you, I really do. I will be back in a few minutes. I will have to cuff you, safety precautions.[/say]")

		saynn("You offer him your hands, showing no resistance and he restraints you before leaving the room, leaving you alone with your thoughts.")

	if(state == "crime_theft"):
		saynn("You exhale all the air.")

		saynn("[say=pc]First of all, I had to, I had no choice, I really needed the money[/say]")

		saynn("[say=intro_detective]People go to work when they need money[/say]")

		saynn("[say=pc]I needed it quick, okay? Not everyone is privileged, not everyone has rich parents or was born in a good place on a wealthy planet. You have no right to judge me. I saw the only opportunity and I took it. Yes, I stole the money, I did it. I’m a thief, criminal, thug, whatever you wanna call me. Try wearing my shoes first. I didn’t kill anyone or ruin anyone’s life.[/say]")

		saynn("The wolf carefully listens to you, his posture is relaxed, his hand rubs his chin.")

		saynn("[say=intro_detective]Mhm. I trust you, I really do. I don’t agree with you but I trust you. Yes, you didn’t ruin someone’s life, you just made it worse, you stole their money, made them feel worse and right now the government has to spend money on you as well. In the end you made this world slightly worse, you’re a net negative. Objectively speaking you are a criminal and you knew exactly what you were doing. You really wanted money you didn’t earn so you’re trying to justify this crime in your head.[/say]")

		saynn("Jake stands up and grabs something from his belt, metal handcuffs.")

		saynn("[say=intro_detective]I will have to cuff you, sit still[/say]")

		saynn("The wolf grabs your hands and cuffs them together. Then he walks towards the exit.")

		saynn("[say=intro_detective]And yeah, I’m not a judge. See you in a few minutes.[/say]")

	if(state == "crime_murder"):
		saynn("[say=pc]I killed a person. And you know what. If I would have a chance, I would do it again, the fucker had it coming.[/say]")

		saynn("[say=intro_detective]You really think so?[/say]")

		saynn("Your eyes glow with hatred, you wanna stand up and punch something but the wolf makes you sit again.")

		saynn("[say=pc]I made the world better, okay? I shouldn’t even be here, I’m not a danger to anyone, I got my revenge.[/say]")

		saynn("[say=intro_detective]Violence only causes more violence. What will you do if someone will try to get revenge for the person you murdered? Have a nice chit-chat? Hating someone doesn’t give you the right to end their life, we’re not animals.[/say]")

		saynn("[say=pc]Whatever you say, I don’t like you.[/say]")

		saynn("Jake stands up and grabs something from his belt, metal handcuffs.")

		saynn("[say=intro_detective]I will have to cuff you, sit still[/say]")

		saynn("The wolf grabs your hands and cuffs them together. Then he walks towards the exit.")

		saynn("[say=intro_detective]I don’t like you either. But I won’t kill for it. Gonna be back in a few minutes.[/say]")

	if(state == "crime_prostitution"):
		saynn("[say=pc]I sold my body on the streets. Gonna call me a slut?[/say]")

		saynn("[say=intro_detective]Do you have a license?[/say]")

		saynn("[say=pc]License? No? Why would I need a license to whore myself out[/say]")

		saynn("[say=intro_detective]Sexual services aren’t really that different from any other types of services, the intergalactic law allows it as long as you have a license. If you can do it for free why shouldn’t you be able to get paid for it. The license proves that you don’t have any STDs or other diseases. You pay taxes and in exchange you get the same benefits as any other worker.[/say]")

		saynn("[say=pc]Well, I don’t have it. My planet doesn’t follow the intergalactic law[/say]")

		saynn("Jake nods.")

		saynn("[say=intro_detective]That’s an offense I’m afraid.[/say]")

		saynn("Jake stands up and grabs something from his belt, metal handcuffs.")

		saynn("[say=intro_detective]I will have to cuff you, safety precautions.[/say]")

		saynn("The wolf grabs your hands and cuffs them together. Then he walks towards the exit.")

		saynn("[say=intro_detective]Gonna be back in a few minutes.[/say]")

	if(state in ["crime_innocent", "crime_theft", "crime_murder", "crime_prostitution"]):
		addButton("Wait", "What else is there to do", "saidwhy")
		
	if(state == "saidwhy"):
		playAnimation(StageScene.Solo, "sit")
		saynn("With nothing better to do, you sit still and think about what happened. You begin to remember everything. You hold onto your face. Minutes pass, it feels like forever. The guy lied to you, you’re there for at least an hour already.")
		
		addButton("Wait more", "What else is there to do", "waitmore")
	
	if(state == "waitmore"):
		saynn("Suddenly, the door opens and Jake steps inside. And also two more police officers in their fancy gear. Jake moves his chair away to give room and pulls out his tablet again. His face doesn’t show much.")

		saynn("[say=intro_detective]I’m here to tell you that the Intergalactic Court of Justice has found you guilty of your charges. You will be committed to the department of corrections shortly.[/say]")

		if(getFlag("Player_Crime_Type") == Flag.Crime_Type.Innocent):
			saynn("[say=intro_detective]The lack of evidence was deemed not important enough to stop the hearings.[/say]")
		elif(getFlag("Player_Crime_Type") == Flag.Crime_Type.Prostitution):
			saynn("[say=intro_detective]Even though paid erotic or sexual services are allowed, by not properly disclosing that you commited tax fraud and put the lives of others in danger.[/say]")
		else:
			saynn("[say=intro_detective]Your crimes were committed with malicious intent, your testimony showed you as a very tainted person.[/say]")


		saynn("[say=pc]Huh, what do you mean? Shouldn’t there be a trial? You’re not a judge, hey, HEY![/say]")

		saynn("The officer stops reading and guides his attention towards you.")

		saynn("[say=intro_detective]This is a trial. The judges made their decision. Soon you will be repositioned into the facility called Broken Dreams Correctional Center where you will be serving the punishment. Your sentence is…[/say]")

		saynn("He looks at the tablet again and takes a short pause.")

		saynn("[say=intro_detective]Indefinite.[/say]")

		saynn("He gestures to the two officers.")

		saynn("[say=intro_detective]Put {pc.him} in a holding cell, transit shuttle is gonna arrive soon[/say]")

		saynn("Shocked, you struggle to say anything comprehensible, the officers quickly do their task and drag you out of the room.")
		
		addButton("Cell", "What is even happening", "gocell")
		
	if(state == "gocell"):
		removeCharacter("intro_detective")
		aimCamera("intro_ship")
		setLocationName("Transport shuttle")
		
		saynn("The next moment you know, you are in a small transport shuttle, in its cargo compartment. It looks like it could fit about 10 prisoners but right now there is only one officer that's guarding you and a pilot behind a metal wall. You can see space through all the transparent windows with all its distant stars and also asteroids, it seems the shuttle is flying through an asteroid belt. Its small size allows it to avoid everything. The guard smirks watching you.")

		saynn("[sayMale]See that? No chance of escaping. Unless you know how to breathe in the void. Hah[/sayMale]")

		saynn("You don’t say anything.")

		saynn("[sayMale]You better be ready to spread your legs. I heard stories. You’re fucked. In many ways. Pfff-[/sayMale]")

		saynn("The urge to punch him in the face is unbearable. You struggle against your handcuffs and grind your teeth when the guy suddenly points at one of the windows.")

		saynn("[sayMale]Here.[/sayMale]")

		saynn("You turn and look out of the window. Between all the asteroids [b]you see a huge rock[/b], the biggest one, floating in the void [b]with a space station seemingly shoved into it[/b]. The station looks small from this distance but you do see quite a few levels to it.")

		saynn("[sayMale]That’s where you will spent the rest of your life.[/sayMale]")

		saynn("You try to distance yourself from it all and just relax in your metal seat. The shuttle slowly approaches the hangar, its outside entrance has some kind of energy field that allows the shuttles to pass but keep all the air inside. The engines switch to a vertical thrust as the station’s gravity generator begins to affect the shuttle more. Soft touchdown. Maybe you will like it here, who knows.")

		saynn("[sayMale]We’re here. Now get the fuck out, they are waiting for you. Oh. And give the cuffs back[/sayMale]")

		saynn("He stops you to quickly uncuff your hands before shoving you out.")

		saynn("[sayMale]Don’t worry cupcake, they will give you better ones[/sayMale]")
		
		addButton("Look around", "Take a good look around", "endthisscene")

func onTextBoxEnterPressed(_new_text:String):
	GM.main.pickOption("setname", [])

func _react(_action: String, _args):
	if(_action == "setname"):
		if(getTextboxData("player_name") == ""):
			return
		
		GM.pc.setName(getTextboxData("player_name"))
		
		#setState("pickgender")
		runScene("CharacterCreatorScene", [], "character_creator")
		return
		

	
	if(_action == "endthisscene"):
		runScene("IntroIntake")
		endScene()
	
	if(_action == "saidwhy"):
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("policecuffs"))
		processTime(1 * 60 * 60 + 15 * 60)
	
	if(_action == "waitmore"):
		processTime(5 * 60)
	
	if(_action == "gocell"):
		processTime(6 * 60 * 60)
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Wrists)
	
	#"crime_innocent", "crime_theft", "crime_murder", "crime_prostitution"
	
	if(_action == "crime_innocent"):
		setFlag("Player_Crime_Type", Flag.Crime_Type.Innocent)
		GM.pc.setInmateType(InmateType.General)
	if(_action == "crime_theft"):
		setFlag("Player_Crime_Type", Flag.Crime_Type.Theft)
		GM.pc.setInmateType(InmateType.General)
	if(_action == "crime_murder"):
		setFlag("Player_Crime_Type", Flag.Crime_Type.Murder)
		GM.pc.setInmateType(InmateType.HighSec)
	if(_action == "crime_prostitution"):
		setFlag("Player_Crime_Type", Flag.Crime_Type.Prostitution)
		GM.pc.setInmateType(InmateType.SexDeviant)
	
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "character_creator"):
		setFlag("Game_PickedStartingPerks", true)
		if(!getFlag("PickedSkinAtLeastOnce")):
			runScene("ChangeSkinScene", [], "the_skin")
		else:
			runScene("PickStartingPerksScene", [], "starting_perks")
	if(_tag == "the_skin"):
		runScene("PickStartingPerksScene", [], "starting_perks")
	if(_tag == "starting_perks"):
		setState("donecreating")

func getDevCommentary():
	return "Heya, today is the 16th of May, 2023, the day that I (Rahi) added support for developer commentary ^^\n\nThis might be the first one you read.. or not.. depends on if you started a new game after turning that option on. But I will try to make these readable out of order so no worries ^^.\n\nWhy did I add this? Isn't this a waste of my time? Isn't this a waste of your time? I dunno, I just felt like adding this.. I like to ramble sometimes and, since my game brings up lots of topics, dark or not, there is a lot to talk about ^^\n\nWill this waste my time and keep you from getting more content? Ideally it shouldn't. Here is a spoiler for you, I only work on my game for a few hours a day x3, usually about 3-4 hours. So like, finishing the work day and then just spilling my thoughts out into the commentary of some scene could be a nice way to.. stay balanced.. I dunno.\n\nI just wanna.. explain some of my choices in these, you know? So expect spoilers in these, lots of them x3\n\nBut yeah. Fun fact, this whole scene was actually rewritten just before I posted the first public version. It was worse before, trust me x3.\n\nI watched a lot of JCS - Criminal Psychology videos on youtube back then and I kinda wanted the game to start with you getting interogated by seemingly a kind/understanding cop that then suddenly turns into a 'bad cop'. I think it's a good way to introduce the players to this dark world.. get them immersed.. or something."

func hasDevCommentary():
	return true
