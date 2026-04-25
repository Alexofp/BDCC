extends SceneBase

func _init():
	sceneID = "DomCh1s1AgreeScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("[say=pc]I think I might just accept your offer.[/say]")

		saynn("[say=kait]Haha. Yes. Perfect. You made the right choice, trust me. We will make these corporate rats our subby bitches. We will make them all beg![/say]")

		saynn("You nod. Kait seems excited. Maybe a bit too much. You haven't done anything yet so you keep a serious face.")

		saynn("[say=kait]Since I started this whole thing.. that means.. I'm gonna be in charge. Yeah?[/say]")

		saynn("She doesn't sound entirely sure about it. Her feline eyes look slightly anxious, waiting for your answer. Her tail is alert too. You take a better look at her. The feline.. is kinda small. She doesn't look very strong either. Got a loud mouth though.")

		saynn("[say=pc]You're gonna tell me the plan first. And then we will see.[/say]")

		saynn("Kait blinks and looks around. So many ears. So many loud noises.")

		saynn("[say=kait]Fine. But not here.[/say]")

		addButton("Continue", "See what happens next", "near_hideout")
	if(state == "near_hideout"):
		aimCameraAndSetLocName("hideout_enter")
		saynn("Behind the raised platform, there is a doorframe, half-hidden in shadow. Kait walks through it and invites you to follow.")

		saynn("You do.")

		saynn("You enter the Announcer's office. This room clearly was a maintenance space of some sorts before.. maybe even a storage bay. But now someone has shoved a make-shift desk, a chair and a few shelves into it. It was cramped and dim.. but also cozy in a weird way.")

		saynn("[say=kait]Ans has been kind enough to let me use his secret room.[/say]")

		saynn("You look around. There is only enough space for the two of you to stand without bumping into each other. Only a single metal wall was separating you from the chaos of the arena outside.")

		saynn("[say=pc]This room isn't exactly secret, is it?[/say]")

		saynn("Kait snorts softly and nods towards the far corner.")

		saynn("[say=kait]That one is.[/say]")

		saynn("You followed her gaze. Kait moves some of the janky-looking shelves made out of metal panels.. uncovering an airlock door.")

		saynn("You approach it. The door has huge dents and a bunch of torn-off panels. The wiring is all exposed too.. like someone has tried to hack it. It has certainly seen better days. There is a small window on it.. but it's really hard to see what's behind. It's all dark and dusty.")

		saynn("[say=pc]Is that your job?[/say]")

		saynn("[say=kait]Some of it, sure. Don't ask me how many times it shocked me. I think I started to like it by the end.[/say]")

		saynn("[say=pc]Could have stolen some insulated gloves.[/say]")

		saynn("[say=kait]Uh..[/say]")

		saynn("She scratches behind her head.")

		saynn("[say=pc]Or let someone else from your team steal it.[/say]")

		saynn("[say=kait]Uhh-h-h-h..[/say]")

		saynn("[say=pc]You have a team, right?[/say]")

		saynn("[say=kait]Yes, of course. We will talk about it. But first..[/say]")

		saynn("You raise a brow and watch as Kait grabs a long metal bar and shoves it into a crack between the two unpowered doors.")

		saynn("[say=kait]I managed to raise the bolts and cut off the power. Now we just need to force it open. Care to help?[/say]")

		addButton("Help", "Help Kait to force-open the door", "help_force_open")
	if(state == "help_force_open"):
		saynn("Might as well. You join Kait and grasp the same metal bar. Kait is holding the tip while you're pushing just next to it. The stick is about a meter long so there is enough space.. but it's quite greasy and old, its cold ridges are biting into your palms.")

		saynn("Kait's fluffy paws brush against yours as you adjust your grip.")

		saynn("[say=kait]On my three.[/say]")

		saynn("You brace.")

		saynn("[say=kait]One.[/say]")

		saynn("The bar starts creaking under pressure.")

		saynn("[say=kait]Two.[/say]")

		saynn("Kait leans into it, her body tensing up.")

		saynn("[say=kait]Three![/say]")

		saynn("Together, you push.")

		saynn("The door withstands your action with a loud metallic groan that rattles through the whole frame. Somewhere inside it, something gave a little.. but then got caught again. Kait's paws slip and she slides head-first into your side.")

		saynn("[say=kait]Ah![/say]")

		saynn("A small chuckle escapes her.")

		saynn("[say=pc]Again. Get a better grip.[/say]")

		saynn("[say=kait]I know! Shush. I got this.[/say]")

		saynn("Having a crowbar would probably be much better for this. But you don't see any toolboxes around.")

		saynn("You both reset, shoulders almost touching now as you look for better leverage.")

		saynn("Then.. you try again. The metal screeches, the door begins to budge. You feel Kait's paws begin to shake and shiver as her strength gets tested. Eventually, she grunts and gives up, panting heavily.")

		saynn("[say=kait]Stupid thing![/say]")

		saynn("[say=pc]You're probably doing something wrong. Let's trade places.[/say]")

		saynn("[say=kait]Nu huh![/say]")

		saynn("You ignore the cat and nudge her out of the way, forcing her to put her paws where yours were while you grab onto the bar's end. After some fidgeting, you find that the metal bar seems to have more leverage if you push it the other way.")

		saynn("[say=pc]Pull instead of pushing. Go![/say]")

		saynn("You do the same, putting your whole weight into it as you start trying to pull the stick towards you, greeting your teeth in the process.")

		saynn("[say=kait]Gr-r..[/say]")

		saynn("[say=pc]Pull I said.[/say]")

		saynn("Something starts giving.. you can feel it. The feline concentrates, her fluffy tail grabbing onto your leg and using it for support.")

		saynn("Second after second of painful grunts.. the metal digging into your hands.")

		saynn("And then.. the doors finally submit. A strip of darkness begins to widen between them.")

		saynn("Kait lets out a triumphant sigh.")

		saynn("[say=kait]There![/say]")

		saynn("The airlock doors don't resist anymore as you spread the halves more.")

		saynn("Kait steps back and wipes her paws on a random rag. You do the same. The feline peeks her head inside, her tail erected high.")

		saynn("[say=kait]After you?[/say]")

		addButton("Step inside", "See what's out there", "go_inside")
	if(state == "go_inside"):
		aimCameraAndSetLocName("hideout_enter")
		saynn("You get yourself through the gap between the doors and step further.")

		saynn("It's dark.. but your eyes slowly begin to adapt.")

		saynn("The room.. was about what you'd expect it to be. It's another abandoned maintenance tunnel.")

		saynn("Abandoned is a bad word for it. It's a total derelict of a room. Empty storage crates littered the floor.. a warped metal table was leaning against one of the walls, one leg snapped clean off. Empty bins, cracked panels, overturned shelves.. and all of it is covered with a thick layer of dust. It is impossible to take a single step without tripping over something.")

		saynn("No one had been here in a long time.")

		saynn("Kait walks up to you from behind and pauses near your shoulder, her eyes catching the scarce glimpses of light, making them glow.")

		saynn("[say=kait]Yeah. We've got work to do.[/say]")

		saynn("She steps in further, kicking aside some fallen panels to make space. She crouches, grabs the edge of one of the heavy shelves.. and begins to drag it with a harsh scrape of metal against metal.")

		saynn("You decide to join in and start helping her.")

		saynn("Together you shove one shelf out of the way, then another. Dust lifts into the air, causing the feline to cover her muzzle with her fuzzy tail tip.")

		saynn("[say=pc]So what's the plan?[/say]")

		saynn("[say=kait]We clean it all up. And then it will be our base of operations. Isn't that cool?[/say]")

		saynn("[say=pc]Cool, sure. I was asking about the bigger picture.[/say]")

		saynn("[say=kait]We.. uh-h.. Yeah, I have a very good plan. We just.. dominate everyone![/say]")

		saynn("You barely listen as you collect some of the broken panels and other debris. Storing it all on the shelves seems to be the best solution for now. Then your mind processes what she said.")

		saynn("[say=pc]Huh?[/say]")

		saynn("Kait's eyes glow in the dark room.")

		saynn("[say=kait]Yeah! Every single person in this prison. Either they join us. Or we make them! At some point we will have more influence than the captain himself! And that's.. when we make him our bitch![/say]")

		saynn("Ambitious. It sounds nice in theory. But the more you think about it, the more glaring holes you notice.")

		saynn("[say=pc]This sounds.. crazy.[/say]")

		saynn("[say=kait]I know, right?[/say]")

		saynn("You move empty crates around and then start attaching the broken leg back to the table.")

		saynn("[say=pc]Not in a good way. There are hundreds of inmates. Maybe thousands.[/say]")

		saynn("[say=kait]Well.. we focus on the big fish then! The rest will join us automatically.[/say]")

		saynn("At this point, you stop helping and just look at her.")

		saynn("[say=pc]You haven't even thought your plan through.[/say]")

		saynn("Kait swipes the dust away from her face and then rubs her snout.")

		saynn("[say=kait]Pff. Once we have this base of operations set up, we can start grinding over the details. Don't be a doubter, I've had enough of those already.[/say]")

		saynn("Maybe there is a good reason to be one with her.")

		saynn("[say=pc]So who's the rest of the team?[/say]")

		saynn("[say=kait]Well..[/say]")

		saynn("She stays quiet and just moves more broken stuff out of the way.")

		saynn("[say=pc]Kait?[/say]")

		saynn("[say=kait]Um.. uh-h..[/say]")

		saynn("You approach her and grab her by the shoulder. The cat tenses up, fur standing up.")

		saynn("[say=pc]Use your words.[/say]")

		saynn("She looks at you for a few seconds.. and then averts her gaze.")

		saynn("[say=kait]So far we have.. me.. you.. and Ans. It's not much but it's a start, no?[/say]")

		saynn("Right. There is no team. And there is no plan either. It's all just a dream. It's a nice dream, sure. But it's still just a dream.")

		saynn("She wants to turn away but you pull her back, your hand grabbing onto her collar and yanking on it.")

		saynn("[say=pc]Are you just wasting my time?[/say]")

		saynn("In a flash of rage, she sinks her clawed digits into your hand and pries it off, now with a few small wounds.")

		saynn("You were about to assume a combat stance.. but then her expression softens, rage fading away.")

		saynn("[say=kait]Listen.. well.. At least I'm trying, okay? If you wanna sit on your ass all day, be my guest. I want this collar off. I wanna be free.[/say]")

		saynn("Kitty bares her fangs.")

		saynn("[say=kait]And I wanna make them regret..[/say]")

		saynn("Maybe there is some spirit in this one.")

		saynn("[say=pc]Three people isn't gonna be enough to take over this prison.[/say]")

		saynn("[say=announcer]Make it four.[/say]")

		addButton("Continue", "See what happens next", "ans_comes_in")
	if(state == "ans_comes_in"):
		playAnimation(StageScene.Duo, "stand", {npc="announcer", pc="avy"})
		addCharacter("announcer")
		addCharacter("avy")
		saynn("Announcer steps into the dark room.. followed by another person.. Avy.")

		saynn("[say=avy]What a shithole, wow.[/say]")

		saynn("Kait instantly puffs up and blocks the way for the pair.")

		saynn("[say=kait]Ans? Why did you bring her?[/say]")

		saynn("The feline's voice sounds concerned, her tail spazzing out.")

		saynn("[say=announcer]I trust her. She is a good fighter.[/say]")

		saynn("[say=kait]No, she is not.. She is also a total bitch.[/say]")

		saynn("[say=avy]Wow, look who's talking. You're pretty mouthy for a doormat.[/say]")

		saynn("Kait growls, her claws extending.")

		saynn("[say=kait]I know how you've gotten so high on the fighter list.[/say]")

		saynn("[say=avy]Because I'm a good fighter, just like how Ans said. The best one even. Much better than you.[/say]")

		saynn("[say=announcer]Ladies..[/say]")

		saynn("[say=kait]Why shouldn't I scratch your face to bits right now?[/say]")

		saynn("[say=avy]Why shouldn't I smash you against the wall?[/say]")

		saynn("[say=announcer]Babes![/say]")

		saynn("He stomps his cane against the cold floor.")

		saynn("[say=announcer]Let's all take a pill of chill. You will have faces to scratch and walls to smash against. For now, endure each other. Focus.[/say]")

		saynn("[say=avy]I heard you had no plan.[/say]")

		saynn("[say=announcer]Then our first step is to come up with a plan.[/say]")

		saynn("[say=kait]Right.. Well.. We need more hands and heads. {pc.Name} is right.[/say]")

		saynn("[say=avy]No. Our top priority must be cleaning this shithole up. Before I cough my lungs out.[/say]")

		saynn("[say=announcer]Both of those sound actionable. Perfect, girls.[/say]")

		saynn("[say=avy]Actionable? How exactly are you planning to trick bitches into following you, huh?[/say]")

		saynn("[say=kait]I was thinking.. we ask them. And if they say no.. we ask them again but a little rougher.[/say]")

		saynn("[say=avy]The prison is full of spineless brats, trust me. We will have to break them. We will need rooms for that.[/say]")

		saynn("[say=announcer]Alright. Gotta do what we gotta do. I'm sure we can assemble something here.[/say]")

		saynn("[say=avy]We still need to know who is good and who's completely useless.[/say]")

		saynn("[say=announcer]For sure, we gotta prioritize.[/say]")

		saynn("[say=kait]If we can get our paws on a datapad with the personnel database..[/say]")

		saynn("[say=avy]The thing will get remotely wiped in seconds, you dumb cat. Even if you do it stealthily.[/say]")

		saynn("[say=kait]Propose something then. Right now you're the useless one here.[/say]")

		saynn("[say=avy]I don't fucking know, it's a dumb plan to begin with.[/say]")

		saynn("[say=announcer]Listen. I have an idea. What if we.. print it?[/say]")

		saynn("[say=kait]Print it? You wanna print multiple thousands of records? And how?[/say]")

		saynn("[say=announcer]We get access to a console. We sort the records by.. the length of the crime list. And we print the top hundred or so?[/say]")

		saynn("[say=avy]Exclude me too first, because I'd be the first on that list.[/say]")

		saynn("[say=kait]Hm.. That could actually work. Do you know any consoles we can get to?[/say]")

		saynn("[say=announcer]No. Not on this floor. Command Deck has a bunch of offices. But we would need at least a staff badge to get there.[/say]")

		saynn("[say=kait]Right.. We need to steal a badge then. Does anyone know a good thief?[/say]")

		saynn("[say=avy]I do, in fact, know one. Name is Rahi.[/say]")

		saynn("[say=kait]Who the heck is Rahi?[/say]")

		saynn("[say=avy]She usually wastes her time on the bench near the stocks. Total doormat. But can steal your wet panties in a split second.[/say]")

		saynn("[say=kait]I don't have any panties.[/say]")

		saynn("[say=avy]See? We break her in. And make her yoink that badge for us.[/say]")

		saynn("[say=announcer]Perfect. Someone should go and start recruiting her. While the rest of us clean this place up.[/say]")

		saynn("[say=pc]I can go grab and bring her.[/say]")

		saynn("[say=announcer]Sounds like a plan. We will need a special space.. for persuading her.[/say]")

		saynn("[say=pc]You think she won't just agree?[/say]")

		saynn("[say=announcer]She might. But gotta make sure that her heart and mind is with us, not just her leash.[/say]")

		saynn("[say=avy]Like I said, we gotta break her in.[/say]")

		saynn("[say=announcer]Thanks, Avy.[/say]")

		saynn("[say=avy]See? I'm mega useful.[/say]")

		saynn("[say=kait]Whatever, one strike and you're out.[/say]")

		saynn("[say=avy]One strike and you're gonna be out, slut.[/say]")

		saynn("[say=announcer]Let's start cleaning up.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "near_hideout"):
		processTime(5*60)

	if(_action == "help_force_open"):
		processTime(10*60)

	if(_action == "go_inside"):
		processTime(16*60)

	if(_action == "ans_comes_in"):
		processTime(5*60)

	setState(_action)
