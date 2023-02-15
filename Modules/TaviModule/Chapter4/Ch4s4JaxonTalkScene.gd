extends SceneBase

func _init():
	sceneID = "Ch4s4JaxonTalkScene"

func _run():
	if(state == ""):
		addCharacter("jaxontau")
		playAnimation(StageScene.Duo, "stand", {npc="jaxontau"})
		aimCameraAndSetLocName("taviroom_near")
		saynn("You follow Jaxon as you walk through the corridors back to your room.")

		saynn("[say=pc]Why is that guy so.. cold.[/say]")

		saynn("Jaxon chuckles softly.")

		saynn("[say=jaxontau]That's what time does to people, Tavi. The director has to make a lot of tough decisions every day.[/say]")

		saynn("[say=pc]Decisions? You're saying he won't just send us as meat to the frontlines?[/say]")

		saynn("You approach your room. The guard stops and looks at you, his hand rests on your shoulder.")

		saynn("[say=jaxontau]I trust him not to, Tavi. It's his life project after all.[/say]")

		saynn("[say=pc]Yeah, this station has been my entire life so far too.[/say]")

		saynn("He tilts his head a bit and puts his hands on your cheek, making you look at him.")

		saynn("[say=jaxontau]A huge war is happening, Tavi. And we need the best weapons we can get.[/say]")

		saynn("You tilt your head down.")

		saynn("[say=pc]I know..[/say]")

		saynn("[say=jaxontau]We all will collectively exhale once the syndicate is defeated.. Have a good rest, Tavi.[/say]")

		saynn("He opens the airlock to your room and invites you inside. You just nod and step into your room. Still the same white sterile room. At least you had some fun today.")

		addButton("Bed", "Time for some rest", "get_on_bed")
	if(state == "get_on_bed"):
		addCharacter("jaxonbrothertau")
		playAnimation(StageScene.Duo, "stand", {pc="jaxontau", npc="jaxonbrothertau"})
		saynn("You approach your bed and grab the trusty datapad. Then you lie down and open random hacking articles, the best way to kill time for you.")

		saynn("You notice Jaxon walking past your room. And as he does that, he meets with another guard. You can't help but to get curious because they instantly go for a hug.")

		saynn("The room is sound-proof. And Elena told you not to play around with intercom spoofing. But you're so-o-o curious about what they're talking about, it's killing you..")

		addButton("Eavesdrop", "Listen in on their conversation", "eavesdrop")
	if(state == "eavesdrop"):
		saynn("You grab your datapad and run the intercom spoofing program.")

		saynn("[say=jaxontau]How is life treating you brother? How many girls did you fuck already~?[/say]")

		saynn("[say=jaxonbrothertau]Oh fuck off, Jaxon. Everyone keeps turning me down, these bitches.[/say]")

		saynn("Jaxon chuckles and taps on the other guard's shoulder.")

		saynn("[say=jaxontau]Don't be so mean, girls here just wanna work without you annoying them constantly. I'm sure you will find someone.[/say]")

		saynn("[say=jaxonbrothertau]Uh huh. Eventually. You already have kids, man. I don't want kids. But fuck. Call me jealous. I don't wanna die alone.[/say]")

		saynn("Jaxon tilts his head down.")

		saynn("[say=jaxontau]Yeah.. So sad that I can't see my kids that much lately. I loved playing with them, seeing them happy makes my heart warm.[/say]")

		saynn("[say=jaxonbrothertau]How are they, by the way? 6 and 4 if I remember right?[/say]")

		saynn("Jaxon smiles like only a father can. You look around your white feature-less room.")

		saynn("[say=jaxontau]The girl turned 7 last week. They grow so fast. I sent Jill some credits to buy her a present. She chose a dress. I have the picture here, she looks so nice in it, look at that smile.[/say]")

		saynn("Jaxon pulls up a picture on his datapad that you can't quite see. You only see that the girl's dress is red. You look at your white leotard.")

		saynn("[say=jaxonbrothertau]Cool. Totally. Why are you here and not with them I wonder.[/say]")

		saynn("[say=jaxontau]You know why, bro. This job pays very well. I want my wife and kids to live a good life, man. Unlike the life that we got.[/say]")

		saynn("From that moment you let go of the datapad and turn away, to stare at the wall. Inside you there is this lump of resentment, weighing you down. You try to keep your eyes dry, now is not the time for this. There is never a good time for this..")

		saynn("You gotta be strong, Tavi..")

		saynn("Time to take a nap..")

		addButton("Sleep", "Maybe tomorrow will be better", "take_a_nap")
	if(state == "take_a_nap"):
		addCharacter("directortau")
		removeCharacter("jaxontau")
		playAnimation(StageScene.Duo, "stand", {pc = "directortau", npc="jaxonbrothertau"})
		saynn("At least the bed is nice, you swiftly slip into the land of dreams.")

		saynn("Rest helps you reset your mind, all the draining thoughts are put away on the backburner. You feel.. calm.")

		saynn("A noise makes your feline ears perk.. a voice. Is it time to rise?")

		saynn("[say=jaxonbrothertau]My brother is responsible for this block, why don't you ask him?[/say]")

		saynn("Oh, the spoofing program is still on, messing with your sleep. Probably better to turn it off before Elena spots you again. Without even opening your eyes, your paws grab the datapad and blindly search for the little cross in the corner, damn touch displays.")

		saynn("[say=directortau]I believe that your brother wouldn't be able to.. carry through.. with this task. He has a level of attachment to her.[/say]")

		saynn("You're still drowsy, your head struggles to make sense out of what you're hearing. You slowly open your eyes and see the director and Jaxon's brother standing behind the glass of your room.")

		saynn("[say=directortau]A level of attachment that would cloud his head, preventing him from seeing the bigger picture.[/say]")

		saynn("[say=jaxonbrothertau]What's the task though?[/say]")

		saynn("Your paw stops searching for the close button. A few seconds of silence pass. Director steps closer to the other guy.")

		saynn("[say=directortau]I'm marking Project Toxic Virus as a failed one.[/say]")

		saynn("[say=pc]Huh?..[/say]")

		saynn("The sleepiness quickly fades away. You carefully track the director's every word from now on.")

		saynn("[say=jaxonbrothertau]Isn't that project the ugly cat over there?[/say]")

		saynn("[say=directortau]Yes. I wouldn't call her ugly but the value that can be extracted from her isn't enough to cover the costs.[/say]")

		saynn("[say=jaxonbrothertau]So what do you want to be done, sir?[/say]")

		saynn("You're not even sure how to react yet. Are they gonna let you go? Or..")

		saynn("[say=directortau]All results need to be destroyed.[/say]")

		saynn("Your heart sinks. You sit on the bed and begin nervously fidget around. Your mind is racing. What should you do? You still have time, you gotta do something. But you're just in an empty room. On a space station that no longer welcomes you.")

		saynn("[say=jaxonbrothertau]Destroyed?[/say]")

		saynn("[say=directortau]Yes, your task is to deal with Tavi. Leave no traces of her body ever existing.[/say]")

		saynn("You hear a soft but evil chuckle.")

		saynn("[say=jaxonbrothertau]Sure, I can do that. But I have a question.[/say]")

		saynn("The datapad! You grab it and begin trying to manipulate the room controls. Maybe you can lock the doors, close the windows. There is gotta be something. But no, it looks like they patched out all the exploits that you were using. You have zero control. They only left this stupid spoofing exploit. You begin to panic.")

		saynn("[say=directortau]Yes?[/say]")

		saynn("[say=jaxonbrothertau]Can I have some.. fun.. with her first? Who cares if the body is gonna be burned to ashes, right?[/say]")

		saynn("[say=directortau]I don't care, just get the task done.[/say]")

		saynn("The guard chuckles louder as he begins to slowly approach your cell, holding his energy pistol. Time slows down, you begin to see everything in its miniscule details.")

		saynn("Your heart beats insanely fast. Yours and director's gazes collide. He sees fear in your big opened eyes. He steps closer to the intercom.")

		saynn("[say=directortau]I know you can hear me, Tavi. You're a smart girl. Too smart for your own good. You might not like my decision. But AlphaCorp has been built on hard decisions. In the end, you're just a weapon, a tool in the corporation's hand. And when the tool does not satisfy the requirements anymore, you gotta replace it. The war machine must work at its peak efficiency.[/say]")

		saynn("These words are like a knife cutting through your whole life.. You get up, your legs and arms are shaking. There is gotta be something that will save you.. Maybe you can hide in the shower and wait for Jaxon or Elena. Maybe you can..")

		addButton("Continue", "See what happens next", "tavi_gets_shot")
	if(state == "tavi_gets_shot"):
		removeCharacter("directortau")
		playAnimation(StageScene.Duo, "defeat", {npc="jaxonbrothertau", npcAction="firepistol"})
		saynn("Suddenly the airlock to your room opens and the guard aims his pistol at you before pulling the trigger without much thought. The strong laser beam goes straight through the datapad that you're holding, making a hole in it, before hitting you in the chest, leaving a nasty scorch mark.")

		saynn("You let out a cry before collapsing onto the floor. The pain is immeasurable, it echoes through both your mind and heart. The sudden understanding that this is how it's gonna end for you is settling in your head, corrupting your every thought.")

		saynn("The director sees you on the floor and furrows his brows before nodding to himself and leaving the scene shortly after.")

		saynn("[say=pc]P-please.. J-Just let me go, no one will know..[/say]")

		saynn("The guard laughs as he slowly steps closer to you. He puts his gun away behind his belt before producing some cuffs instead.")

		saynn("[say=jaxonbrothertau]That's the point, cat. Everyone will know how good of a guard I am, doing hard tasks without asking hard questions.[/say]")

		saynn("You try to crawl away but the pain.. You're in literal agony. Maybe.. Maybe your pills will soften the suffering that you're going through? You try to pull out the pill bottle but the guard sees it and kicks your paw with his boot, causing all the pills to scatter throughout the whole floor. Fuck..")

		addButton("Continue", "See what happens next", "tavi_gets_cuffed")
	if(state == "tavi_gets_cuffed"):
		playAnimation(StageScene.SexMissionary, "tease", {pc="jaxonbrothertau", npc="pc"})
		saynn("You grunt as he forcefully wrenches your paws behind your back before cuffing them together with cuffs, rendering you even more helpless. Then he begins to remove some pieces of his armor.")

		saynn("[say=jaxonbrothertau]I heard that your cunt wasn't used even once. Time for you to grow up.[/say]")

		saynn("The unfairness of this whole situation, it angers you. But the desperation and pain are winning over by a long shot. You are trying to resist but the guy easily overpowers you and pins you to the cold floor before forcefully spreading your legs and working on exposing his cock.")

		saynn("Is that how Tavi is gonna die? Betrayed and abused. That can't be right.. But what choices do you have now? The room.. is sound-proof. The guy forces himself on you, his hard dick already rubbing against your leotard, the last little barrier that keeps him from having it his way with you.")

		saynn("Your mind is telling you that \"YOU GOTTA DO SOMETHING, TAVI!\". In desperation, you kick that fucker off of you but that just makes him more eager. You try to struggle out of the cuffs, rattling the chain while hitting them against the floor. No give.. The guy slaps your face and reaches out to shift the leotard's crotch part to the side, already guiding his cock.. Tears begin to stream down your cheeks.")

		saynn("[say=jaxonbrothertau]Stupid bitch.[/say]")

		saynn("All your choices led up to this exact moment. Of nothingness. But did you really do anything to combat this unfair life, Tavi? Or were you just going along with the flow, picking the best out of the worst options that you were given. Maybe.. Maybe it's time to do something about that? Maybe it's time to change?")

		addButton("Resist", "It's now or never.", "tavi_understands")
		addDisabledButton("Give up", "Never")
	if(state == "tavi_understands"):
		saynn("All your memories rush through your head. You always dreamed of becoming a soldier for AlphaCorp. But now you realized, it's all lies.. it's them who made you want that. And the unfairness of all of this..")

		saynn("With all your might, you kick the guy off of you again to buy you some time. You're crawling away, looking around while trying to break the cuffs against the floor. You hear something clicking inside them but that's not enough. Your wounds hurt like hell but you don't give a fuck. You're literally doing everything you can. The guy pins you again.")

		saynn("[say=jaxonbrothertau]If you want rough, fine. Don't complain later, whore.[/say]")

		saynn("He puts his hands around your neck and starts choking you out. You grit your teeth while you try to kick him off again but this time it doesn't work, his knees hold your legs pinned too. You're stuck in one spot, your green toxic blood quickly losing oxygen due to your struggling.")

		saynn("If only the cuffs weren't there.. You bash them against the floor.. again and again.. But the metal, no matter how much you smash it, won't change. It's you who gotta change..")

		saynn("As your last ditch effort, you begin to desperately try to pull your paw out of the cuff. The stupid big finger is in the way. You let out a silent deafening scream as you push through, continuing to pull the hand out. Something inside your paw snaps with a nasty crack, one of the bones. And then again. But.. You're making progress. Almost instantly, you apply all the strength that you have left in you and yank the hand out of the cuff! Something inside your palm is broken but that's nothing compared to the pain of your heart.")

		saynn("Time for you to grow up. Close your eyes if you're not ready for this.")

		addButton("Do it", "It's now.", "tavi_kills_dude")
	if(state == "tavi_kills_dude"):
		removeCharacter("jaxonbrothertau")
		playAnimation(StageScene.Solo, "stand")
		saynn("The fake dreams of your own fake reality shatter like glass. You extend the claws of your broken paw and force them into the guard's neck with one rage-filled motion. You look him directly into the eyes as you force your claws deeper, making sure to do as much damage as possible. The guy gasps as the blood starts gushing out of his neck, following the contours of your digits before proceeding to drip down onto the floor, creating a puddle.")

		saynn("His grip on your throat weakens, letting you breathe. But you're not done yet. You sink your claws as deep as possible before dragging your paw to the side, tearing through his flesh and arteries, sealing the guy's fate. As he gets weaker, you get stronger, recovering back some of your strength.")

		saynn("Finally, you pull your claws out. The guy gasps a few more times and goes limp. You kick him away. You breathe heavily while looking at the ceiling. Your white leotard.. Your sterile white room.. your hands.. all covered in blood.")

		saynn("Your heart still beats like hell. But before the realization of what happened sinks in, the airlock suddenly gets locked shut and the air vents open up wide before proceeding to fill the room with some kind of yellow gas.")

		saynn("You use the bed as support while getting up, the constant pain makes you hiss. The intercom kicks in.")

		saynn("[say=elena]Code red, code red. Usage of lethal weapons is allowed. Locking all cells. Delivering pacifying gas. Please stand by and allow the staff to apprehend you if you got caught outside of your cell.[/say]")

		saynn("Soon followed by another transmission.")

		saynn("[say=directortau]One of you killed a guard and is now trying to escape. Stay. In. Your. Cells. And allow the gas to put you to sleep. Anyone disobeying my orders will be killed on sight. Guards, I order you to go into Tavi's cell and stop her by any means necessary![/say]")

		saynn("He sounds annoyed. But you have bigger problems. The gas is indeed slowly messing with your head, making you drowsy. That bed suddenly looks very inviting.")

		saynn("[say=pc]Fuck..[/say]")

		saynn("You look around. Your datapad is destroyed. But maybe.. The dead guard must have one. Yes!")

		saynn("Time is running out. You hold your breath and plunge into the gas to grab the guy's datapad. Shit, it's locked. Quick, think.. You find the button that switches it into the debug mode. Menus, options, buttons.. You log into the station's network using one of the stolen passwords. Airvents.. overriding settings.. turning off sleep-toxin gas.. enabling emergency air scrubbing.. success.. cell airlocks.. emergency unlock.. opening.. success.")

		saynn("Two more guards show up, they look at you through the glass. They see the dead body of their colleagues and frown. They just watch you for now.")

		saynn("The gas has stopped pouring into the room. Most of it escapes through the opened airlock. You can breathe again. There is no way you can kill every guard.. on your own.. Right, the intercom menu, global transmission button.. click.. You begin speaking into the datapad, fast and loudly.")

		saynn("[say=pc]I'm the one who the director is trying to kill! He is gonna kill us all if we stay still. I opened your rooms, you gotta escape while you can! Hear me? Escape, now![/say]")

		saynn("The intercom instantly answers.")

		saynn("[say=directortau]DON'T LISTEN TO HER. GUARDS, KILL EVERYONE WHO DOESN'T SURRENDER. ANYONE WHO MAKES A STEP OUT OF THEIR CELLS MUST BE STOPPED. KILL EVERYONE IF YOU HAVE TO.[/say]")

		saynn("The two guards proceed to rush towards the opened entrance to your room. Fuck!")

		addButton("Energy gun", "You must kill them", "tavi_grabs_energy_gun")
	if(state == "tavi_grabs_energy_gun"):
		playAnimation(StageScene.Solo, "firepistol")
		saynn("No time to prepare, you reach for the dead guard's energy pistol and grab it. Too late though, one of the guards sprints into the room and opens fire, forcing you to dive behind the body and let the dead armor absorb the energy blasts.")

		saynn("You peek your paw with the gun out and pull the trigger. Not even a second later you hear someone's body hit the floor. Your kill counter was rising a little too fast for your liking but, strangely enough, you didn't mind at that time.")

		saynn("You slowly get up, aiming your gun at the airlock just to get shot completely out of nowhere. A loud cry escapes from your lips while you hit the floor again, your shoulder took most of the damage. Where is he?!")

		saynn("[say=pc]Grr-r[/say]")

		saynn("The glass panel! The fucker is looking at you through the transparent wall. You quickly take your aim and fire back. Multiple energy blasts pass through the glass panels like it's not even there and hit the guy. Many misses but there was one lucky hit directly on his head, causing the guy to flop awkwardly, his eyes already lifeless.")

		addButton("Continue", "See what happens next", "grab_pill")
	if(state == "grab_pill"):
		aimCameraAndSetLocName("taviroom_near")
		saynn("You give yourself a few seconds of rest but the wounds remind you of their existence. It feels like all your 9 lives got used up right there, you were living on borrowed time. You pick up one of the strange pills off the ground and look at it.")

		saynn("But before you can make a decision, you begin to hear noises of a fighting happening outside. Screams and grunts, all sorts of impacts. You store the pill for later and get up.")

		saynn("As you make your way out of your old room, you realize that the whole station is overtaken by chaos. Doctors and scientists run past you while the guards fight with AlphaCorp's future soldiers. For once, you think that might get out of here alive.")

		saynn("The nice voice over the station-wide intercom tells you everything you needed to know.")

		saynn("[say=elena]Warning. Due to the mass riot, the evacuation is currently in progress. Level-3 staff must proceed to the escape pods. Follow the markings and signs to get to them. Security personnel must stay and contain the riot.[/say]")

		saynn("You're hiding behind one of the corners, licking your wounds wasn't enough to stop the pain. But it seems your best choice to escape this home of yours is through the usage of someone with a level 3 access card. And you're not the only one who understood that, most of the guards stopped fighting and instead began chasing after the lab coats, probably hoping to get out of this place. You'd do the same. But. You still have one thing you need to do.")

		addButton("Continue", "See what happens next", "tavi_walks")
	if(state == "tavi_walks"):
		aimCameraAndSetLocName("taviflashback_nearalien")
		addCharacter("latexParasite")
		saynn("You wait a bit for this corridor to clear up before rushing in the direction opposite to everyone's rush. The pain was returning again, stronger than ever. But it seems like you just stumbled upon a jackpot, one of the doctors is lying dead. His pockets seem to be looted but the belt is untouched. You look through it and find a stimpack, a loaded medical injector. You get a feeling that your death will catch up with you before you can get a chance to finish reading the list of contraindications so you just stick that thing into your neck and let it inject.. something.. into your bloodstream.")

		saynn("Luckily, it seems to be something good. It didn't magically regenerate your scorched flesh and broken bones but at least the pain was at acceptable levels. And just when you were ready to continue your adventure, something pounced on your leg and stopped you.")

		saynn("Oh fuck, it was the dark shiny goo. The alien parasite has escaped its room and probably decided that you are a nice snack. It feels tickly as the thing starts coating more and more of you with itself.")

		addButton("Kick it off", "Save the ammo", "kick_goo_off")
		addButton("Shoot it", "You'd rather not get consumed by it", "shoot_goo")
	if(state == "kick_goo_off"):
		saynn("Now is really not the time to babysit an alien, you jump and stomp on it a few times before trying to kick the substance off of your leg by smashing it against walls. The parasite feels your hostility and reluctantly slides off before leaving you alone.")

		saynn("No matter, time to increase your pace if you wanna get to the director before this whole station gets destroyed by its inhabitants.")

		addButton("Continue", "Continue on your way", "find_risha")
	if(state == "shoot_goo"):
		saynn("Now is really not the time to babysit an alien, you aim your gun at the black goo before pulling the trigger. The alien absorbs the shots completely, no scorch marks are visible. You land a few more careful blasts until the parasite reluctantly slides off and leaves you alone.")

		saynn("No matter, time to increase your pace if you wanna get to the director before this whole station gets destroyed by its inhabitants.")

		addButton("Continue", "Continue on your way", "find_risha")
	if(state == "find_risha"):
		removeCharacter("latexParasite")
		addCharacter("rishatau")
		aimCameraAndSetLocName("tau_nearrisharoom")
		saynn("You walk past Risha's room and notice that it's filled with that yellow gas. It's hard to see through all that mist but you think that you see Risha in there.. unconscious.. Her airlock didn't properly unlock and the air vents are still pushing gas into the room, lots of it. You get a bad feeling that she will die soon, if not from overdose then from lack of normal air.")

		saynn("The glass has some cracks in it, poor lynx probably tried to break it before falling asleep so you decide to pick up where she left off. You hit it with the handle of your gun but it just bounces off. You try to kick the glass but alas, no new cracks are formed. You keep trying though, you can't let Risha die in there. You wouldn't be able to forgive yourself.")

		saynn("Suddenly a voice.")

		saynn("[say=jaxontau]Put your hands up.. Tavi..[/say]")

		addButton("Turn around", "See who is that", "tavi_vs_jaxon")
	if(state == "tavi_vs_jaxon"):
		addCharacter("jaxontau")
		playAnimation(StageScene.Duo, "stand", {npc="jaxontau", npcAction="holdpistol"})
		saynn("You went too far to surrender now. You instantly turn around and aim the energy gun at.. Jaxon. He aims back at you with tears in his eyes. His hands are shaking.")

		saynn("[say=pc]Gonna shoot me, Jaxon? Why the hesitation.[/say]")

		saynn("[say=jaxontau]Tavi.. I saw what you did.. my brother.. murdered.. by you.[/say]")

		saynn("You put on your mean eyes, your finger tightening around the trigger. Blood is still dripping from your hands. Your leotard is not looking as pristine as it once did, so there are many holes and other damage on it.")

		saynn("[say=pc]I don't regret it. The fucker had it coming, trust me.[/say]")

		saynn("[say=jaxontau]Look what happened to you.. You can't change the way the world works, Tavi. But you can still surrender.. Enough pointless violence, enough deaths.[/say]")

		saynn("He lowers his gun. Now it's time for your paws to begin shaking.")

		saynn("[say=pc]I won't stop. Not until the director is dead. He wanted to kill me, Jaxon. I didn't turn out to be useful enough so he wanted to completely wipe me and any signs of my existence off. And either you join and help me. Or I will have to..[/say]")

		saynn("He wipes his tears off and looks down at this gun.")

		saynn("[say=jaxontau]No. I can't let you do that, Tavi. I'm sorry. Director is a powerful man. My family.. my brother..[/say]")

		saynn("Suddenly he begins aiming his gun at you. You must react first.")

		addButton("Aim at head", "Leave him no chance", "kill_jaxon")
		addButton("Aim at hands", "Aim for his gun", "spare_jaxon")
	if(state == "kill_jaxon"):
		setFlag("TaviModule.TaviKilledJaxon", true)
		playAnimation(StageScene.Solo, "firepistol")
		removeCharacter("jaxontau")
		saynn("You both aim energy guns at each other roughly at the same time.")

		saynn("The energy pistol sends out a powerful blast.")

		saynn("Followed by a complete silence.")

		saynn("Until the thump of a body hitting the floor deafens you.")

		saynn("A nasty hole right in the middle of Jaxon's forehead. Clean shot. No blood.")

		saynn("You lower the gun. You miss the guy already.")

		saynn("But. Enough sentimentality, you can mourn dead friends later. Right now you gotta focus on saving Risha. You realize that the guy's badge can probably be useful. Your hand reaches out to fetch it. Level 3 access. Oh-h.")

		saynn("You also find a gas mask plus oxygen tank combo on him. That will be more than useful.")

		addButton("Save Risha", "Use the card on her room", "save_risha")
	if(state == "spare_jaxon"):
		setFlag("TaviModule.TaviKilledJaxon", false)
		playAnimation(StageScene.Solo, "defeat")
		removeCharacter("jaxontau")
		saynn("You both aim energy guns at each other roughly at the same time.")

		saynn("The energy pistol sends out a powerful blast.")

		saynn("Followed by..")

		saynn("BOOM!")

		saynn("Your shot hits Jaxon's gun in its battery, causing the explosion that was powerful enough to send you flying back. Ow, your back didn't particularly enjoy that ride. Station's automatic fire extinguisher system kicks in, killing the fire before it can get big.")

		saynn("The room's glass received a few extra cracks. But wow, even that didn't break it. You slowly get up and run up to Jaxon.")

		saynn("His condition seems.. not ideal. Unconscious. But breathing. His armor took most of the hit. Good.")

		saynn("But you can worry about him later. Right now you gotta focus on saving Risha. You realize that the guy's badge can probably be useful. Your hand reaches out to fetch it. Level 3 access. Oh-h.")

		saynn("You also find a gas mask plus oxygen tank combo on him. That will be more than useful.")

		addButton("Save Risha", "Use the card on her room", "save_risha")
	if(state == "save_risha"):
		aimCameraAndSetLocName("tau_nearrisharoomdoor")
		addCharacter("rishatau")
		playAnimation(StageScene.SexStart, "start", {npc="rishatau"})
		saynn("The airlock, your paw presses the badge against its keypad panel until you hear the beep. The door starts slowly opening, letting the heavy yellow gas out in the process. Every second counts, you quickly put on the gas mask and rush inside before pulling Risha out. She is heavy as fuck but you just about manage.")

		saynn("She is.. breathing? Or is she? You press two digits against her throat and feel.. something. Her heartbeat is there but it seems irregular. You take off the gas mask and begin to do CPR, just like they taught you.")

		saynn("Very soon Risha starts coughing yellow gas and gasping for air. Phew. Her head rests on your lap as she slowly opens her eyes.")

		saynn("[say=rishatau]Ow.. Did I drink too much on our first date?[/say]")

		saynn("[say=pc]No, silly.[/say]")

		saynn("[say=rishatau]Sure feels like it. What's going on, Ta?[/say]")

		saynn("Risha looks around and sees the signs of battle and Jaxon's body. The voice over the station-wide intercom cuts off your attempts at any explanations.")

		saynn("[say=elena]The evacuation is in progress. Level-3 staff, please proceed to the escape pods. The guards are ordered to stay and deal with any threats.[/say]")

		saynn("[say=rishatau]I see, the fucker went mental.[/say]")

		saynn("[say=pc]Yeah, he wanted to kill me. I wanna explain to him why he is wrong.[/say]")

		saynn("Risha slowly gets up and raises an eyebrow at your bloody damaged leotard and the wounds underneath.")

		saynn("[say=rishatau]Wow. You need help?[/say]")

		saynn("You think about it for a second. Then you hand Risha the guy's badge.")

		saynn("[say=pc]No. That's my problem to deal with. You should get out of here. Take this, level 3 access. Get to the escape pods, I doubt there are many left.[/say]")

		saynn("[say=rishatau]You sure? Are you aware that you will probably die?[/say]")

		saynn("You tilt your head down.")

		saynn("[say=pc]Yeah. Don't worry about me, Risha. Get the fuck out of here while you still can.[/say]")

		addButton("Continue", "See what happens next", "risha_reacts_to_jaxon")
	if(state == "risha_reacts_to_jaxon"):
		aimCameraAndSetLocName("tau_nearrisharoom")
		playAnimation(StageScene.Duo, "stand", {npc="rishatau"})
		if (getFlag("TaviModule.TaviKilledJaxon")):
			saynn("You and Risha step into the big corridor. The lynx walks up to the lifeless body.")

			saynn("[say=rishatau]Brutal. Is that your work?[/say]")

			saynn("[say=pc]Yeah, he made his choice. I made mine.[/say]")

			saynn("Risha raises her eyebrows again.")

			saynn("[say=rishatau]You're stronger than I thought, Tavi.[/say]")

			saynn("[say=pc]Leave while you still can.[/say]")

			saynn("[say=rishatau]Yeah. I hope our paths will cross one day, Ta.[/say]")

			saynn("After that, Risha quickly jogs away, looking for the escape pods.")

			saynn("You're alone. Different circumstances, same feeling. It almost feels like the status quo hasn't changed that much. But you did. You look down at your paws covered in dry blood. Then you look at the dead body of your ex friend.")

			saynn("[say=pc]I hope not.[/say]")

		else:
			saynn("You and Risha step into the big corridor. The lynx walks up to the unconscious body.")

			saynn("[say=rishatau]I was always jealous of that armor. Is he dead?[/say]")

			saynn("[say=pc]He is alive. But I don't know for how much longer and what's gonna kill him first, his wounds or the station collapsing on him.[/say]")

			saynn("Risha humms. She then reaches to grab the guy's hands before pulling him up and onto her back into a fireman's carry. You can see Risha's muscles working hard.")

			saynn("[say=pc]You sure you can do it?[/say]")

			saynn("[say=rishatau]Oh, I've carried heavier bitches~. I hope our paths will cross one day, Ta. Gotta go now.[/say]")

			saynn("After that Risha leaves, looking for the escape pods.")

			saynn("You're alone. Different circumstances, same feeling. It almost feels like the status quo hasn't changed that much. But you did. You look down at your paws covered in dry blood.")

			saynn("[say=pc]I hope not.[/say]")

		addButton("Continue", "See what happens next", "tavi_looks_for_director")
	if(state == "tavi_looks_for_director"):
		playAnimation(StageScene.Solo, "holdpistol")
		removeCharacter("rishatau")
		aimCameraAndSetLocName("tau_nearelevators")
		saynn("You check the charge of your energy gun. Enough for one person. Or a one man army.")

		saynn("You began looking for your target, following the many corridors that you have never seen before. Signs of quick battles everywhere, modern weapons are brutally efficient are taking away your life. But you're still breathing.")

		saynn("Was it blind luck? Can you really dare to call yourself lucky after all of this?")

		saynn("Some time passes.")

		saynn("Going after the person who you owe your whole existence to. You wonder if having no future is better than having one that feels like a hellish nightmare. No, screw that. Enough of other people telling you what to do. You will carve out your own future or die trying.")

		saynn("The intercom coughs out some static followed by a familiar voice.")

		saynn("[say=directortau]Tavi. I'm talking to you. I know you're not dead yet. The last escape pod has left the station, you're stuck here. With me.[/say]")

		saynn("You stop and carefully observe the surroundings. At least one of you has escaped this hellhole. Now it was time for you to dig deeper and find the devil himself.")

		saynn("[say=directortau]I won't leave my station like all these rats did. And I know you wanna kill me. So let me make it easier for you.[/say]")

		saynn("You get startled by one of the elevators suddenly opening its doors, inviting you in. With the lack of better options, you decide to follow through on his promise and step inside. The elevator doors close before the machine proceeds to elevate you.")

		saynn("[say=directortau]Find me in my quarters. Just know that I will defend myself.[/say]")

		saynn("After all that, you're back to obeying others. The irony is not lost on you. But, for once, you seem.. content.. with your decisions.")

		addButton("Continue", "See what happens", "after_lift")
	if(state == "after_lift"):
		aimCameraAndSetLocName("tau_elevator")
		saynn("You were wondering if you'd see an entire squad of guns pointed at you when the doors would open. At least the director didn't seem like the type of guy who would lie to you. And you can't help but to respect that.")

		saynn("You can't let your feelings take over though. Your hand produces the single pill that you saved for this special occasion. Something inside you really wonders if these aren't just painkillers. But maybe that's just your damaged body hoping for some relief.")

		saynn("Your hand throws the pill into your mouth. It tastes.. good. Did they add sugar to it?")

		saynn("[say=pc]I guess it's time to find out.[/say]")

		saynn("The elevator doors open into another corridor. A much cleaner and fancier one. You must be on the right track.")

		addButton("Step out", "See where it brings you", "tavi_near_directorroom")
	if(state == "tavi_near_directorroom"):
		aimCameraAndSetLocName("tau_neardirector")
		saynn("You step out into the corridor. It's a dark one. But. Your legs feel the nice carpet underneath you. Paintings with fancy golden frames cover up the walls. Paintings of people who died a long time ago.")

		saynn("No guards or any other staff, not even a secretary. Every bad guy needs a cute secretary to help keep a balance. You're still on high alert though, stepping slowly towards some big doors. The guy sure likes gold, golden colors are everywhere. You stealthily approach the end of the corridor.")

		saynn("You feel ready.")

		addButton("Break in", "Time to pay the director a visit", "tavi_visits_director")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "tavi_gets_shot"):
		GM.pc.addPain(300)

	if(_action == "tavi_gets_cuffed"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))

	if(_action == "tavi_kills_dude"):
		GM.pc.removeAllRestraints()

	if(_action == "tavi_walks"):
		GM.pc.addPain(-100)

	if(_action == "tavi_visits_director"):
		endScene()
		runScene("Ch4s5DirectorScene")
		return

	setState(_action)
