extends SceneBase

func _init():
	sceneID = "DomSM2"

func _run():
	if(state == ""):
		saynn("You're standing near the mission board, thinking about what should be the next move for the team..")

		saynn("Suddenly, a cry of pain echoes from another room.")

		saynn("[say=kait]Ouch! God fucking dammit.[/say]")

		saynn("The voice seems very familiar.")

		addButton("Check it", "Go check it out and see what's up", "kait_tv")
	if(state == "kait_tv"):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "sit", {npc="kait", npcAction="hurt"})
		aimCameraAndSetLocName("hideout_chill")
		saynn("You step inside the other room and uncover quite a scene.")

		saynn("Kait is kneeling in front of an old TV.. the kind that was already old when it came out to market.. bulky and with a rounded screen. It's showing pure static.. accompanied by the beautiful sounds of white noise.")

		saynn("The snow leopard has the back panel open, all wiring is exposed. Her paws are reaching inside.")

		saynn("Zap.")

		saynn("[say=kait]Ouch![/say]")

		saynn("Her whole body jerks, including her tail. Her fur stands on ends, making her look puffy.")

		saynn("She pulls her back and shakes it.")

		saynn("You take a seat on one of the crates and admire the show.")

		saynn("[say=pc]What are you doing?[/say]")

		saynn("Kait looks over her shoulder, her face looks a bit dirty.")

		saynn("[say=kait]What does it look like? Fixing this piece of junk.[/say]")

		saynn("She gestures vaguely at the mess of components inside.")

		saynn("[say=pc]Do you know what you're doing?[/say]")

		saynn("Her ears flatten.")

		saynn("[say=kait]I know enough![/say]")

		saynn("She reaches back inside.")

		saynn("Zap.")

		saynn("[say=kait]Ouch![/say]")

		saynn("Her fur puffs out again.. a few sparks fly out the thing. She yanks her arm back and sucks on her hurt finger.")

		saynn("[say=pc]Tried turning it off first?[/say]")

		saynn("You can feel her rolling her eyes.")

		saynn("[say=kait]This stupid thing heats up for like ten minutes, I wouldn't be able to test it otherwise.[/say]")

		saynn("[say=pc]I guess you're screwed then. Hope you like pain.[/say]")

		saynn("She takes a small pause.. and then giggles.")

		saynn("[say=kait]In a different life, I'd probably be an engineer, you know. But I just had to end up a slut![/say]")

		saynn("A short awkward pause.")

		saynn("[say=kait]A lilac I mean. I'm not a slut.[/say]")

		saynn("Of course.")

		saynn("You let her work.. but you soon become curious.")

		saynn("[say=pc]Step aside.[/say]")

		saynn("Kait shuffles on her knees, letting you look inside. It's about what you'd expect. Exposed wiring.. some are crossed.. some are bare. It's a mess.")

		saynn("[say=pc]You need insulated gloves for this.[/say]")

		saynn("Kait crosses her arms.")

		saynn("[say=kait]We don't have any![/say]")

		saynn("[say=pc]Then we're gonna get you some. Get up.[/say]")

		saynn("She groans.")

		saynn("[say=kait]I can do it![/say]")

		saynn("The snow leopard reaches inside again. Her paw hovers over a loose wire.")

		saynn("[say=pc]Kait. Stop it.[/say]")

		saynn("[say=kait]I'm almost there, I can feel it-..[/say]")

		saynn("Zap.")

		saynn("Kait yelps and falls backward onto her butt. Static electricity crackles between her ears, making them flick.")

		saynn("[say=kait]..ow..[/say]")

		saynn("[say=pc]That's it. We're getting you insulated gloves. Up.[/say]")

		saynn("Kait sits up, rubbing her wrist.")

		saynn("You offer her a hand. She takes it and gets pulled to her feet.")

		saynn("[say=pc]Where can we get them?[/say]")

		saynn("[say=kait]Engineers usually carry some..[/say]")

		saynn("Engineering it is.")

		addButton("Continue", "See what happens next", "in_engineering")
	if(state == "in_engineering"):
		aimCameraAndSetLocName("eng_workshop")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("After some time, you arrive at the engineering bay.. and enter the workshop area. A place where inmates and engineers can waste their time creating something of questionable use.")

		saynn("You and Kait lean against one of the walls. There are a few engineers around.")

		saynn("[say=kait]So? What now?[/say]")

		saynn("[say=pc]We're gonna come up with a plan and then execute it. One step at a time.[/say]")

		saynn("Kait's shoulders slump.")

		saynn("[say=kait]But that will take forever.[/say]")

		saynn("[say=pc]We have all the time in the world. Lets pick the best target and wait for a good moment. We might have to involve some of our team.[/say]")

		saynn("Kait breaks eye contact in the middle of you speaking. She turns her head and looks at her surroundings.. until she sees something.")

		saynn("[say=kait]That sounds so boring. Give me a second.[/say]")

		saynn("She starts heading somewhere!")

		saynn("[say=pc]Where are you going?[/say]")

		saynn("[say=kait]Just watch me.[/say]")

		saynn("[say=pc]Kait..[/say]")

		saynn("Well.. Time to see what mess she will get herself into.")

		addButton("Continue", "See what happens next", "kait_socket")
	if(state == "kait_socket"):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="socket"})
		saynn("[say=kait]Hey.. uh.. cool uniform.[/say]")

		saynn("You find Kait standing near a half-naked fennec who seems to be completely unfazed by it. She does have a backpack though.. bulky boots.. a top that doesn't cover anything.. She is not entirely naked.")

		saynn("[say=socket]Thanks! Name is Socket.[/say]")

		saynn("She is being quite friendly with Kait too.")

		saynn("[say=kait]Yes, hey, Socket. I wonder.. Do you have any spare gloves? The yellow ones.[/say]")

		saynn("[say=socket]Let's see![/say]")

		saynn("She drops her backpack onto the nearest workbench and begins rummaging through it. Spare wires, a crowbar, cutters, a screwdriver, some lube and duct tape. Somehow there is also a giant wrench in between all of that.")

		saynn("[say=socket]No, I only have one pair it seems. Sorry![/say]")

		saynn("[say=kait]Can I maybe have that pair perhaps?[/say]")

		saynn("Socket blinks a few times, her expression changes to a more hostile one.")

		saynn("[say=socket]..Do you need to be bonked or something?[/say]")

		saynn("[say=kait]I guess I'd rather not. Listen, what if I promise to return it?[/say]")

		saynn("The fennec hums.")

		saynn("[say=socket]Hm.. I still prefer the bonking thing.[/say]")

		saynn("[say=kait]Pretty please?[/say]")

		saynn("She hums some more and scratches her chin. Then she gets all excited and bouncy.")

		saynn("[say=socket]I have an idea! If you wear this headset that's on my head for a bit, I will let you have the gloves![/say]")

		saynn("[say=kait]Headset? What is it gonna do?[/say]")

		saynn("[say=socket]It will make sure that you will actually return them![/say]")

		saynn("That could mean many things..")

		saynn("[say=kait]It will hypnotize me?[/say]")

		saynn("[say=socket]No, it's not a hypnovisor obviously. Why would I wear one? It will just show you what happens if you don't return the gloves, what punishment you will receive![/say]")

		saynn("Kait raises a brow. Obviously a sane person would say no to that offer.")

		saynn("[say=kait]Uh huh. Sure. Whatever it is, I can take it. Just promise you will give me the gloves after.[/say]")

		saynn("[say=socket]Yes, of course! I will prepare it![/say]")

		saynn("Socket takes off her headset and begins pressing buttons on it..")

		saynn("You nudge Kait's side and whisper into her ear while the fennec is distracted.")

		saynn("[say=pc]Kait, this is a bad idea and you know it.[/say]")

		saynn("She whispers back.")

		saynn("[say=kait]Shush, I know it's a hypnovisor, I'm not stupid. My mind is strong enough to not be affected by it.[/say]")

		saynn("[say=pc]I'm not so sure about that.[/say]")

		saynn("[say=kait]Saying I'm dumb?[/say]")

		saynn("[say=pc]No.[/say]")

		saynn("[say=kait]I can take it, I'm telling you.[/say]")

		saynn("[say=pc]Alright, don't let me stop you then.[/say]")

		saynn("If she says that it's fine, might as well let her.")

		addButton("Continue", "See what happens next", "hypno_stuff")
	if(state == "hypno_stuff"):
		saynn("Socket finishes pressing buttons. The headset hums softly in her paws.")

		saynn("[say=socket]Okay! It's ready.[/say]")

		saynn("Kait takes the headset without hesitation. She glances at you, smirks.. and then puts it on.")

		saynn("Once she secures the thing.. she just lets it do its thing.")

		saynn("There is no obvious reaction from Kait. She is just.. standing still, breathing calmly. You notice some of the light leaking from under the face cushion.")

		saynn("[say=socket]Can you see something?[/say]")

		saynn("[say=kait]Yep. Just lots of colors.[/say]")

		saynn("Socket walks in a slow circle around her, inspecting Kait.")

		saynn("[say=socket]Hm.. You should see more than that.[/say]")

		saynn("[say=kait]Well, what I can tell you, that's all that I see.[/say]")

		saynn("Time passes, Kait sighs a few times.")

		saynn("[say=kait]Kinda boring.[/say]")

		saynn("[say=socket]It should be almost done![/say]")

		addButton("Continue", "See what happens next", "give_headset_back")
	if(state == "give_headset_back"):
		saynn("Soon, the headset turns off its fancy lights.")

		saynn("Socket carefully takes it off Kait's face.. revealing her usual eyes.")

		saynn("[say=pc]Feel any different?[/say]")

		saynn("[say=kait]Nope! I feel exactly the same.[/say]")

		saynn("Maybe you shouldn't have worried so much then.")

		saynn("Kait looks at the fennec.")

		saynn("[say=kait]I did your thing! Give me the gloves now.[/say]")

		saynn("Socket shrugs and puts the headset back on her head. Then she reaches into her backpack and produces a set of shiny insulated gloves.")

		saynn("[say=socket]There you go. One pair of rubber gloves.[/say]")

		saynn("Kait holds them like they're made out of gold. To be fair, they seem quite useful, especially if you're just an assistant for example.")

		saynn("[say=kait]Perfect! Let's go![/say]")

		saynn("The snow leopard grabs your hand and pulls you towards the exit.")

		addButton("Follow", "Go back to your hideout", "go_back")
	if(state == "go_back"):
		removeCharacter("socket")
		playAnimation(StageScene.Duo, "sit", {npc="kait", npcAction="kneel"})
		aimCameraAndSetLocName("hideout_chill")
		saynn("Back in the hideout, Kait kneels in front of the TV again.")

		saynn("[say=kait]Told you it would work out![/say]")

		saynn("She puts on the yellow gloves.. they fit perfectly.")

		saynn("[say=kait]Alright. Now we're talking![/say]")

		saynn("Speaking of.. Maybe you should have a talk with her later. She did an incredibly risky thing after all.")

		saynn("She works in silence for a minute, tying some wires together. Looks like the gloves aren't just some cheap budget knock offs, they actually prevent her from getting zapped.")

		saynn("[say=kait]That Socket.. she is kinda strange, isn't she?[/say]")

		saynn("[say=pc]Certainly.[/say]")

		saynn("[say=kait]Doesn't matter, at least I've got the gloves.[/say]")

		saynn("She really gets into the TV's guts, trying to do something deep inside.")

		saynn("[say=pc]Are you gonna return them?[/say]")

		saynn("[say=kait]Hah, why would I? These babies are mine now.[/say]")

		saynn("Suddenly, the white noise is gone! The static goes away, replaced by.. a person speaking.")

		saynn("[sayMale]AlphaNews, your only trusted source for galactic truth.[/sayMale]")

		saynn("It seems to be working!")

		saynn("[say=kait]Grrrr-..[/say]")

		saynn("Kait doesn't seem to be happy about it though. She starts tinkering away again.")

		saynn("[sayMale]Today, our glorious fleet has liberated yet another world from the evil grip of the vile Syndicate. The oppressed locals, free at last, greeted our brave soldiers with tears of joy, baskets of fresh bread, and handmade pies.[/sayMale]")

		saynn("[say=kait]Where is that fucking receiver..[/say]")

		saynn("[sayMale]Overwhelmed by gratitude, they have also collectively and unanimously begged to be welcomed under our protective umbrella. Because they know that freedom isn't just given, it's a reward for complete loyalty.[/sayMale]")

		saynn("That's when she finally manages to switch the channel. The screen goes black.. and then shows the beginning of some movie instead!")

		saynn("[say=kait]Finally. We're not gonna watch your stupid war shit down here.[/say]")

		saynn("That's.. interesting.")

		saynn("[say=pc]How did you do that? Other TVs don't have a way to switch the channel.[/say]")

		saynn("[say=kait]Because they lock the frequency, obviously. They're not just evil, they're also assholes.[/say]")

		saynn("Kait takes a few steps back.. and sees what's on screen.")

		saynn("[say=kait]Space wars! That is my favourite childhood movie! We gotta watch it![/say]")

		addButton("Praise her", "(Kait's Love +) Praise Kait for doing such a good job", "do_pat")
		addButton("Be strict", "(Kati's Obedience +) Have a strict talk with Kait about how she should be more careful", "do_strict")
	if(state == "do_strict"):
		playAnimation(StageScene.Grope, "tease", {pc="kait", npc="pc"})
		saynn("She got the gloves and fixed the TV.. but she did in a very dangerous way.")

		saynn("[say=pc]Come here, Kait.[/say]")

		saynn("As Kait gets closer, you give her a strict look. When she catches it, her tail goes low.")

		saynn("[say=pc]You've acted incredibly recklessly today.[/say]")

		saynn("She rolls her eyes.")

		saynn("[say=kait]So? It worked out![/say]")

		saynn("Your hand darts out to get a hold of her collar, making her look at you.")

		saynn("[say=pc]Don't rely on dumb luck, Kait, please, it will fuck you over one day.[/say]")

		saynn("Her gaze jumps from spot to spot.. always avoiding yours. Her rear paw kicks the floor.")

		saynn("[say=kait]I was ready for the consequences.. obviously..[/say]")

		saynn("[say=pc]But you're not alone anymore. You're in a team. Why do I have to say it to you? You gotta be more responsible.[/say]")

		saynn("Her ears go flat, fluffy tail wraps around her leg.")

		saynn("[say=pc]If you can't, at least listen to my orders then. Okay? Don't be a bad girl.[/say]")

		saynn("She nods subtly.")

		saynn("[say=kait]Yes.. My bad.[/say]")

		saynn("Looks like she learned something. Might as well give her the carrot too.")

		saynn("[say=pc]I understand that you felt bored. And I'm glad it worked out. Good job.[/say]")

		saynn("You give her one headpat.. it seems to cheer her up enough to make her smile again. Then she suddenly gasps.")

		saynn("[say=kait]Oh.. I almost forgot! Since I'm done with the TV, I gotta bring the gloves back to Socket.[/say]")

		saynn("You raise a brow and watch Kait take off the gloves carefully.")

		saynn("[say=pc]Didn't you say that you're keeping them?[/say]")

		saynn("[say=kait]Me? I don't think I did..[/say]")

		saynn("For some reason, she starts unbuttoning her shirt. Strange.. but why not.")

		saynn("[say=pc]You're gonna miss the movie too, can't you wait?[/say]")

		saynn("[say=kait]No.. I gotta give them to her.. like.. right now..[/say]")

		saynn("Her gaze looks a bit spaced out.")

		addButton("Continue", "See what happens next", "naked_kait")
	if(state == "do_pat"):
		playAnimation(StageScene.Grope, "pat", {pc="kait", npc="pc"})
		saynn("She got the gloves.. and managed to fix the TV. She deserves the praise.")

		saynn("[say=pc]Yeah, we should. Come here.[/say]")

		saynn("As Kait gets closer, you give her a few soft pats on the head. The sudden act catches her off-guard, her tail goes stiff.. but then she begins purring.")

		saynn("[say=pc]You did a good job.[/say]")

		saynn("[say=kait]Thank you. I appreciate it.[/say]")

		saynn("She offers you a cute smile.")

		saynn("[say=kait]Oh.. I almost forgot! Since I'm done with the TV, I gotta bring the gloves back to Socket.[/say]")

		saynn("You raise a brow and watch Kait take off the gloves carefully.")

		saynn("[say=pc]Didn't you say that you're keeping them?[/say]")

		saynn("[say=kait]Me? I don't think I did..[/say]")

		saynn("For some reason, she starts unbuttoning her shirt. Strange.. but why not.")

		saynn("[say=pc]You're gonna miss the movie too, can't you wait?[/say]")

		saynn("[say=kait]No.. I gotta give them to her.. like.. right now..[/say]")

		saynn("Her gaze looks a bit spaced out.")

		addButton("Continue", "See what happens next", "naked_kait")
	if(state == "naked_kait"):
		playAnimation(StageScene.Duo, "stand", {npc="kait", npcBodyState={naked=true}})
		addCharacter("kait", ["naked"])
		saynn("Kait completely strips her clothing in front of you. Her shirt falls to the floor. Then her shorts.")

		saynn("She then just stands there completely naked. Her snow-white fur covers most of her body.. but her pink nipples are clearly visible on her chest, perky and exposed. Between her legs, her soft pussy lips peek out from her fur.")

		saynn("[say=pc]Kait? All good?[/say]")

		saynn("[say=kait]Yeah? Yeah. What do you mean?[/say]")

		saynn("She doesn't cover herself. Doesn't even seem to notice.")

		saynn("[say=pc]Right. Nothing. Carry on, silly cat.[/say]")

		saynn("Holding the gloves, she heads towards the hideout's exit.")

		saynn("[say=kait]Okay, I'll be right back![/say]")

		saynn("She jogs away, her exposed breasts and butt bouncing from each step.")

		saynn("That's what she gets for wearing random headsets.")

		addButton("Continue", "See what happens next", "alone_wait")
	if(state == "alone_wait"):
		removeCharacter("kait")
		playAnimation(StageScene.Solo, "sit")
		saynn("You just sit and watch the movie.")

		saynn("It's not bad actually. The effects are a little dated perhaps.. But after so much time behind bars, any movie is gonna feel great.")

		saynn("The plot.. Nothing special really. Good guys must protect their universe before the bad guys destroy it.")

		saynn("Some popcorn would be nice. But oh well.")

		saynn("Some time later..")

		saynn("[say=kait]{pc.name}!![/say]")

		saynn("Looks like Kait is back. Her mind as well it seems.")

		addButton("Continue", "See what happens next", "kait_angy")
	if(state == "kait_angy"):
		addCharacter("kait", ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="kait", npcBodyState={naked=true}})
		saynn("Kait storms the room.")

		saynn("[say=kait]Why didn't you stop me?? I walked naked through the whole prison! Every guard and their pet saw me![/say]")

		saynn("You can't help but to chuckle softly.")

		saynn("[say=pc]Really? Hah.[/say]")

		saynn("She pushes you lightly.")

		saynn("[say=kait]One of them kept looking at me in the elevator! I thought I had some dirt on my fur![/say]")

		saynn("[say=pc]It was entirely your choice.[/say]")

		saynn("She pouts and crosses her arms under her breasts.. that are still exposed.")

		saynn("[say=kait]Socket got very amused too if you're curious.. She snapped her fingers.. And I realized what was happening. I was fucking naked in the middle of nowhere! I'm so mad at you![/say]")

		saynn("[say=pc]Must have been a very interesting journey back.[/say]")

		saynn("You keep giggling while Kait lightly scratches you everywhere.. makes it even more entertaining.")

		saynn("[say=kait]It wasn't! I had to cover myself with what I could.. my tail and paws.. and other lilacs. I'm not a slut, you know![/say]")

		saynn("[say=pc]I know. Everyone knows now.[/say]")

		saynn("[say=kait]GRrrr-r![/say]")

		saynn("She furrows her brows a lot and keeps scratching you more.")

		saynn("[say=pc]You wanna kill me or watch the movie?[/say]")

		saynn("[say=kait]..huff.. the movie..[/say]")

		saynn("Kait grabs her clothes.. dusts them off and wears them. She sits on the crate near you and sighs.")

		saynn("Watching the TV makes her calm down eventually.")

		saynn("[say=kait]I guess it was worth it after all..[/say]")

		saynn("And so you spend some more time together, watching Space Wars.")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_tv"):
		processTime(3*60)

	if(_action == "in_engineering"):
		processTime(10*60)

	if(_action == "kait_socket"):
		processTime(2*60)

	if(_action == "hypno_stuff"):
		processTime(3*60)
		putOff("socket", "SocketVisorUp")
		putOn("kait", "SocketVisor")

	if(_action == "give_headset_back"):
		processTime(3*60)
		putOn("socket", "SocketVisorUp")
		putOff("kait", "SocketVisor")

	if(_action == "go_back"):
		processTime(10*60)

	if(_action == "do_pat"):
		GM.main.MS.setDecision("kait", "pat")

	if(_action == "do_strict"):
		GM.main.MS.setDecision("kait", "strict")

	if(_action == "naked_kait"):
		processTime(3*60)

	if(_action == "alone_wait"):
		processTime(10*60)

	if(_action == "kait_angy"):
		processTime(5*60)
		GM.main.MS.completeMission()

	setState(_action)
