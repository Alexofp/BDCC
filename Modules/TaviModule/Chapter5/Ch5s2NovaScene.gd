extends SceneBase

var usedCondom = false
var condomBroke = false

func _init():
	sceneID = "Ch5s2NovaScene"

func _run():
	if(state == ""):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="nova"})
		saynn("You take a good look at Nova's equipment. Since the bodysuit under her armor is so tight, everything is on display. You are most interested in her datapad carrier bag that is attached to her belt of course. It's near her stun baton holder. The more you think about it.. the less confident you feel about stealing it.")

		saynn("Nova catches your gaze which is directed.. roughly towards her skirt.")

		saynn("[say=nova]Need something, inmate~?[/say]")

		saynn("Husky gasps softly as she realizes something.")

		saynn("[say=nova]Wait, you were with Tavi the other day~. She made you her pet, didn't she~?[/say]")

		addButton("Yes", "Admit that you are Tavi's pet", "yes_pet")
		addButton("No", "You're not Tavi's pet", "no_pet")
	if(state == "yes_pet"):
		saynn("[say=pc]Sure. Why are you asking?[/say]")

		saynn("Nova smiles softly as she approaches you.")

		saynn("[say=nova]She was my pet, that's why~.[/say]")

		saynn("[say=pc]Wasn't that a punishment for what she did to you. You forced her.[/say]")

		saynn("The guard tilts her head slightly. She then assumes quite an authoritative pose, standing with her hind paws shoulder-width apart and one of her hands pressed into her hip.")

		saynn("[say=nova]It was. Didn't last that long sadly. But you should know something.[/say]")

		saynn("Nova leans forward, as if to whisper something to you.")

		saynn("[say=nova]She was willingly calling me Mommy by the end of it.. And blushing while doing so.. I didn't force her~[/say]")

		saynn("The husky suddenly sniffs you.")

		saynn("[say=nova]Oh yeah, that's Tavi's scent on you. Very cute~. Shame that the punishment ended.[/say]")

		saynn("Interesting. Tavi has a thing for mommies? Or Nova specifically? Strange to think that Tavi can be submissive.")

		saynn("[say=nova]What did you want, anyway~? Mommy's touch? I can offer that as long as you behave~.[/say]")

		saynn("Huh. You still need that datapad though. You can try to just beat Nova up and take it. Would be a good revenge for what she did with Tavi. But you would need to act fast and rough since this is a public place.")

		saynn("Or.. maybe you can trick her. Getting Nova somewhere secluded first might help you and give more time to.. play with her.")

		addButton("Attack her", "Time to be rough", "attack_nova")
		addButton("Trick her", "Lie to Nova to get her somewhere secluded", "lie_nova")
	if(state == "no_pet"):
		saynn("[say=pc]I'm not her pet, okay?[/say]")

		saynn("Nova smiles softly as she approaches you. She suddenly sniffs you, making you recoil away.")

		saynn("[say=nova]Then why do I smell her scent on you~? Lying to me already, huh~.[/say]")

		saynn("The guard tilts her head slightly. She then assumes quite an authoritative pose, standing with her hind paws shoulder-width apart and one of her hands pressed into her hip.")

		saynn("[say=pc]I'm not..[/say]")

		saynn("[say=nova]Tavi used to lie to me too~. But you know what? She can follow the rules when she really wants to~. The punishment that she received made her understand that trust is incredibly important~. Made her so much more sweet too.[/say]")

		saynn("Huh. Is that why Tavi gave you those rules? Strange to think that Tavi can be submissive. And what does she mean by sweet.")

		saynn("[say=nova]What did you want, anyway~? Mommy's touch? I can offer that as long as you behave~.[/say]")

		saynn("Huh. You still need that datapad though. You can try to just beat Nova up and take it. Would be a good revenge for what she did with Tavi. But you would need to act fast and rough since this is a public place.")

		saynn("Or.. maybe you can trick her. Getting Nova somewhere secluded first might help you and give more time to.. get what you need from her.")

		addButton("Attack her", "Time to be rough", "attack_nova")
		addButton("Trick her", "Lie to Nova to get her somewhere secluded", "lie_nova")
	if(state == "attack_nova"):
		playAnimation(StageScene.Duo, "shove", {npc="nova", npcAction="dodge"})
		saynn("Suddenly, you lash out at Nova and attempt to get a grasp on Nova's short hair. But the husky sees your intent the moment your brows twitch a little and dodges back.")

		saynn("[say=nova]Hair pulling~? Kinky. Learned that from Tavi?[/say]")

		saynn("[say=pc]Shut up.[/say]")

		saynn("[say=nova]Make me~.[/say]")

		saynn("Nova reaches for her stun baton and presses some buttons on her wrist computer that cause her suit to light up. The generator on her back kicks into action, creating current that makes the metal parts of her armor visible harden.")

		saynn("Time to fight..")

		addButton("Fight", "Start the fight", "fight_hard_nova")
	if(state == "lost_hard_nova"):
		playAnimation(StageScene.Duo, "defeat", {npc="nova"})
		saynn("Defeated, you fall to your knees before Nova.")

		saynn("[say=nova]Had enough~?[/say]")

		saynn("She can see you try to get up and fail. You can hear her giggle and then a sound of her suit being depowered.")

		saynn("[say=pc]Fuck you..[/say]")

		saynn("Nova squats before you.")

		saynn("[say=nova]I know all of the inmate tricks, sweetheart. Been there, done that.[/say]")

		saynn("The husky rubs her chin.")

		saynn("[say=nova]What to do with you.. Tell you what, say that you're sorry while addressing me as mommy and I might just let you go~.[/say]")

		saynn("That's.. that sounds humiliating.")

		saynn("[say=nova]I won't force you but.. you know. It would make me feel so much better~.[/say]")

		saynn("Who knows what she will do if you don't comply..")

		addButton("Sorry mom", "Do what Nova wants you to do", "sorry_mommy")
		addButton("No", "Anything is better than humiliating yourself like that", "no_sorry_mommy")
	if(state == "sorry_mommy"):
		saynn("You gather all of your courage.. All of your braveness.. You put on your mean eyes and..")

		saynn("[say=pc]Sorry.[/say]")

		saynn("Nova leans in closer.")

		saynn("[say=nova]I'm sorry, what was that~?[/say]")

		saynn("She is really gonna make you do this, huh..")

		saynn("[say=pc]I'm sorry..[/say]")

		saynn("Nova hums and leans even closer. Wait, you realize that her stun baton can almost be reached now..")

		saynn("[say=nova]Who are you addressing, cutie~?[/say]")

		saynn("[say=pc]I'm sorry.. mo-..m..[/say]")

		saynn("Nova chuckles and reaches out to scritch you under the chin.")

		saynn("[say=nova]Louder and with feeling, sweetie~.[/say]")

		saynn("Now is the time to act.. or not..")

		addButton("Stun baton!", "Grab it while she is busy teasing you. This will be rough for Nova..", "sorry_bonk_nova")
		addButton("Sorry Mommy", "Just let her humiliate you until the end..", "sorry_mother_end")
	if(state == "sorry_mother_end"):
		saynn("Nova's gaze is focussed on you, she is really waiting for you to say those words..")

		saynn("[say=pc]I'm sorry.. mommy..[/say]")

		saynn("So sweet. You can see Nova's playful expression switching to a more adoring one. She reaches her hand out and puts it under your chin.")

		saynn("[say=nova]What are you sorry about, sweetheart?..[/say]")

		saynn("She is really going there, huh.. Too late to stop now..")

		saynn("[say=pc]I'm sorry for fighting with you.. mommy..[/say]")

		saynn("Your cheeks blush as you say that.. Why is it working on you.. Nova is clearly not your mother.. But her treating you as her cutie.. it makes you feel something fuzzy inside..")

		saynn("[say=nova]Daw-w-w~.. See? Wasn't so hard. And you made mommy proud.[/say]")

		saynn("Mommy leans in to leave a little kiss on your forehead.")

		saynn("[say=nova]You're free to go, inmate.[/say]")

		saynn("Huh?.. That easy?.. Well, you're still missing the datapad.. But at least you're not in stocks or something.")

		saynn("Nova helps you get up and then swipes the dust and dirt off of you.")

		addButton("Continue", "Time to leave", "endthescene")
	if(state == "sorry_bonk_nova"):
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="defeat"})
		saynn("Nova's gaze is focussed on you, she is really waiting for you to say those words..")

		saynn("[say=pc]I'm.. sorry.. not.[/say]")

		saynn("Suddenly your hand grabs her stun baton and yanks it out of her holder before finding the trigger and smacking Nova's exposed parts with it! The sudden shock makes the husky cry out from pain, all her muscles lock up as she hits the ground.")

		saynn("[say=nova]Y-you.. b-bitch..[/say]")

		saynn("[say=pc]Wow. No you. What happened to the playful puppy?[/say]")

		saynn("Nova tries to block your next strike but the stun baton sends electricity through her body anyway, making the poor pup shake and whine.")

		saynn("[say=nova]Argh-h-.. h..[/say]")

		addButton("Make her bark", "That puppy needs to be trained more", "rough_makebark")
		addButton("Knock her out", "This will make stealing the datapad easier", "rough_knockout")
	if(state == "won_hard_nova"):
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="defeat"})
		saynn("That was easy enough, Nova yelps as she collapses to her knees before you.")

		saynn("[say=nova]ARgh..[/say]")

		saynn("You notice that she has dropped her stun baton so you quickly fetch that. The pain stick might be useful in this situation.")

		saynn("[say=nova]That's mine..[/say]")

		saynn("[say=pc]Take it back then?[/say]")

		saynn("The husky grumbles and just tries to calm down her breath. It is possible to take her datapad right now but.. you should ensure that Nova won't come after you. And it's better to do that fast since you're in a public place.")

		addButton("Make her bark", "That puppy needs to be trained more", "rough_makebark")
		addButton("Knock her out", "This will make stealing the datapad easier", "rough_knockout")
	if(state == "rough_makebark"):
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="allfours"})
		saynn("A mischievous smile appears on your face, seeing defeated Nova on her knees before you. Since she is a husky, why not make her act like one. The guard whines softly seeing your strong posture.")

		saynn("[say=nova]What are you-..[/say]")

		saynn("[say=pc]I want you to bark for me, pup.[/say]")

		saynn("[say=nova]Wha..[/say]")

		saynn("Wouldn't it also be great to record that? You try to reach for Nova's datapad but she holds onto it tightly. A little shock with her own stun baton quickly changes her mind though. A painful whine escapes from the husky while you steal her fancy tablet and turn it on.")

		saynn("[say=nova]H-h.. what are you even..[/say]")

		saynn("Her datapad is locked.. obviously. But you just put pressure on its back panel until you feel your finger pressing some button. Success. It doesn't have all the functions but the camera app is there.")

		saynn("[say=pc]This is mine now.[/say]")

		saynn("[say=nova]It's g-gonna be useless for you.. silly..[/say]")

		saynn("The husky is becoming a little too brave so you poke her neck with the energized part of the stun baton, making her cry out from pain.")

		saynn("[say=pc]Nuh uh. Get on all fours and bark, pup.[/say]")

		saynn("Nova was about to complain about you adding extra steps to the punishment but seeing you raise her stun baton again makes her comply. She slowly gets on all fours before you and lowers her head. Her playful smirk got replaced with a submissive expression.")

		saynn("[say=nova]W..wuf?..[/say]")

		saynn("You start recording a video before sneakily pointing the datapad's camera at the poor husky.")

		saynn("[say=pc]C'mon, that was pathetic. Try again, louder.[/say]")

		saynn("[say=nova]Screw you.. Wuf..[/say]")

		saynn("More little barks escape from her. At first they sounded like hesitant sad whimpers but your encouragement helps to make her bark louder. Her cheeks begin to blush red as she knowingly degrades herself down to a level of an actual pup. Her slightly-wagging tail can't lie though.")

		saynn("[say=pc]Crawl around me, pup.[/say]")

		saynn("Nova grumbles.. but then obeys, proceeding to circle around you, swaying her hips a lot while you make sure to record every moment of her cute performance.")

		saynn("[say=nova]Wuff.. wruff.. wuff-f.. you're so screwed.. wuff..[/say]")

		saynn("[say=pc]What was that, puppy?[/say]")

		saynn("[say=nova]Wuff..[/say]")

		saynn("When she stops before you, your hand lands on her short hair and ruffles it, offering the husky lots of pets and scritches. They make her grumble louder.. while her tail wags faster.")

		saynn("[say=pc]Who's a good puppy?[/say]")

		saynn("Nova just barks softly for you.")

		saynn("[say=pc]Yeah, you are. And now the whole station will know that too.[/say]")

		saynn("[say=nova]Wu.. wh..  wha?..[/say]")

		saynn("As you press a button that stops the recording and then put the datapad away.. the husky's raised eyebrows start twitching.")

		saynn("[say=nova]Did you.. No! Give it to me![/say]")

		saynn("The pup tries to tackle her but it's easy to shove her away while she is in her weakened state.")

		addButton("Pin her", "Show Nova her place", "rough_makebark_pin")
	if(state == "rough_makebark_pin"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="nova"})
		saynn("[say=nova]Give it back!.. Now!..[/say]")

		saynn("She desperately tries to steal her datapad back so you have no choice but to smack her with the stun baton again and then pin her into the ground. Loud whining can be heard from her.")

		saynn("You lean closer and show the husky her datapad.")

		saynn("[say=pc]If you don't want this leaking out to every single staff member on this station.. You forget that this even happened. Otherwise.. even the inmates are gonna laugh every time you walk past. Understand?[/say]")

		saynn("The husky whines and tries to squirm but your foot is pressed firmly into her chest.")

		saynn("[say=nova]N-no..[/say]")

		saynn("You bring your palm closer to the datapad's screen.")

		saynn("[say=pc]So I should just send it now then? Should it be a general announcement or an emergency one.. hmm..[/say]")

		saynn("[say=nova]No!.. No need for t-that.. F-fuck you..[/say]")

		saynn("It seems she made her choice. Doesn't really matter since you only need the parts from this datapad.. But it's a nice feeling.. revenge.. Your voice is still strict.")

		saynn("[say=pc]You pretend you just lost it and get another. Otherwise I won't hesitate.[/say]")

		saynn("[say=nova]F-fine..[/say]")

		saynn("[say=pc]Good puppy.[/say]")

		saynn("You pat the husky and prepare to leave. You throw her the painstick back, the thing has lost its charge anyway.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rough_knockout"):
		playAnimation(StageScene.SexStart, "defeated", {npc="nova"})
		saynn("The best way to make sure she doesn't stop you.. is to make sure she isn't conscious.")

		saynn("Nova's eyes widen as she notices the evil glint in your eyes.")

		saynn("[say=nova]H-hey! Wait! We c-can talk about it![/say]")

		saynn("It was too late though, you set the stun baton to its most painful setting and then just put it firmly against Nova's neck. You don't even have to strike her, the electricity alone is enough to make the husky arch her back and let out one of the most gut-wrenching screams. All her fur stands on ends, her limbs, her tail, ears, all shaking as her muscles get forced to tense up..")

		saynn("After only a few seconds of such torture, the husky stops resisting and becomes all quiet. Oops.. the painstick got fully discharged too. Just in time for Nova to black out.")

		saynn("You fetch her datapad without any problems. It will be disabled remotely when Nova wakes up.. but you only need the parts.")

		saynn("Nova is breathing even if she is not responding. This was a great way to get your revenge after what she did to Tavi. What should you do now though?")

		addButton("Leave", "That was enough for Nova", "rough_leave")
		addButtonWithChecks("Fuck her", "She can't say no anymore. Might as well use her", "rough_sleepfuck", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Ride her", "She can't say no anymore. Might as well use her", "rough_ride_choose", [], [ButtonChecks.HasReachableVaginaOrAnus])
	if(state == "rough_leave"):
		playAnimation(StageScene.Solo, "stand")
		saynn("Looking at the exhausted sleeping husky.. she suffered enough. Somebody probably heard the scream too so it's better to just leave while you still can.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rough_sleepfuck"):
		playAnimation(StageScene.SexStart, "defeated", {npc="nova", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You don't have much time since the bitch has decided to scream before blacking out. So you begin to quickly strip the armor pieces off her disabled suit before unzipping her bodysuit enough to expose her sheath, the pussy slit that's hiding under her balls and her asshole. And that middle one seems to be the most inviting.")

		saynn("Do you wanna use a condom though?..")

		addButton("No condom", "Go in raw", "rough_sleepfuck_start")
		addButtonWithChecks("Use condom", "Use your best condom", "rough_sleepfuck_usecondom", [], [ButtonChecks.HasCondoms])
	if(state == "rough_sleepfuck_start"):
		playAnimation(StageScene.SexAllFours, "fastflop", {pc="pc", npc="nova", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		if (usedCondom):
			saynn("Even though you're about to fuck her, the pups is the last thing you want. You quickly rip open one of the condom packages before putting it on your {pc.penis}. After that you quickly turn Nova to be lying on her belly and position yourself behind her, your movements deliberate and predatory, your hands holding her round ass high.")

		else:
			saynn("Screw condoms, who cares if that bitch will have a litter. You quickly turn Nova to be lying on her belly before positioning yourself behind her, your movements deliberate and predatory, your hands holding her round ass high.")

		saynn("No time for intimacy, the husky wouldn't be able to appreciate it anyway. With one forceful thrust, you break inside her, stretching her dry cunt wide just to ram your member deeper. And then again and again, already establishing a steady rhythm, pounding that pussy. Her inner walls are still tensed up after that powerful shock.. which feels great.. even if you're leaving bruises and tears on her soft sensitive flesh.. The bitch deserves it.")

		saynn("The more you fuck her, the more you begin to hear little cute noises come out of the mouth of that unconscious husky, her body squirming a little while her dick starts to inflate with blood and leave its animal sheath. Huh, her slutty body loves being dicked.")

		saynn("She keeps trying to fall though so you get a hold of her curly tail and use it to pull her body towards you as you thrust your hips forward, forcing your cock deeper into her unwilling bathered sex.")

		saynn("Ohh, suddenly Nova's cock inflates near the base, her knot becoming obvious. And, a few seconds later, she cums, her shaft throbbing while wasting its load, her slutty cunt clenching around you so tightly that you can't hold back anymore..")

		addButton("Cum", "See what happens next", "rough_sleepfuck_cum")
	if(state == "rough_sleepfuck_cum"):
		playAnimation(StageScene.SexAllFours, "insideflop", {pc="pc", npc="nova", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		if (!usedCondom):
			saynn("You can't help but to grunt as her pussy brings you over the edge, your own cock throbbing as well as it starts stuffing that slut's babymaker full of your seed. You're not holding back, letting her slit milk your balls dry.")

			saynn("After that you just quickly pull out and let Nova collapse back onto the ground, her abused husky pussy leaking your {pc.cum}. Perfect.")

		else:
			if (condomBroke):
				saynn("You can't help but to grunt as her pussy brings you over the edge, your own cock throbbing as well as it starts stuffing that condom inside the slut's cunt full of your seed. You're not holding back, letting her slit milk your balls dry. You feel kinda strange though.. because.. [b]the condom breaks and spills its contents inside Nova's womb![/b]")

				saynn("You realize that when you pull out and see a huge gaping hole at the end of the condom. Oops. Oh well. Who cares. It will be a good surprise for her.")

				saynn("You let Nova collapse back onto the ground, her abused husky pussy leaking your {pc.cum}.")

			else:
				saynn("You can't help but to grunt as her pussy brings you over the edge, your own cock throbbing as well as it starts stuffing that condom inside the slut's cunt full of your seed. You're not holding back, letting her slit milk your balls dry. Luckily, the condom doesn't break.")

				saynn("After that you just quickly pull out and let Nova collapse back onto the ground, the rubber ring of the condom sticking out of her abused husky pussy. You decide to dispose of it though. Just to be safe.")

		saynn("Now it's time to run before anyone spots you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rough_ride_choose"):
		playAnimation(StageScene.SexStart, "defeated", {npc="nova", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You don't have much time since the bitch has decided to scream before blacking out. So you begin to quickly strip the armor pieces off her disabled suit before unzipping her bodysuit enough to expose her sheath.")

		saynn("Interestingly, her red rocket has begun inflating with blood and getting bigger after you remove every obstacle that was holding it from doing so. The pointy tip is already leaking precum. Makes you wonder how it will feel inside..")

		saynn("Do you wanna use a condom though?..")

		addButtonWithChecks("Vaginal", "Ride Nova with your pussy", "rough_ride_vaginal_start", [], [ButtonChecks.HasReachableVagina])
		addButton("Anal", "Ride Nova with your ass", "rough_ride_anal_start")
		addButtonWithChecks("Vaginal+Condom", "Use your best condom", "rough_ride_vaginal_usecondom", [], [ButtonChecks.HasCondoms, ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Anal+Condom", "Use your best condom", "rough_ride_vaginal_usecondom", [], [ButtonChecks.HasCondoms])
	if(state == "rough_ride_vaginal_start"):
		playAnimation(StageScene.SexReverseCowgirl, "fast", {npc="pc", pc="nova", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		if (usedCondom):
			saynn("Time is extremely limited, you produce one of the condoms and rip open the package before putting it on Nova's hard cock, trapping the few drops of precum under it.")

		else:
			saynn("Time is extremely limited, meaning there is no time for silly things like thinking about condoms..")

		saynn("Positioning yourself just right, you quickly lower your body onto that throbbing member, your slick sex enveloping the tip and then lets it bury more inside you. The sensation of her cock entering you deeper and deeper sends a shiver of pleasure through you, causing you to produce a little moan.")

		saynn("A few seconds after stradling unconscious Nova, you are already riding her fast and hard, the desire to cum from her dick without getting spotted fueling your kinky desires. Might as well let that dick cum too of course, Nova deserves some fun for being a good fucktoy.")

		saynn("[say=pc]Get fucked, soft pup.. ah..[/say]")

		saynn("Nova is just squirming under you ever so slightly, her maw producing cute noises while you bounce on her veiny shaft, the knot near the base is already somewhat inflated, unable to squeeze inside you.. Is there time to force it in though..")

		saynn("Fuck it, you will think about it later. For now you just continue bringing yourself hard onto that dick, letting the big orb slap against your wet needy folds, stretching the entrance bit by bit. The more you do it, the more you begin to feel her length pulsing and throbbing inside you.. it's now or never..")

		saynn("[say=pc]C'mon.. cum already..[/say]")

		saynn("Oh shit, footsteps.")

		addButton("Panic", "Can't stop now", "rough_ride_vaginal_cum")
	if(state == "rough_ride_vaginal_cum"):
		playAnimation(StageScene.SexReverseCowgirl, "inside", {npc="pc", pc="nova", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		saynn("You notice two guards walking a few meters away, the greenery keeping you and Nova hidden luckily. But then they stop and begin chatting..")

		saynn("And now.. with only a tall green bush separating you.. oh fuck..")

		saynn("You've been so occupied with trying to hide that you accidentally lowered yourself too deep, causing Nova's red orb to suddenly slip inside..")

		saynn("You inner walls clench around that cock hard.. drawing it even deeper into your warm inviting depths. A loud passionate noise tries to escape your mouth so you cover your lips and pray that it doesn't.. Your body proceeds to silently squirm.. as waves of orgasmic pleasure wash over it..")

		if (usedCondom && condomBroke):
			saynn("Oh shit! Something is wrong! Nova's cock is throbbing and you very much feel something warm and sticky flooding your womb full to the brim! There is no denying it, [b]the condom broke, spilling all its contents inside you.[/b] Fuck.. You try your best to stay silent but little squeaks of desperation manage to slip out.. Luckily the guards are too busy chatting with each other..")

		elif (usedCondom):
			saynn("At least the condom seems to be holding up.. Nova's cock is throbbing inside you, stuffing it full of sticky seed, none of which is spilling. You can hear little gasps coming from her so you arch your back more and cover her mouth too. For some reason Nova is sucking on your fingers though.. what a slut..")

		else:
			saynn("And you're not the only one who reached their peak.. Nova's cock is throbbing inside you as the tip starts shooting seed directly inside your womb, stuffing it full of her sticky seed! You can hear little gasps coming from her as she is cumming so you arch your back more and cover her mouth too. For some reason Nova is sucking on your fingers though.. what a slut..")

		if (GM.pc.isWearingChastityCage()):
			saynn("All this was enough for your caged up cock to suddenly start shooting weak spurts of {pc.cum} out, leaving a little mess on the stone tiles..")

		elif (GM.pc.hasReachablePenis()):
			saynn("All this was enough for your {pc.penis} to suddenly start shooting strong spurts of {pc.cum} out, leaving a little mess on the stone tiles..")

		saynn("Your body shivers so much.. But you're not allowed to make a single noise or they will hear.. So you're forced to stay Nova's cock warmer..")

		saynn("The guards enjoy their casual chat in the meantime. They talk about life outside of prison while you are forced to endure that giant knot stretching your inner walls extremely wide.. Making even your breath kinda loud..")

		saynn("You spend about 5 minutes on Nova's cock before the guards finally decide to move on..")

		if (usedCondom && condomBroke):
			saynn("With one rough hip motion, you escape that knotted member.. causing your gaping pussy to start leaking her cum.. Yeah, as you pull the used condom out, you notice a giant hole in its tip. What a lucky slut this husky is.")

		elif (usedCondom):
			saynn("With one rough hip motion, you escape that knotted member.. causing your gaping pussy to pulsate visibly. Then you just carefully tie the condom up and dispose of it. This whole experience makes you want to spank that slut.. but she might like it too much.")

		else:
			saynn("With one rough hip motion, you escape that knotted member.. causing your gaping pussy to pulsate and leak her cum. Your legs are still shaky.. This whole experience makes you want to spank that slut.. but she might like it too much.")

		saynn("Either way, it's time to run before she wakes up or someone else spots you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rough_ride_anal_start"):
		playAnimation(StageScene.SexReverseCowgirl, "fast", {npc="pc", pc="nova", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		if (usedCondom):
			saynn("Time is extremely limited, you produce one of the condoms and rip open the package before putting it on Nova's hard cock, trapping the few drops of precum under it. The thing seems to be pre-lubed.. good..")

		else:
			saynn("Time is extremely limited, meaning there is no time for silly things like thinking about condoms.. Lube is important though.. you quickly stroke Nova's cock a few times and then rub her precum into your {pc.analStretch} anal star.. good enough..")

		saynn("Positioning yourself just right, you quickly lower your body onto that throbbing member, your needy tailhole enveloping the tip and then lets it bury more inside you. The sensation of her cock entering you deeper and deeper sends a shiver of pleasure through you, causing you to produce a little moan.")

		saynn("A few seconds after stradling unconscious Nova, you are already riding her fast and hard, the desire to cum from her dick without getting spotted fueling your kinky desires. Might as well let that dick cum too of course, Nova deserves some fun for being a good fucktoy.")

		saynn("[say=pc]Get fucked, soft pup.. ah..[/say]")

		saynn("Nova is just squirming under you ever so slightly, her maw producing cute noises while you bounce on her veiny shaft, the knot near the base is already somewhat inflated, unable to squeeze inside you.. Is there time to force it in though..")

		saynn("Fuck it, you will think about it later. For now you just continue bringing yourself hard onto that dick, letting the big orb slap against your {pc.analStretch} anus, stretching the entrance bit by bit. The more you do it, the more you begin to feel her length pulsing and throbbing inside you.. it's now or never..")

		saynn("[say=pc]C'mon.. cum already..[/say]")

		saynn("Oh shit, footsteps.")

		addButton("Panic", "Can't stop now", "rough_ride_anal_cum")
	if(state == "rough_ride_anal_cum"):
		playAnimation(StageScene.SexReverseCowgirl, "inside", {npc="pc", pc="nova", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		saynn("You notice two guards walking a few meters away, the greenery keeping you and Nova hidden luckily. But then they stop and begin chatting..")

		saynn("And now.. with only a tall green bush separating you.. oh fuck..")

		saynn("You've been so occupied with trying to hide that you accidentally lowered yourself too deep, causing Nova's red orb to suddenly slip inside..")

		saynn("You inner walls clench around that cock hard.. drawing it even deeper into your warm inviting depths. A loud passionate noise tries to escape your mouth so you cover your lips and pray that it doesn't.. Your body proceeds to silently squirm.. as waves of orgasmic pleasure wash over it..")

		if (usedCondom && condomBroke):
			saynn("Oh shit! Something is wrong! Nova's cock is throbbing and you very much feel something warm and sticky flooding your nethers full to the brim! There is no denying it, [b]the condom broke, spilling all its contents inside you.[/b] Fuck.. You try your best to stay silent but little squeaks of desperation manage to slip out.. Luckily the guards are too busy chatting with each other..")

		elif (usedCondom):
			saynn("At least the condom seems to be holding up.. Nova's cock is throbbing inside you, stuffing it full of sticky seed, none of which is spilling. You can hear little gasps coming from her so you arch your back more and cover her mouth too. For some reason Nova is sucking on your fingers though.. what a slut..")

		else:
			saynn("And you're not the only one who reached their peak.. Nova's cock is throbbing inside you as the tip starts shooting seed deep inside your nethers, stuffing you full of her sticky seed! You can hear little gasps coming from her as she is cumming so you arch your back more and cover her mouth too. For some reason Nova is sucking on your fingers though.. what a slut..")

		if (GM.pc.isWearingChastityCage()):
			saynn("All this was enough for your caged up cock to suddenly start shooting weak spurts of {pc.cum} out, leaving a little mess on the stone tiles..")

		elif (GM.pc.hasReachablePenis()):
			saynn("All this was enough for your {pc.penis} to suddenly start shooting strong spurts of {pc.cum} out, leaving a little mess on the stone tiles..")

		saynn("Your body shivers so much.. But you're not allowed to make a single noise or they will hear.. So you're forced to stay Nova's cock warmer..")

		saynn("The guards enjoy their casual chat in the meantime. They talk about life outside of prison while you are forced to endure that giant knot stretching your inner walls extremely wide.. Making even your breath kinda loud..")

		saynn("You spend about 5 minutes on Nova's cock before the guards finally decide to move on..")

		if (usedCondom && condomBroke):
			saynn("With one rough hip motion, you escape that knotted member.. causing your gaping ass to start leaking her cum.. Yeah, as you pull the used condom out, you notice a giant hole in its tip. What a lucky slut this husky is.")

		elif (usedCondom):
			saynn("With one rough hip motion, you escape that knotted member.. causing your gaping asshole to pulsate visibly. Then you just carefully tie the condom up and dispose of it. This whole experience makes you want to spank that slut.. but she might like it too much.")

		else:
			saynn("With one rough hip motion, you escape that knotted member.. causing your gaping ass to pulsate and leak her cum. Your legs are still shaky.. This whole experience makes you want to spank that slut.. but she might like it too much.")

		saynn("Either way, it's time to run before she wakes up or someone else spots you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lie_nova"):
		saynn("Nova is here to patrol the station and to look out for any conflicts between inmates and staff. Hm..")

		saynn("[say=pc]Oh yeah, I almost forgot why I'm here..[/say]")

		saynn("Husky giggles softly. Your mind tries to come up with something..")

		saynn("[say=pc]Um..[/say]")

		saynn("[say=nova]Use your words, sweetie~.[/say]")

		saynn("The bathroom has some secluded spots that are also blindspots for the cameras. Should be good enough..")

		saynn("[say=pc]There is a fight happening in the showers.. Right now.[/say]")

		saynn("Nova's expression switches to a more serious one, her hands reach out for her datapad.")

		saynn("[say=nova]Oh yeah? Who?[/say]")

		saynn("[say=pc]I don't know, I only heard screams. I ran here when I saw the blood. Someone might be getting killed, I don't know..[/say]")

		saynn("The guard grabs her stun baton instead.")

		saynn("[say=nova]Fuck. Well, show me then. You lead the way, inmate.[/say]")

		saynn("Huh. You're not sure if it worked yet.. You might have to come up with a new plan real soon.")

		addButton("Lead the way", "Walk to the nearest bathroom", "walk_past_gym")
	if(state == "walk_past_gym"):
		aimCameraAndSetLocName("gym_nearbathroom")
		saynn("You begin walking at a moderately swift pace towards one of the bathrooms. The closest one is connected to the gym area so you bring Nova there.")

		saynn("Hm, the area is as busy as ever. Lots of inmates of all sorts of shapes and types are lifting weights, doing yoga or just random exercises.")

		saynn("Maybe if you can somehow get their attention, they will come.. help.. you with Nova?")

		saynn("But for now you have to just play along while the husky is walking behind you. Makes you wonder if she is already suspecting something..")

		addButton("Continue", "See what happens next", "in_bathrooms")
	if(state == "in_bathrooms"):
		aimCameraAndSetLocName("main_bathroom2")
		GM.pc.setLocation("main_dressing2")
		saynn("You enter the prison's bathroom. It's a long room with a whole row of toilet stalls and sinks. No inmates seem to be here. No obvious signs of a fight either.")

		saynn("[say=nova]You know, I don't hear any screams.[/say]")

		saynn("She still holds the stun baton tightly. But right now her gaze is mostly directed towards your back.")

		saynn("[say=pc]Maybe the fighting is over. I saw blood stains on the walls in the dressing room.[/say]")

		saynn("Nova points towards the other room with her weapon.")

		saynn("[say=nova]After you then.[/say]")

		saynn("Right. You're getting closer and closer to the point of no return. You take your time, slowly stepping further towards the dressing area that is separated from your current room with a small wide corridor made out of concrete pillars. This might be the place if not the time to do it..")

		saynn("You know well enough that there is nothing there.. But Nova is still only slightly suspicious.. How do you wanna react to her finding out the truth?")

		addButton("Attack", "Try to overpower Nova in this secluded spot", "bath_agressive")
		addButton("Seduce", "Play dumb and submit to Nova", "bath_seduce")
	if(state == "bath_agressive"):
		aimCameraAndSetLocName("main_dressing2")
		playAnimation(StageScene.Duo, "shove", {npc="nova", npcAction="hurt"})
		saynn("Can't stop now, you went too far. Might as well try to overpower the husky here..")

		saynn("You step into the dressing room. It's a somewhat big room that has a bunch of lockers for inmates to store their belongings before they enter the showers.")

		saynn("There is no blood anywhere.. but you pretend that you see some and point at the corner of the room that is not yet visible for Nova because of the pillar.")

		saynn("[say=pc]Oh fuck..[/say]")

		saynn("You make your best to seem like you're looking at a brutal scene. And.. It seemed to work. Nova has pulled her gaze away from you, instead slowly stepping through the corridor and peeking over..")

		saynn("[say=nova]But there is nothing.. HEY! You little![/say]")

		saynn("You use that moment to try and grab Nova's hair. She avoids that but you still manage to shove her into the concrete pillar. The husky yelps as she gets slammed into a hard surface. The armor took some of the impact but not enough to knock her down completely.")

		saynn("[say=nova]ARGH! You little lying shit.[/say]")

		saynn("That got the husky angry, huh. She is holding her weapon tightly, so you can't get close to her anymore.")

		saynn("You got one good hit in at least. But now it's time for a fair fight.")

		addButton("Fight", "Start the fight", "fight_bathroom")
	if(state == "won_bathroom_nova"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="nova"})
		saynn("As soon as Nova starts to show weakness, you shove her against the wall again, causing her to finally collapse onto the floor. As soon as she does that, you pin her to the floor.")

		saynn("[say=nova]B-bitch..[/say]")

		saynn("Putting a little more pressure on that armored belly, making the girl whine.")

		saynn("[say=nova]Y-you know why it's you standing there and not Tavi? S-she would never be able to lie to me. She is a good girl when mommy is near..[/say]")

		saynn("She is reaching for the stun baton that is lying on the floor but you kick that thing away before pinning her again.")

		saynn("[say=pc]Shut up.[/say]")

		saynn("[say=nova]M-make me..[/say]")

		addButton("Undress her", "She doesn't need all that armor", "bath_undress_nova")
	if(state == "bath_undress_nova"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="nova", npcBodyState={naked=true}})
		saynn("You try to tear off her shoulder pads but they seem to be held in place by some powerful electromagnets and don't shift even one bit.")

		saynn("[say=nova]T-this armor has more tech in it than this whole station..[/say]")

		saynn("Whatever. You quickly grab Nova's stun baton and then forcibly turn her around to get access to her back. There is a fancy generator sticking out, some bits of it are exposed to allow for cooling.")

		saynn("[say=nova]H-hey!..[/say]")

		saynn("You stick Nova's painstick into it and send a powerful shock that disables it, causing most metal bits of her armor to just fall off. The husky whines louder as some of that electricity goes through her exhausted body as well.")

		saynn("[say=pc]Nice tech.[/say]")

		saynn("You continue where you left off, yanking off the rest of her fancy armored plates and then unzipping the tight undersuit, exposing Nova's private bits. She is clearly a herm, possessing both a sheath with a tip of a dick sticking out of it and a pussy that is hiding behind her ballsack.")

		saynn("You also grab her datapad and unlock it just like Tavi showed you. Great. Technically you have what you need. But leaving now would be kinda rude for the husky.")

		saynn("[say=nova]H-hey, don't take that, it's mine..[/say]")

		saynn("[say=pc]You lost puppy, relax.[/say]")

		saynn("That datapad has a camera.. Maybe you can have some fun with that?")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "attack_nova"):
		processTime(5*60)

	if(_action == "lie_nova"):
		processTime(10*60)

	if(_action == "fight_hard_nova"):
		runScene("FightScene", ["novaArena"], "nova_hard_fight")
		return

	if(_action == "sorry_bonk_nova"):
		processTime(3*60)

	if(_action == "sorry_mother_end"):
		processTime(3*60)

	if(_action == "rough_makebark"):
		processTime(3*60)

	if(_action == "rough_knockout"):
		processTime(3*60)
		addExperienceToPlayer(50)
		addMessage("Task updated!")
		setFlag("TaviModule.Ch5StoleDatapadFromNova", true)

	if(_action == "rough_makebark_pin"):
		processTime(3*60)
		addExperienceToPlayer(50)
		addMessage("Task updated!")
		setFlag("TaviModule.Ch5StoleDatapadFromNova", true)
		setFlag("TaviModule.Ch5BlackmailedNova", true)

	if(_action == "rough_sleepfuck"):
		processTime(6*60)

	if(_action == "rough_ride_choose"):
		processTime(6*60)

	if(_action == "rough_sleepfuck_usecondom"):
		var chanceToBreak = GM.pc.useBestCondom()
		usedCondom = true
		if(GM.pc.shouldCondomBreakWhenFucking("nova", chanceToBreak)):
			condomBroke = true
		setState("rough_sleepfuck_start")
		return

	if(_action == "rough_sleepfuck_cum"):
		processTime(3*60)
		if(!usedCondom || condomBroke):
			getCharacter("nova").cummedInVaginaBy("pc")
		if(usedCondom && !condomBroke):
			addFilledCondomToLootIfPerk(GM.pc.createFilledCondom())
		GM.pc.orgasmFrom("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "rough_ride_vaginal_usecondom"):
		var chanceToBreak = GM.pc.useBestCondom()
		usedCondom = true
		if(getCharacter("nova").shouldCondomBreakWhenFucking("pc", chanceToBreak)):
			condomBroke = true
		setState("rough_ride_anal_start")
		return

	if(_action == "rough_ride_vaginal_cum"):
		processTime(10*60)
		GM.pc.gotVaginaFuckedBy("nova")
		if(!usedCondom || condomBroke):
			GM.pc.cummedInVaginaBy("nova")
		if(usedCondom && !condomBroke):
			addFilledCondomToLootIfPerk(getCharacter("nova").createFilledCondom())
		GM.pc.orgasmFrom("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "rough_ride_anal_cum"):
		processTime(10*60)
		GM.pc.gotAnusFuckedBy("nova")
		if(!usedCondom || condomBroke):
			GM.pc.cummedInAnusBy("nova")
		if(usedCondom && !condomBroke):
			addFilledCondomToLootIfPerk(getCharacter("nova").createFilledCondom())
		GM.pc.orgasmFrom("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "fight_bathroom"):
		runScene("FightScene", ["novaArena"], "nova_bathroom_fight")
		getCharacter("novaArena").addPain(45)
		return

	if(_action == "bath_undress_nova"):
		processTime(3*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "nova_hard_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_hard_nova")
		else:
			setState("lost_hard_nova")
			addExperienceToPlayer(5)

	if(_tag == "nova_bathroom_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_bathroom_nova")
		else:
			setState("lost_bathroom_nova")

func saveData():
	var data = .saveData()

	data["usedCondom"] = usedCondom
	data["condomBroke"] = condomBroke

	return data

func loadData(data):
	.loadData(data)

	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
