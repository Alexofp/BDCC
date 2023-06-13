extends SceneBase

var guard_id = ""

func _init():
	sceneID = "rahi2RahiScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return guard_id

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		addCharacter("rahi")
		saynn("You approach the kitten's bench and find your friendly feline there. She is just idly stroking her tail.")

		saynn("[say=pc]Hey there, kitten.[/say]")

		saynn("Her ears perk at your voice. The feline's face lights up when she sees you.")

		saynn("[say=rahi]Oh, hi! Want something?[/say]")

		saynn("Rahi seems to be bouncing slightly on the bench. You're not sure how to talk about it so you just stand there, scratching your head.")

		saynn("[say=pc]Well, actually..[/say]")

		saynn("But the feline has cut you off.")

		saynn("[say=rahi]Wanna go sit near the waterfall with her? Kitty would love that..[/say]")

		saynn("You approach the feline.")

		saynn("[say=pc]Wonder what made you want that.[/say]")

		saynn("Rahi tilts her head slightly.")

		saynn("[say=rahi]Meow? She just wants to spend some time with you..[/say]")

		saynn("The feline tilts her head down, your eyes spot the subtle blush.")

		addButton("Sure", "Might as well see where it goes", "follow_rahi")
		addButton("Interrogate", "You understand why she wants to go there", "interogate_rahi")
	if(state == "interogate_rahi"):
		saynn("The kitty wants to get up but you stop her by placing your hands on her shoulders.")

		saynn("[say=pc]We need to talk.[/say]")

		saynn("She tilts her head down, her paws grab her tail again and continue brushing it.")

		saynn("[say=rahi]About what..[/say]")

		saynn("[say=pc]The doctor told me..[/say]")

		saynn("Suddenly Rahi cuts you off again.")

		saynn("[say=rahi]Don't listen to her, the doctor is wrong.[/say]")

		saynn("[say=pc]But..[/say]")

		saynn("Rahi shakes your hands off her and continues to brush her wagging tail.")

		saynn("[say=rahi]She is wrong, okay? Kitty is okay. Everything is okay.[/say]")

		saynn("[say=pc]But it's not, kitten.[/say]")

		saynn("Rahi escapes your stare and grasp by crawling to the other side of the bench before getting up. You pick up on a bit of annoyance in her voice, kinda unusual for such a cute kitty.")

		saynn("[say=rahi]She is going to the waterfall. Do you wanna go sit with her or not?[/say]")

		addButton("Follow", "Might as well see where it goes", "follow_rahi")
		addButton("No", "She clearly doesn't wanna listen", "not_follow_rahi")
	if(state == "not_follow_rahi"):
		setFlag("RahiModule.rahi2Denied", true)
		playAnimation(StageScene.Solo, "stand")
		removeCharacter("rahi")
		saynn("You shake your head.")

		saynn("[say=pc]No. Sorry, kitty. You will have to drink alone.[/say]")

		saynn("Rahi huffs at you. But then just joggles away, her tail wagging quite a bit behind her.")

		saynn("Huh. She didn't sound too happy about your words. Maybe you can try to convince her when she will be less irritated.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "follow_rahi"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("You sigh.")

		saynn("[say=pc]Alright, we can go sit near the waterfall.[/say]")

		saynn("Rahi springs up onto her feet and reaches out to hug you tightly, her muzzle brushing against your cheek while she purrs.")

		saynn("[say=rahi]Yay. Let's go.[/say]")

		saynn("The feline takes off faster than you, already leaving your line of sight. You follow her scent and enter the yard.")

		addButton("Continue", "See what happens next", "sit_near_pond")
	if(state == "sit_near_pond"):
		aimCameraAndSetLocName("yard_waterfall")
		GM.pc.setLocation("yard_waterfall")
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcAction="sit"})
		saynn("You step through the green area and find a little secluded place with a bench and a waterfall over a nice careful pond.")

		saynn("Rahi has already jumped over the pond, her paw reaching behind the waterfall, trying to find the bottle. As some of the water on her fur, Rahi shivers and shakes it off, her tail wagging actively.")

		saynn("Eventually she fetches a half-empty bottle of whiskey and prepares to jump back.")

		saynn("[say=pc]Careful.[/say]")

		saynn("Your sudden words destabilize Rahi, she drops the bottle by accident and then leaps after it. Her jumping trajectory wasn't the best, leading to one of her legs getting into the water. The annoyed feline quickly jumps out of the pond and huffs, her fur stands on its ends.")

		saynn("[say=rahi]She hates water.[/say]")

		saynn("Probably because she is a cat. At least she saved the bottle from breaking.")

		saynn("[say=pc]My bad.[/say]")

		saynn("[say=rahi]It's not your fault..[/say]")

		saynn("You and Rahi sit on the same lonely bench. Your hands reach to rub her wet fur a bit, trying to help it dry. The feline purrs while you do that.")

		saynn("[say=rahi]Her planet has water too. But it's all under ice. She remembers that she had to walk far away to collect enough from the frozen river.[/say]")

		saynn("[say=pc]You couldn't melt the snow?[/say]")

		saynn("Rahi tilts the bottle left and right, letting the spicy liquids go from one corner to another.")

		saynn("[say=rahi]Gotta have wood for that. Heavier than just water.. That was before she and her family moved to one of the towns. At least she didn't have to carry water for the whole tribe all day after that.[/say]")

		saynn("She unscrews the lid and sniffs the contents.")

		saynn("[say=pc]Out of curiosity. What makes you wanna drink that? Doesn't it burn your throat.[/say]")

		saynn("[say=rahi]Well.. she said that she just likes the taste..[/say]")

		saynn("[say=pc]You like it so much that you don't mind your throat hurting?[/say]")

		saynn("Rahi looks at you and furrows her brows. Then she sticks her tongue out at you.")

		saynn("[say=rahi]Maybe she wants her throat to hurt. Meow..[/say]")

		saynn("[say=pc]They are certainly easier ways to accomplish that. Much healthier too.[/say]")

		saynn("Rahi shakes her head and sips a little bit of whiskey. Her cheeks blush a little. Then she offers the bottle to you.")

		saynn("[say=rahi]Do you want?[/say]")

		saynn("That would be a good moment to grab the bottle off her.")

		addButton("Nah", "You don't wanna drink whiskey", "not_drink")
		addButton("Drink", "Grab the bottle and drink a bit of whiskey", "drink_whiskey")
	if(state == "not_drink"):
		saynn("You shake your head and let kitty sip on the whiskey bottle if she so wants.")

		saynn("[say=pc]You feel alright lately, Kitten?[/say]")

		saynn("Your hand reaches to rest on her far shoulder as you shift closer to her.")

		saynn("[say=rahi]Yeah, mostly.[/say]")

		saynn("You raise a brow.")

		saynn("[say=pc]Mostly?[/say]")

		saynn("[say=rahi]Belly hurts sometimes..[/say]")

		saynn("You lean closer to Rahi's cheek and land a little kiss. The feline blushes more and keeps lapping up the burning alcohol in a cute way.")

		saynn("[say=pc]Tried going to the doctors?[/say]")

		saynn("[say=rahi]Yeah.. They wanted to put her into a giant pod.. With water in it.. Ugh-h–h..[/say]")

		saynn("[say=pc]I see..[/say]")

		saynn("[say=rahi]And it didn't help for long anyways. So she won't go to the doctors again..[/say]")

		saynn("You nod a few times and let the kitty lean into you.")

		saynn("[say=pc]You said you moved into a town?[/say]")

		saynn("Kitty nods.")

		saynn("[say=rahi]That's how the AlphaCorp people called it. They built a few of those around her planet. They did a lot to make us live better. Or so they said..[/say]")

		saynn("[say=pc]You don't feel that way?[/say]")

		saynn("Rahi doesn't say anything for a few seconds and is just sipping on the whiskey bottle. Finally she breaks the silence.")

		saynn("[say=rahi]Yeah..[/say]")

		saynn("The feline tries to sip again but.. the bottle is empty.")

		saynn("[say=rahi]Aw..[/say]")

		saynn("Rahi escapes your grasp and hides the empty bottle under one of the rocks. She then approaches you, being all wobbly.")

		saynn("[say=rahi]Gotta get another one..[/say]")

		saynn("[say=pc]You had enough I think, kitten. You gotta get some rest.[/say]")

		saynn("But she shakes her head.")

		saynn("[say=rahi]She will go get another one, you can stay..[/say]")

		saynn("After that, the feline just takes off somewhere. You feel like you gotta follow her before she  gets into some trouble.")

		addButton("Follow her", "Look for Rahi", "see_rahi_steal")
	if(state == "drink_whiskey"):
		saynn("Sure, why not. You fetch the bottle off Rahi and drink straight out of it. A few gulps is enough to make your throat burn. You can't help but to cough a few times, how is she drinking this stuff every day?")

		saynn("Rahi smiles softly after seeing you struggle with the bottle.")

		saynn("[say=rahi]Never drank it?[/say]")

		saynn("[say=pc]Just gotta get used to it. You feel alright lately, Kitten?[/say]")

		saynn("Your other hand reaches to rest on her far shoulder as you shift closer to her.")

		saynn("[say=rahi]Yeah, mostly.[/say]")

		saynn("You raise a brow, still keeping the bottle to yourself.")

		saynn("[say=pc]Mostly?[/say]")

		saynn("[say=rahi]Belly hurts sometimes..[/say]")

		saynn("You lean closer to Rahi's cheek and land a little kiss. The feline blushes more, her eyes stare at the sloshing fluids though.")

		saynn("[say=pc]Tried going to the doctors?[/say]")

		saynn("[say=rahi]Yeah.. They wanted to put her into a giant pod.. With water in it.. Ugh-h–h..[/say]")

		saynn("[say=pc]I see..[/say]")

		saynn("[say=rahi]And it didn't help for long anyways. So she won't go to the doctors again..[/say]")

		saynn("You nod a few times and let the kitty lean into you.")

		saynn("[say=pc]You said you moved into a town?[/say]")

		saynn("Kitty nods.")

		saynn("[say=rahi]That's how the AlphaCorp people called it. They built a few of those around her planet. They did a lot to make us live better. Or so they said..[/say]")

		saynn("[say=pc]You don't feel that way?[/say]")

		saynn("Rahi doesn't say anything for a few seconds. Finally she breaks the silence.")

		saynn("[say=rahi]Yeah.. You gonna finish that bottle?..[/say]")

		saynn("Oh right, you're still holding it. You're not sure if you should let her drink more. But you feel that she will be upset if you just take away her bottle. It's almost empty anyways.")

		addButton("Give her bottle", "Let Rahi finish the bottle", "let_rahi_finish_bottle")
		addButton("Drop the bottle", "Accidentally drop the bottle so Rahi wouldn't be able to drink out of it anymore", "drop_rahis_bottle")
	if(state == "let_rahi_finish_bottle"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcAction="stand"})
		saynn("You hand Rahi the bottle back. She quickly grabs it and proceeds to sip out of it. Your other hand squishes her shoulder, causing the feline to start purring.")

		saynn("[say=pc]You know that it's not healthy? It's probably why your belly hurts.[/say]")

		saynn("The feline nods a few times but keeps licking up what's left inside of that whiskey bottle.")

		saynn("[say=pc]Right. I think that's enough for..[/say]")

		saynn("Rahi cuts you off.")

		saynn("[say=rahi]She is gonna go get another one.[/say]")

		saynn("The brown kitty stashes an empty bottle under one of the rocks and then prepares to leave. You try to get a hold of her collar but she uses her feline agility to avoid your hands.")

		saynn("[say=rahi]You can stay if you want.. Thank you for being around..[/say]")

		saynn("After that just takes off into the direction of the main hall, her motions have quite some drunk sway to them. You feel like she might get into some trouble so you gotta follow her.")

		addButton("Follow her", "Look for Rahi", "see_rahi_steal")
	if(state == "drop_rahis_bottle"):
		setFlag("RahiModule.rahi2SpilledBottle", true)
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcAction="stand"})
		saynn("You can't let Rahi get completely drunk. But you can't just deny her. You reach your hand with the bottle towards hers but then just 'accidentally' let go of it. The feline immediately jumps after it, trying to catch it. But she wasn't fast enough. The bottle hits the bench and topples over before hitting the ground, spilling the rest of its contents.")

		saynn("[say=pc]Oh, fuck. Sorry.[/say]")

		saynn("Rahi furrows her brows at you, her tail wagging ever so slightly.")

		saynn("[say=rahi]Did you..do that.. on purpose?..[/say]")

		saynn("[say=pc]Just an accident.[/say]")

		saynn("Rahi stares at the wet ground and huffs before letting out a sad sigh.")

		saynn("[say=rahi]She is gonna go get another one.[/say]")

		saynn("The feline gets up and looks in the main hall direction. Your hand grabs her by the shirt.")

		saynn("[say=pc]Hey. Maybe you had enough for one day, kitten? Let's just rest.[/say]")

		saynn("[say=rahi]If you want to rest, you can wait here..[/say]")

		saynn("Rahi uses her feline agility to escape your grasp and runs off somewhere. You get a feeling that you should follow her before she gets into some trouble.")

		addButton("Follow her", "Look for Rahi", "see_rahi_steal")
	if(state == "see_rahi_steal"):
		playAnimation(StageScene.Solo, "walk")
		aimCameraAndSetLocName("yard_firstroom")
		saynn("You swiftly follow the fast feline, hoping that she didn't run off too far.")

		saynn("Luckily, she seems to be just wandering around the main hall, staring at the guard patrols.")

		saynn("What is her plan exactly?")

		addButton("Continue", "See what happens next", "rahi_steals_from_guard")
	if(state == "rahi_steals_from_guard"):
		playAnimation(StageScene.Duo, "defeat", {pc="rahi", npc=guard_id})
		saynn("Rahi suddenly runs into one of the guards. The bulky armor that {npc.he} is wearing was enough to make the feline bounce off of {npc.him} and fall in a clumsy way.")

		saynn("[say=rahi]Ah![/say]")

		saynn("The guard stares down at the feline on the floor.")

		saynn("[say=npc]Watch it, cat.[/say]")

		saynn("Kitty is rubbing her bruised knees and tilts her head down, her ears droop.")

		saynn("[say=rahi]She is sorry.. Just an accident..[/say]")

		saynn("The guard squints.")

		saynn("[say=npc]Sure. Go away before I lock you into the stocks.[/say]")

		saynn("Kitty nods-nods many times and quickly takes off again.")

		addButton("Follow", "See where Rahi goes now", "rahi_near_vendomat")
	if(state == "rahi_near_vendomat"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		aimCameraAndSetLocName("main_hallroom1")
		GM.pc.setLocation("main_hallroom1")
		saynn("You peek your head from behind the corner and see Rahi approaching the vendomat in the main hall, her paw is sneakily holding some item. The machine beeps as the feline presses that item against the same spot where you put your credits in.")

		saynn("Even from a distance, you notice that the menu that is presented to her is much bigger than usual. Huh. Rahi selects one of the options and waits for the machine to dispense that item for her. To no surprise, it's alcohol, a fresh bottle of space whiskey. A bottle that she already makes some gulps out of and then quickly hides under her shirt.")

		saynn("That can't continue anymore, you quickly approach the feline and pin her paws against the wall. Her right paw has a bottle and her left one is hiding a guard's badge.")

		saynn("[say=rahi]Hey.. l-let go.. before anyone sees her..[/say]")

		saynn("[say=pc]That's enough for you, Rahi. You can barely stand.[/say]")

		saynn("[say=rahi]Don't.. call her.. Rahi..[/say]")

		saynn("The feline tries to struggle, pushing you away using her whole body. But she is drunk. So you easily overpower her and pin against the wall again.")

		saynn("[say=pc]Here is what's gonna happen. You're gonna give me that bottle. And you're gonna return the badge back to that guard. And then you're gonna go have a nice nap in your cell. Understand?[/say]")

		saynn("The feline pouts at you. But then suddenly leans towards you and lands a kiss straight on your lips. A passionate one too, her head slightly tilted to the side while she drags her rough tongue over your closed lips. You see her cheeks reddening. Rahi looks.. cute..")

		addButton("Kiss her back", "Turn this kiss into a deep one", "rahi_keep_kissing")
		addButton("Pull away", "You can't let her cloud your mind", "rahi_stop_kissing")
	if(state == "rahi_keep_kissing"):
		setFlag("RahiModule.rahi2KissedRahi", true)
		saynn("Well, might as well kiss that bratty cat back before fetching the alcohol. Your hands wrap around her girly chest and help you pull yourself closer to her. Your lips return the kiss, your own tongue rolling out and brushing against Rahi's, exchanging fluids during a little dance. You can feel subtle vibrations that become audibly in the form of a purring.")

		saynn("Your hands slip under her shirt and sink its digits in that rich brown fur of her back. Rahi keeps kissing you when suddenly..")

		saynn("[say=npc]Hey![/say]")

		saynn("It's that same guard. The feline instantly hides the bottle under her shirt again while the other paw seemingly tries to hold hands with you only to use that moment to hand you the badge.")

		saynn("[say=npc]I'm talking to you, lovers. Turn around before I fry both of your necks.[/say]")

		addButton("Turn around", "Oh well. What can you do", "turn_towards_guard")
	if(state == "rahi_stop_kissing"):
		saynn("Instead of continuing that kiss, you pull away from it and push the feline against the cold wall harder. Rahi furrows her brows as you forcibly fetch both items from her paws.")

		saynn("[say=rahi]Just let her do what she wants to do..[/say]")

		saynn("[say=pc]I can't, kitten.. You shouldn't be doing this..[/say]")

		saynn("She sighs audibly and seemingly gives up. But then you hear a voice from behind you.")

		saynn("[say=npc]Hey![/say]")

		saynn("It's that same guard. While you were busy being spooked by the angry voice, the feline yoinks the bottle out of your hands and hides it under her shirt. Wow, she is good at that.")

		saynn("[say=npc]I'm talking to you two. Turn around before I fry both of your necks.[/say]")

		addButton("Turn around", "Oh well. What can you do", "turn_towards_guard")
	if(state == "turn_towards_guard"):
		playAnimation(StageScene.Duo, "stand", {npc=guard_id})
		removeCharacter("rahi")
		saynn("You turn around first. And the guard instantly spots that your hand is clenched, holding something.")

		saynn("[say=npc]So that's where my badge is.[/say]")

		saynn("All the while the feline just.. tactically retreats.. away from both of you. She seems to succeed because the guard's eyes are focused on you only.")

		saynn("[say=npc]You're gonna return it to me. And then we will figure out your punishment, inmate.[/say]")

		saynn("The guard holds {npc.his} stun baton ready, approaching you slowly until {npc.he} corners you.")

		saynn("[say=npc]Or, actually. Let's just skip to the beating up part.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "start_guard_fight")
	if(state == "if_won"):
		playAnimation(StageScene.Duo, "stand", {npc=guard_id, npcAction="defeat"})
		saynn("The guard collapses to {npc.his} knees, unable to continue fighting!")

		saynn("[say=npc]You.. bitch..[/say]")

		saynn("[say=pc]Uh huh. Means you're buying.[/say]")

		saynn("You swipe the guard's badge over the vendomat's slot for credits and pick some energy drinks. All the while you feel {npc.his} gaze full of hatred glued to you.")

		saynn("[say=pc]What? Angry that you can't buy condoms anymore?[/say]")

		saynn("[say=npc]I don't need condoms to fuck you.[/say]")

		saynn("You nod a few times and throw the badge, aiming for the guard's face. It bounces off of {npc.him} while {npc.he} yelps.")

		saynn("You leave the guard alone after that. Huh. Rahi is nowhere to be seen. Probably hiding somewhere, battling her addiction the only way she knows how.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "if_lost"):
		playAnimation(StageScene.Duo, "defeat", {npc=guard_id})
		saynn("Unable to continue fighting, you collapse and await your fate.")

		saynn("And the fate comes quickly, the guard pins you with {npc.his} armored boot before pressing the stun baton against your chest, sending a powerful non-ending spike of electricity through you. The pain is immeasurable, you drop the guard's badge and just try to endure the sensations of your muscles spazzing out uncontrollably.")

		saynn("[say=npc]See what happens when you try to fuck with us, inmate? Stupid bitch.[/say]")

		saynn("After about ten seconds of non-stop painslut training, the guard finally pulls away {npc.his} weapon and grabs the badge.")

		saynn("[say=npc]Gonna be a lesson for you.[/say]")

		saynn("You're left to pant on the cold floor as the guard just leaves you alone. Ow. Everything hurts.")

		saynn("After some time you manage to get up, using the nearby vendomat for support.")

		saynn("You look around. Huh. Rahi is nowhere to be seen. Probably hiding somewhere, battling her addiction the only way she knows how.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sit_near_pond"):
		processTime(5*60)

	if(_action == "drink_whiskey"):
		GM.pc.addIntoxication(0.3)

	if(_action == "see_rahi_steal"):
		processTime(5*60)

	if(_action == "rahi_steals_from_guard"):
		processTime(5*10)
		guard_id = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Guards, [], GuardGenerator.new(), {NpcGen.Level: 10})
		addCharacter(guard_id)

	if(_action == "rahi_near_vendomat"):
		processTime(5*60)

	if(_action == "turn_towards_guard"):
		processTime(5*60)

	if(_action == "start_guard_fight"):
		runScene("FightScene", [guard_id], "guard_fight")
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "guard_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(50)
			GM.pc.getInventory().addItem(GlobalRegistry.createItem("EnergyDrink"))
			GM.pc.getInventory().addItem(GlobalRegistry.createItem("EnergyDrink"))
			GM.pc.getInventory().addItem(GlobalRegistry.createItem("EnergyDrink"))
			addMessage("You receive 3 energy drinks for free")
			setFlag("RahiModule.rahi2WonGuard", true)
		else:
			setState("if_lost")
			addExperienceToPlayer(30)
			GM.pc.doWound(guard_id)
			GM.pc.addPain(100)
			GM.pc.addStamina(-GM.pc.getStamina())
			setFlag("RahiModule.rahi2WonGuard", false)

func saveData():
	var data = .saveData()

	data["guard_id"] = guard_id

	return data

func loadData(data):
	.loadData(data)

	guard_id = SAVE.loadVar(data, "guard_id", "")

func getDevCommentary():
	return "This is the payoff for the other 'chill' scene x3. Ideally, this time, different thoughts should be going through your head. Thoughts like 'maybe she shouldn't do that'.\n\nBut basically I'm just speedrunning Rahi's self-destruction here, to set her up for the anti-climax.. is that even a term? x3"

func hasDevCommentary():
	return true
