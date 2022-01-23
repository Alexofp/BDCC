extends "res://Scenes/SceneBase.gd"

var pickingBodypartType = BodypartSlot.Legs
var pickedFirstSpeciesHybrid = ""
# Heavy work in progress, the text is just to get a feel for how the game is gonna start

func _init():
	sceneID = "IntroScene"

func _run():
	if(state == ""):
		GM.world.aimCamera("intro_corridor")
		GM.ui.setLocationName("IBS \"Integrity\"")
		
		addCharacter("intro_detective")
		say("[b]You are being escorted[/b] by someone through a number of half-empty corridors, divided with bulky metal doors and occasional little checkpoints. Unknown figure in front of you looks masculine and prefers to watch forward, making it hard to catch the glimpses of his face. But you do [b]notice his grey wolf tail[/b], swishing behind him, and a leather holster on his belt.\n\n")
		
		say("Some passing by people guide you with their appraising glances, you notice on one of them something that reminds you of [b]a police badge with letters “IIPF” written under it[/b].\n\n")
		
		say("Your eyes are still watery so you blink a lot, it's very noisy in your head, you seem to be suffering from a headache that makes it very hard to gather your thoughts. Looking down at yourself, you notice that [b]you are wearing normal civilian clothing[/b].\n\n")
				
		say("Finally, the wolf stops in front of one of the doors, opens it with his keycard and [b]gestures to step inside[/b]. You take a quick look around, only noticing more of these doors and a lack of any windows.\n\n")
		
		addButton("Step inside", "What can go wrong", "stepinside")

	if(state == "stepinside"):
		GM.world.aimCamera("intro_integoration")
		
		say("You step inside a room with white walls and ceiling tiles. There is only enough room for a long table, two chairs and a light. Both corners of the room seem to have cameras on them.\n\n")
		
		say("The wolf enters the room as well, making you go further before locking the door behind and guiding his attention at you. [say=intro_detective]I can grab a bottle of water if you want[/say]. He then points at a far chair and adds [say=intro_detective]Take a sit please[/say]\n\n")
		
		addButton("Refuse water", "You might be thirsty but it’s fine for now", "sitdown")
		
	if(state == "sitdown"):
		say("You shake your head, causing a slight spike of pain in your head which in turn forces a grunt out of you. You both take your seats, the wolf takes the one that is near the door, blocking the only exit for you.\n\n")
		
		say("[say=intro_detective]Jake Anderson, IIPF, threat assessment division. Can you tell me your name? I will also need some bio information, we can’t seem to find your DNA in the database[/say]. The guy pulls out some kind of tablet and turns it on. You can hear a subtle hum as a fancy blue hologram menu appears. He then takes out a pen and starts to interact with it, sending blue hologram particles to fly in the process.\n\n")
		
		say("Enter your name:")
		
		addTextbox("player_name")
		
		addButton("Confirm", "You say your name", "setname")
		
	if(state == "pickgender"):
		say("Pick your character's gender. This will affect the color of your speech. This can be changed at any point")
		
		addButton("Male", "You're a guy", "setgender", [BaseCharacter.Gender.Male])
		addButton("Female", "You're a girl", "setgender", [BaseCharacter.Gender.Female])
		addButton("Androgynous", "You're something in between", "setgender", [BaseCharacter.Gender.Androgynous])
		addButton("Other", "You're something else", "setgender", [BaseCharacter.Gender.Other])

	if(state == "pickpronouns"):
		say("Pick your character's pronouns. This can be changed at any point")
		addButton("Same as gender", "Use your gender's pronouns", "setpronouns", [null])
		addButton("Male", "He/his", "setpronouns", [BaseCharacter.Gender.Male])
		addButton("Female", "She/her", "setpronouns", [BaseCharacter.Gender.Female])
		addButton("Androgynous", "They/their", "setpronouns", [BaseCharacter.Gender.Androgynous])
		addButton("Other", "It/its", "setpronouns", [BaseCharacter.Gender.Other])
		addButton("back", "Back to picking gender", "pickgender")

	if(state == "pickspecies"):
		say("Pick your character's species")
		var allSpecies = GlobalRegistry.getAllPlayableSpecies()
		for speciesID in allSpecies:
			var speciesInfo = GlobalRegistry.getSpecies(speciesID)
			addButton(speciesInfo.getVisibleName(), speciesInfo.getVisibleDescription(), "setspecies", [[speciesID]])
		addButton("Make Hybrid", "Make a custom hybrid", "pickhybrid1")
		addButton("back", "Back to picking pronouns", "pickpronouns")

	if(state == "pickhybrid1"):
		say("Pick your first species")
		
		var allSpecies = GlobalRegistry.getAllPlayableSpecies()
		for speciesID in allSpecies:
			var speciesInfo = GlobalRegistry.getSpecies(speciesID)
			addButton(speciesInfo.getVisibleName(), speciesInfo.getVisibleDescription(), "pick2species", [speciesID])
			
		addButton("back", "Back", "pickspecies")

	if(state == "pick2species"):
		say("Pick your second species")
		
		var allSpecies = GlobalRegistry.getAllPlayableSpecies()
		for speciesID in allSpecies:
			if(pickedFirstSpeciesHybrid == speciesID):
				continue
			
			var speciesInfo = GlobalRegistry.getSpecies(speciesID)
			addButton(speciesInfo.getVisibleName(), speciesInfo.getVisibleDescription(), "setspecies", [[pickedFirstSpeciesHybrid, speciesID]])
		
		addButton("back", "Back", "pickhybrid1")

	if(state == "pickedspecies"):
		say("You are a "+GM.pc.getSpeciesFullName())
		say("\n----\n")
		
		var bodyparts = GM.pc.getBodyparts()
		var allSlots = BodypartSlot.getAll()
		for slot in allSlots:
			var slotName = BodypartSlot.getVisibleName(slot)
			if(!bodyparts.has(slot) || bodyparts[slot] == null):
				say(slotName+": None\n")
				continue
			
			var bodypart = bodyparts[slot]
			say(slotName+": "+bodypart.getName()+"\n")
		
		addButton("Confirm", "I like it", "pickbreastsize")
		
		for slot in allSlots:
			var slotName = BodypartSlot.getVisibleName(slot)
			addButton(slotName, "Change this", "pickbodypart", [slot])
		addButton("back", "Back to picking species", "pickspecies")

	if(state == "pickbodypart"):
		say("Choose")
		
		addButton("Back", "go back", "pickedspecies")
		var playerSpecies: Array = GM.pc.getSpecies()
			
		var allbodypartsIDs = GlobalRegistry.getBodypartsIdsBySlot(pickingBodypartType)
		for bodypartID in allbodypartsIDs:
			var bodypart = GlobalRegistry.getBodypart(bodypartID)
			var supportedSpecies = bodypart.getCompatibleSpecies()
			
			for supported in supportedSpecies:
				if(supported in playerSpecies || supported == Species.Any):
					addButton(bodypart.getName(), "change to this", "setbodypart", [bodypart.id])
					break


	if(state == "pickbreastsize"):
		say("Pick your character's breast size")
		addButton("Flat", "Flat breasts will never produce milk", "setbreasts", [BodypartBreasts.BreastsSize.FLAT])
		addButton("A", "A sized breasts", "setbreasts", [BodypartBreasts.BreastsSize.A])
		addButton("B", "B sized breasts", "setbreasts", [BodypartBreasts.BreastsSize.B])
		addButton("C", "C sized breasts", "setbreasts", [BodypartBreasts.BreastsSize.C])
		addButton("D", "D sized breasts", "setbreasts", [BodypartBreasts.BreastsSize.D])
		addButton("back", "Back to picking pronouns", "pickpronouns")

	if(state == "donecreating"):
		say("The wolf nods. [say=intro_detective]Alright. You look slightly lost there. Long story short is that you failed a mindtest procedure. Information that was gathered is enough to link you to the crime that we've been trying to solve. I will be blunt. It’s enough to put you in jail for a while.[/say] He takes a short pause and watches your reaction. [say=intro_detective]And my job here is to figure out why you did it[/say]\n\n")
		
		addButton("I want a lawyer", "You know that it’s a very bad idea to talk to the police", "wantlawyer")
		addButton("I didn't do it", "Admit to nothing", "didntdoit")
		
	if(state == "wantlawyer"):
		say("[say=pc]I won’t speak without a lawyer[/say] you say. You saw all those videos about how damaging it can be to say anything to the police so you cross your arms and put on a mean face.\n\n")
		
		say("Jake sighs. [say=intro_detective]The amount of evidence against you is very high, you’re not doing yourself any favors by denying the facts[/say]. His strict glare drills you. [say=intro_detective]Do you wanna be portrayed as a monster? Fine by me. I’m just trying to give you a chance to redeem yourself and you’re just sitting there, thinking your safe corner will protect you[/say]\n\n")
		
		addButton("Admit to", "Maybe you actually did it..", "admit")
		addButton("No", "Stay silent", "staysilent")
		
	if(state == "staysilent"):
		say("[say=pc]Just give me a lawyer, I’m done talking to you[/say]\n\n")
		
		say("Jake stands up and takes a step towards you. [say=intro_detective]You know what, and I’m done playing games[/say]. He growls and grabs your arm, trying to wrench it behind your back. It catches you off guard but you manage to shove him away.\n\n")
		
		say("But then you realize that his goal wasn’t to wrench your arms. You notice that he holds a used drug injector. You look at your arm and you see a little hole that the needle left. Anger quickly fades, replaced by the strange soothing feeling, your limbs lose their strength. [say=pc]What was that..[/say]. The officer sees that the drug has kicked in and sits back down.\n\n")
		
		say("[say=intro_detective]It’s a sedative. And also a little thing called Truth serum[/say]. Jake relaxes in his chair. [say=intro_detective]Let’s try again. Why did you do it?[/say]\n\n")
		
		say("You suddenly feel like it's very hard to not say what he wants..")

		addButton("Admit to", "Maybe you actually did it..", "admit")
		
	if(state == "didntdoit"):
		say("[say=pc]What do you mean, I didn’t do anything[/say]. Your mind is still hazy, it's hard to contrentate and the officer's words begin to settle panic into you.\n\n")
		
		say("[say=intro_detective]You don’t get it, we’re long past that.[/say] Jake tilts his head slightly and puts away his tablet. [say=intro_detective]We have evidence and your best option right now is to explain exactly what happened[/say]. Jake leans towards you and tries to keep eye contact while you look away, shivering. [say=intro_detective]Otherwise, as you know, people always assume the worst. Do you wanna be painted as a monster by them? I'm here to help you. It happens. Anyone can make a mistake. But we can work through it[/say]\n\n")
		
		addButton("Admit to", "Maybe you actually did it..", "admit")
		addButton("No", "Stay silent", "staysilent")
	
	if(state == "admit"):
		say("You look down at your hands, at your opened palms. They’re shaking. Millions of thoughts suddenly rush through your head. You don’t want to confess, it would be the end of your life. But what other choice is there? You look at the officer for approval, seeing his understanding eyes, before tilting your head down\n\n")
		
		addButton("I killed", "Admit that you killed someone", "ikilled")
		
	if(state == "ikilled"):
		say("[say=pc]I.. I found a gun. Well, not found.. but you know.. Someone gave it to me[/say]. You place your fist on the table and focus your glance on it. [say=pc]And I shot a guy with it..[/say]\n\n")
		
		say("Officer nods slightly, he moves his chair even closer to you. [say=intro_detective]And what made you do it?[/say]\n\n")
		
		addButton("Money", "You did because you needed the money", "reasonmoney")
		addButton("Revenge", "You did it for the revenge", "reasonrevenge")

	if(state == "reasonmoney"):
		say("[say=pc]I had to, I had no credits left. Another week and I would be out on the streets. I got this offer. And I had to do it. I truly had no other choice..[/say]\n\n")
		
		say("You tell the officer the whole story, it took a while. But you do feel better.\n\n")
		
		say("Jake stands up and takes something from his belt. [say=intro_detective]Alright. I’m afraid I will have to cuff you. Just a safety thing[/say]. You recoil back slightly but seeing as there is no better choice, you reach your hands forward while he puts tight police cuffs around them. [say=intro_detective]I will be back in a few minutes and we will figure out what to do with you[/say]. Jake exits the room, leaving you alone.\n\n")
		
		addButton("Wait", "What else is there to do", "saidwhy")
		
	if(state == "reasonrevenge"):
		say("You stress your fist. [say=pc]He had it coming, that fucker.. Betraying piece of shit[/say]\n\n")
		
		say("You tell the officer the whole story, it took a while. But you do feel better.\n\n")
		
		say("Jake stands up and takes something from his belt. [say=intro_detective]Alright. I’m afraid I will have to cuff you. Just a safety thing[/say]. You recoil back slightly but seeing as there is no better choice, you reach your hands forward while he puts tight police cuffs around them. [say=intro_detective]I will be back in a few minutes and we will figure out what to do with you[/say]. Jake exits the room, leaving you alone.\n\n")
		
		addButton("Wait", "What else is there to do", "saidwhy")
		
	if(state == "saidwhy"):
		say("With nothing better to do, you sit still and think about what happened. You begin to remember how it all led to this. You were called in to give witness testimony. Something completely unrelated. You hold onto your face. Minutes pass, it feels like forever. The guy lied to you, you’re there for at least an hour already.\n\n")
		
		addButton("Wait more", "What else is there to do", "waitmore")
	
	if(state == "waitmore"):
		say("Suddenly, the door opens and Jake steps inside. And also two more police officers in their fancy gear. Jake moves his chair away to give room and pulls out his tablet again. His face doesn’t show much.\n\n")
		
		say("[say=intro_detective]I’m here to tell you that the court of Armada has found you guilty of first-degree manslaughter. You will be committed to the department of corrections.[/say]\n\n")
		
		say("[say=pc]Huh, what do you mean? Shouldn’t there be a trial? You’re not a judge, hey, HEY![/say]\n\n")
		
		say("The officer stops reading and guides his attention towards you. [say=intro_detective]This is a trial. The judges made their decision. Soon you will be repositioned into the place called Broken Dream Correctional Center where you will be serving your punishment. Your sentence is..[/say]. He looks at the tablet again. [say=intro_detective]Indefinite[/say]. He gestures to the two officers. [say=intro_detective]Put {pc.him} in a holding cell for now, the ship is gonna do an jump to FTL soon[/say]\n\n")
		
		say("Shocked, you struggle to say anything comprehensible, the officers quickly do their task and drag you out of the room.\n\n")
		
		addButton("Cell", "What is even happening", "gocell")
		
	if(state == "gocell"):
		removeCharacter("intro_detective")
		
		say("The next moment you know, you are in a small transport shuttle, in its cargo compartment. It looks like it could fit about 10 prisoners but right now there is only one officer that's guarding you and a pilot behind a metal wall. You can see space through all the transparent windows with all its distant stars and also asteroids, it seems the shuttle is flying through an asteroid belt. Its small size allows it to avoid everything. The guard smirks watching you.\n\n")
		
		say("[sayMale]There is no escape. Unless you know how to breathe in the void. Hah[/sayMale]\n\n")
		
		say("[say=pc]Just.. shut up[/say]\n\n")
		
		say("[sayMale]You better get ready to spread these legs of yours. I heard many stories. You’re fucked. In more ways than one. Pfff[/sayMale]\n\n")
		
		say("The urge to punch him in the face is unbearable. You struggle against your handcuffs and grind your teeth when the guy suddenly points at one of the windows.\n\n")
		
		say("[sayMale]Here[/sayMale]. You turn and look out of the window. Between all the asteroids you see a huge rock, the biggest one, floating in the void with a space station seemingly glued to it. The station looks small from this distance but you do see a few levels to it. [sayMale]That’s where you will spent the rest of your life[/sayMale]\n\n")
		
		say("You try to distance yourself from it all and just relax in your metal seat. The shuttle slowly approaches the hangar, its outside entrance has some kind of energy field that allows the shuttles to pass but keep all the air inside. The engines switch to a vertical thrust as the station’s gravity generator begins to affect the shuttle more. Soft touchdown.\n\n")
		
		say("The guard says [sayMale]We’re here. Now get the fuck out, they’re waiting for you[/sayMale] as he opens the shuttle door and watches you. [sayMale]Oh and. The cuffs.[/sayMale] He stops you to quickly uncuff your hands before shoving you out. [sayMale]They will give you better ones, don’t worry sweetie[/sayMale]\n\n")
		
		addButton("Look around", "Take a good look around", "lookaround")

