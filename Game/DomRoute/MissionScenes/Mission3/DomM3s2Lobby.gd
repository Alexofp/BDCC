extends SceneBase

func _init():
	sceneID = "DomM3s2Lobby"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", pc="captain"})
		addCharacter("captain")
		addCharacter("eliza")
		addCharacter("risha")
		aimCameraAndSetLocName("med_lobbymain")
		saynn("The moment you step inside the medical lobby, you see a curious scene.")

		saynn("The captain.. the captain himself.. is standing near the counter, facing the only doctor in the whole lobby.")

		saynn("[say=eliza]Welcome, captain! Dr. Quinn here. What can I do for you?[/say]")

		saynn("There are some nurses around, minding their own business. But the biggest threat seems to be coming from Risha, a familiar guard that is standing by the cap's side.")

		saynn("[say=captain]Yes, hey hey. Just wanted to check on you all. Things running smoothly?[/say]")

		saynn("Risha leans against the counter, putting her paws all over it. The doctor gives her a quick glare.")

		saynn("[say=kait]Psst![/say]")

		saynn("What's that noise?")

		saynn("[say=eliza]Well, yeah. I would say so. Things going great.[/say]")

		saynn("[say=kait]Psst-psst! Get your butt over here.[/say]")

		saynn("Oh. You turn your head and see the whole group chilling in the corner of the lobby, on two inconspicuous benches. Kait.. Ferri.. even Avy is here this time.")

		addButton("Join", "Join your team", "join_team")
	if(state == "join_team"):
		addCharacter("kait")
		addCharacter("avy")
		addCharacter("ferri")
		aimCameraAndSetLocName("med_lobbyse")
		saynn("You place your rear on one of the benches but continue watching the trio near the counter.")

		saynn("[say=eliza]We had a shipment arrive from cargo not that long ago. So we should be good for a while.[/say]")

		saynn("Kait seems to be hardly staying still. She is whispering to you all.")

		saynn("[say=kait]Why don't we jump him? Here and now.. get it over with.[/say]")

		saynn("[say=avy]That's a dumb idea. A really stupid one.[/say]")

		saynn("[say=kait]Why? We can take him, all of us. Him and his stupid guard.. I'm sure that yellow pussy cat will skadoodle as soon as the action starts.[/say]")

		saynn("Kait tries to get up but Avy yanks her back.")

		saynn("[say=avy]Sit. Your. Ass. Still.[/say]")

		saynn("[say=ferri]If the captain is down here with us.. he probably knows that he can protect himself. Mew.[/say]")

		saynn("Kait grumbles to herself.")

		saynn("[say=captain]The shipment has arrived? Good. One of the inmates has been a bit.. troublesome. Did that special order arrive too?[/say]")

		saynn("[say=eliza]One second![/say]")

		saynn("Eliza leans down to type something on her laptop.")

		saynn("[say=avy]The fuck is he talking about. Is he talking about me?[/say]")

		saynn("[say=kait]The world does not revolt around you, Avy.[/say]")

		saynn("Risha seems to be getting quite bored, rolling her stun baton along the surface of the counter. It makes the other feline tap away on the metal with her claws with her free paw.")

		saynn("[say=eliza]Oh. Yes, it did. Do you need it now?[/say]")

		saynn("[say=captain]No. Keep it for now. Somewhere secure. We would rather bring them down to you. If things get worse that is.[/say]")

		saynn("[say=eliza]Sure. I will be waiting then~![/say]")

		saynn("Eliza offers the captain a little smile.")

		saynn("With that, the captain exchanges goodbyes.. and heads back to the elevator. His guard lingers a bit to show a middle finger to the doctor.. but then follows him as well.")

		addButton("Continue", "See what happens next", "captain_leaves")
	if(state == "captain_leaves"):
		removeCharacter("captain")
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "sit", {pc="kait", npc="avy", npcAction="sit"})
		saynn("[say=kait]Are we getting into a trap?[/say]")

		saynn("It's all confusing indeed. Some things just don't fit in.")

		saynn("[say=pc]This might not be about us at all. We're a group, not a single person.[/say]")

		saynn("[say=kait]Yeah.. but now they have.. whatever it is that they have.. down here.[/say]")

		saynn("A special order.. It'd be nice to know what it is.")

		saynn("[say=avy]Is your tail shivering, pussy cat? You were roaring into battle. Thinking of pulling out?[/say]")

		saynn("[say=kait]No? Obviously.. Duh. But we missed the chance to get the captain.[/say]")

		saynn("Eliza catches your direct glance. Her brow raises as she looks at your group, corners of her mouth getting tighter. Seeing a bunch of inmates just sitting together.. her suspension is rising no doubt.")

		saynn("You gotta make a move. Any move.")

		saynn("[say=pc]Ferri, up. Follow me. Avy and Kait, you sit tight for now. Try not to kill each other.[/say]")

		saynn("It seems that they listened. At least for now.")

		addButton("Counter", "Approach the counter with Ferri", "approach_counter")
	if(state == "approach_counter"):
		removeCharacter("avy")
		removeCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("med_lobbymain")
		saynn("You slowly approach the counter. Ferri puts herself by your side, blinking at the feline.")

		saynn("[say=eliza]Doctor Quinn here. What can I do to you?[/say]")

		saynn("The question coupled with her cunning, curious eyes made the dracat swallow.")

		saynn("[say=pc]Hey there, doctor. Haven't seen the captain down here before.[/say]")

		saynn("[say=eliza]Hah. He is a nice guy, isn't he? Pays us a visit ever so often. Always a pleasant surprise.[/say]")

		saynn("[say=pc]Certainly. Excuse me for eavesdropping a bit but I got curious. Someone is bugging him?[/say]")

		saynn("She raises a brow again. Then she smiles and leans in closer, her voice gets quieter.. deeper.. slower.")

		saynn("[say=eliza]You better pay no mind to his words, inmate. You know.. it is so sad when some inmates develop short-term amnesia, so unfortunate. Good thing we have all the facilities required to give such patients the best treatment possible, at our fancy mental ward wing.[/say]")

		saynn("Ferri's ears turn down, her cheeks blushing.")

		saynn("You could respond to her threats. Start a huge fight. Something tells you that this isn't a good idea. You just squint a bit and take her words.")

		saynn("Eliza is quick to change her tone as she looks at Ferri.")

		saynn("[say=eliza]Ohh~. That's a cute dracat you got here. Look at those horns, they just make me wanna rub them~.[/say]")

		saynn("[say=ferri]Mew..[/say]")

		saynn("[say=eliza]I bet you brought her to be milked~? Please say yes, the hybrids always taste the best.[/say]")

		saynn("This.. could be your way in. Not just yours too.")

		saynn("[say=pc]Sure, yes. But I wanna watch, control the process.[/say]")

		saynn("[say=eliza]Ohh, you're a possessive one~. Fair enough. Is she lactating?[/say]")

		saynn("Ferri looks down at her clothed chest.")

		saynn("[say=ferri]Nyo..[/say]")

		saynn("[say=eliza]Not a problem! We got all the prolactin in the world here~. Gonna get that cutie dripping in no time.[/say]")

		saynn("Eliza steps away from the counter and steps behind one of the walls.")

		saynn("Half a minute later, she opens the staff-only door to your left and invites you in.")

		saynn("[say=eliza]Follow me, patients~.[/say]")

		saynn("Avy and Kait look at you with puzzled gazes. You sneakily signal them with an open palm.")

		saynn("Before you step through the door, Eliza stops you. Her eyes turn strict.")

		saynn("[say=eliza]Hm. Wait. Stop where you are.[/say]")

		saynn("Did she already figure it out? Fuck. You and Ferri do as she says.. your hands slowly clenching.")

		saynn("[say=eliza]It is required for patients who wanna step into the staff-only area to be on a leash.[/say]")

		saynn("Her paw produces a chain leash. Right.")

		saynn("[say=pc]I'm afraid you will have to bend the rules a little. You are not leashing me.[/say]")

		saynn("[say=eliza]Really~?[/say]")

		saynn("She closes the distance, squinting, her arms half-crossed under her chest, her free paw holding her chin high.")

		saynn("The feline leans in closer to your face, her emerald eyes drilling you.")

		saynn("[say=eliza]Something tells me.. that you are planning to cause trouble.[/say]")

		saynn("Her warm breathing is tickling your nose. She is searching for signs of fear.")

		saynn("You tilt your head slightly and furrow your brows, your voice becomes annoyed.")

		saynn("[say=pc]Can you milk my pet or not? I could leave and do it myself, I don't really need any of this.[/say]")

		saynn("You were turning your head, about to head off.")

		saynn("[say=eliza]No-no. That's unnecessary~. But I'd prefer if you'd leash your pet at least.[/say]")

		saynn("She hands you the chain. You grab it.")

		saynn("[say=pc]I could do that.[/say]")

		saynn("Blushing Ferri raises her chin a bit, giving you more access to her collar. You clip the leash and tug on it, stealing a quiet gasp from her.")

		saynn("[say=eliza]Let's go, patients~.[/say]")

		addButton("Follow", "See where Eliza brings you", "follow_eliza")
	if(state == "follow_eliza"):
		aimCameraAndSetLocName("med_nearlab")
		playAnimation(StageScene.Duo, "walk", {pc="ferri", npc="pc", npcAction="walk", flipNPC=true, bodyState={leashedBy="pc"}})
		saynn("You have a little chat on the way to your destination.")

		saynn("[say=pc]We're not really patients, you know.[/say]")

		saynn("[say=eliza]Everyone who steps in is a patient in my eyes.[/say]")

		saynn("[say=pc]All the inmates are sick by default in your eyes?[/say]")

		saynn("[say=eliza]Not sick, no. But they're not inmates either. Patient means 'the one who suffers'.[/say]")

		saynn("[say=pc]We're not really suffering.[/say]")

		saynn("[say=eliza]Does your cutie think the same?[/say]")

		saynn("Ferri quickly gets flustered by that description.")

		saynn("[say=ferri]I'm not a cutie![/say]")

		saynn("Eliza looks back and smiles.")

		saynn("[say=eliza]Exactly what a cutie would say~.[/say]")

		saynn("[say=ferri]I will bite you..[/say]")

		saynn("[say=eliza]Do it~. See what happens. C'mon, it's not often I get to use straitjackets~.[/say]")

		saynn("Ferri's glance darts around the corridor. Your hand still holds her leash tightly.")

		saynn("[say=ferri]Grr.. I will do it later.. when I'm not on a leash..[/say]")

		saynn("Eliza giggles and looks at you instead.")

		saynn("[say=eliza]Hehehe. Your pet is really adorable.[/say]")

		saynn("[say=pc]Thanks. I agree.[/say]")

		saynn("[say=ferri]Mhhrhh.. mow-w..[/say]")

		saynn("Two versus one. So unfair for the poor dracat. She pouts the rest of the way, her long tail tapping against the bright, sterile walls.")

		addButton("Continue", "See what happens next", "in_milking_room")
	if(state == "in_milking_room"):
		addCharacter("ferri", ["naked"])
		playAnimation(StageScene.Grope, "tease", {pc="ferri", npc="eliza", bodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("med_milkingroom")
		saynn("You step inside a big room that has a lot of.. equipment. Huge fluid tanks.. pipes everywhere.. and of course.. milking stalls, all separated by thin walls.")

		saynn("Your ears pick up on moans that escape from one of the stalls.")

		saynn("[say=eliza]That one is busy, let's pick another one~.[/say]")

		saynn("Eliza brings you into a little secluded space. Kinda reminds you of your.. recruitment room. But this one is clearly geared towards a very different purpose.")

		saynn("[say=eliza]Please strip, cutie. I can't milk you through your uniform.[/say]")

		saynn("Ferri fails to find a way to brat and so she obeys, her clawed digits undoing the buttons of her shirt.")

		saynn("[say=eliza]Speaking of. I could hook her up to a milking machine.. or I can do it the oldschool way, with these paws~.[/say]")

		saynn("Hand milking would keep her busy.. you have to go for that option.")

		saynn("[say=pc]Oldschool sounds good to me. Can't trust all these machines.[/say]")

		saynn("[say=eliza]I like the way you think, yes.[/say]")

		saynn("By this point, Ferri is standing naked, her hefty chest on display. Your gazes make her try to cover her cyan nips and pussy slit.. but she only has two hands.")

		saynn("[say=ferri]Mew..[/say]")

		saynn("[say=pc]Her name is Ferri.[/say]")

		saynn("[say=eliza]Alright, Ferri. Please step inside the stall, grab the metal bar~.[/say]")

		saynn("You stand near the exit. Maybe you will get a chance to slip away.. but for now you still have to play along.")

		saynn("[say=pc]How long will this take? Roughly speaking.[/say]")

		saynn("Eliza is busy putting some shiny latex gloves on her paws.")

		saynn("[say=eliza]You want me to do it roughly~? I prefer a sensual touch, hehe. About an hour. Make yourself comfortable.[/say]")

		saynn("There are a few chairs here.. but you prefer to stand.")

		addButton("Continue", "See what happens next", "ferri_in_stall")
	if(state == "ferri_in_stall"):
		playAnimation(StageScene.MilkingStallDuo, "start", {pc="ferri", npc="eliza", bodyState={naked=true, hard=true}})
		saynn("Ferri steps behind a simple metal frame. She hesitates a little, her tail leashing behind her.")

		saynn("[say=eliza]Don't be shy. You were all talk a moment ago. Step in and give me your paws.[/say]")

		saynn("Ferri shoots her a look.. but obeys anyway. The moment her paws grip the bar, Eliza snaps a pair of cuffs around her wrists. And so now Ferri is forced to bend forward, her curvy breasts swinging beneath her.")

		saynn("[say=ferri]Hey.. mew..[/say]")

		saynn("[say=eliza]Keeps you from squirming.[/say]")

		saynn("Ferri's cyan nips are already stiff, the cool air of the room making them hard. Eliza sets a clean empty milk tank beneath Ferri's chest.")

		saynn("The doctor looks at you for the final approval. You nod.")

		saynn("[say=eliza]Let's begin.[/say]")

		addButton("Continue", "See what happens next", "ferri_milking")
		addButton("Skip", "You'd rather not pay attention to what Eliza is gonna do", "ferri_milking_skip")
	if(state == "ferri_milking"):
		playAnimation(StageScene.MilkingStallDuo, "milk", {pc="ferri", npc="eliza", bodyState={naked=true, hard=true}})
		saynn("When Eliza's paws make contact with Ferri's breasts, the dracat jolts. The touch looks quite firm to you, Eliza is cupping the heavy weights and kneading them with nice, slow circles. Her thumbs brush over the stiff nips.")

		saynn("[say=ferri]Nnhh..[/say]")

		saynn("[say=eliza]Not so bad.[/say]")

		saynn("Her digits are tracing the counters of each breast. Ferri's breathing goes shallow, her claws scraping against the metal bar. She bits her lip, trying to hold back the sounds.")

		saynn("[say=eliza]Let it out, cutie. No one is judging.[/say]")

		saynn("[say=ferri]Sh-shush.. ah..[/say]")

		saynn("Eliza squeezes harder, her digits digging in, working from the base and towards each nipple. She pinches one cyan nub and rolls it between her claws. Ferri's hips sway involuntarily, a soft whine escaping her.")

		saynn("[say=eliza]Hm.[/say]")

		saynn("Eliza tilts her head, examining Ferri. She squeezes her breasts again.. and soon.. a single bead of clear fluid starts streaming down her cyan nipple.. and then another.")

		saynn("[say=eliza]There we go~. You don't even need prolactin, you're already quite milky.[/say]")

		saynn("[say=ferri]M-mew.. ah..[/say]")

		saynn("Ferri's nips turn a darker shade, looking quite heavy. The feline doctor keeps going away at it, pinching and tugging on dracat's teats, causing more and more of her milk to start dripping down into the milk tank below.")

		saynn("While the fun is happening, you sneak more towards the exit. Eliza seems to be fully absorbed by the process, her eyes fixed on her work, lips murmuring soft encouragements to Ferri.")

		saynn("About as good of a moment as ever. Better make those minutes count.")

		addButton("Slip away", "Time to let your team in", "let_team_in")
	if(state == "ferri_milking_skip"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You let Eliza start work on Ferri.")

		saynn("When the feline doctor's attention gets absorbed by the process, you sneak away.")

		addButton("Slip away", "Time to let your team in", "let_team_in")
	if(state == "let_team_in"):
		removeCharacter("eliza")
		removeCharacter("ferri")
		addCharacter("kait")
		addCharacter("avy")
		aimCameraAndSetLocName("med_staffonly_door1")
		GM.pc.setLocation("med_nearlab")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="avy"})
		saynn("You rush out of the milking room.. and follow the corridor back to the staff-only room.")

		saynn("It seems that this door can be opened without having any special access.. but only from this side. And so you do it.")

		saynn("You peek your head out to make sure none of the nurses are watching.. and then you get attention of the two bored inmates that are sitting on different benches.")

		saynn("The moment they see you, they jump off the benches and run up to you.")

		saynn("[say=avy]You took your sweet time.[/say]")

		saynn("[say=kait]Where is the cat? And the other cat?[/say]")

		saynn("[say=pc]They're busy. C'mon, we don't have much time. Let's find the room.[/say]")

		saynn("Avy and Kait start following the corridor, looking for the right room.")

		saynn("Medical storage room.. Time to find it.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "join_team"):
		processTime(2*60)

	if(_action == "follow_eliza"):
		processTime(5*60)

	if(_action == "let_team_in"):
		addMessage("Task updated!")

	setState(_action)