func _react(_action: String, _args):
	if(_action == "setname"):
		if(getTextboxData("player_name") == ""):
			return
		
		GM.pc.setName(getTextboxData("player_name"))
		
		setState("pickgender")
		return
		
	if(_action == "setgender"):
		GM.pc.setGender(_args[0])
		setState("pickpronouns")
		return
		
	if(_action == "setpronouns"):
		GM.pc.setPronounGender(_args[0])
		setState("pickspecies")
		return
		
	if(_action == "setspecies"):
		GM.pc.setSpecies(_args[0])
		GM.pc.resetBodypartsToDefault()
		setState("pickedspecies")
		return
		
	if(_action == "setbreasts"):
		GM.pc.breasts.size = _args[0]
		GM.pc.updateAppearance()
		setState("donecreating")
		return
	
	if(_action == "pickbodypart"):
		pickingBodypartType = _args[0]
	
	if(_action == "setbodypart"):
		var bodypartID = _args[0]
		var bodypart = GlobalRegistry.getBodypart(bodypartID)
		
		GM.pc.giveBodypart(bodypart)
		
		setState("pickedspecies")
		return
		
	if(_action == "pick2species"):
		pickedFirstSpeciesHybrid = _args[0]
	
	setState(_action)

func _react_scene_end(_tag, _result):
	pass

func saveData():
	var data = .saveData()
	
	data["pickingBodypartType"] = pickingBodypartType
	data["pickedFirstSpeciesHybrid"] = pickedFirstSpeciesHybrid
	
	return data
	
func loadData(data):
	.loadData(data)
	
	pickingBodypartType = SAVE.loadVar(data, "pickingBodypartType", BodypartSlot.Legs)
	pickedFirstSpeciesHybrid = SAVE.loadVar(data, "pickedFirstSpeciesHybrid", "")
