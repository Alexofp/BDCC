extends SceneBase

var usedCondom = false
var condomBroke = false
var didFeet = false
var didGang = false
var didFuck = false
var didPiss = false
var npcID = ""
var corruption = 0.0
var lostBathroom = false

func _init():
	sceneID = "Ch5s2NovaScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

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
		addButton("Seduce", "Play a little dumb and submit to Nova. She will probably fuck you..", "bath_seduce")
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
		addCharacter("nova", ["naked"])
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

		addButton("Continue", "See what happens next", "nova_bully_menu")
	if(state == "nova_bully_menu"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="nova", npcBodyState={naked=true}})
		saynn("You have Nova pinned under your feet. You can leave now or have some fun with her first. You also have her datapad sneakily recording this session.")

		if (didFeet):
			saynn("Nova's cheeks are bright red after she got humiliated so hard.")

		if (didGang):
			saynn("Nova's used pussy is leaking so much cum after she got gangbanged..")

		if (didPiss):
			saynn("Nova's fur is coated with your piss, she smells gross!")

		if (didFeet):
			addDisabledButton("Feetplay", "You already did that")
		else:
			addButton("Feetplay", "Humiliate the husky using your feet", "do_feet")
		if (didGang):
			addDisabledButton("Call inmates", "Nova already got gangbanged")
		else:
			addButton("Call inmates", "There is a gym full of horny inmates just outside..", "do_bang")
		if (didFuck):
			addDisabledButton("Fuck Nova", "You already did that")
			addDisabledButton("Strapon Nova", "You already did that")
		else:
			addButtonWithChecks("Fuck Nova", "Now is a good time to use her pussy for your pleasure", "do_fuck", [], [ButtonChecks.HasReachablePenis])
			addButtonWithChecks("Strapon Nova", "Pick one of your strapons and fuck Nova's pussy with it", "do_pickstrapon", [], [ButtonChecks.HasStraponAndCanWear])
		if (didPiss):
			addDisabledButton("Piss on", "You already did that with this particular piss-slut")
		else:
			addButtonWithChecks("Piss on", "Really humiliate that bitch", "do_piss", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])
		addButton("Done", "You did everything you wanted to Nova", "do_done")
	if(state == "do_feet"):
		playAnimation(StageScene.SexFeetPlay, "crotch", {pc="pc", npc="nova", npcBodyState={naked=true, hard=true}})
		saynn("Since you got the husky under your feet.. why not use this opportunity to humiliate her a little.")

		saynn("[say=pc]Let's do something. If you try to get up - this will happen. Mhm?[/say]")

		saynn("You put more pressure on Nova's chest, forcing a gasp out of her.")

		saynn("[say=nova]H-hey.. F-fine..[/say]")

		saynn("Since she is being somewhat cooperative, you lift your foot and, with calculated precision, make it hover just above her muzzle. The husky's eyes go wide as she sees it so close, almost booping her snout.")

		saynn("[say=pc]Open your mouth.[/say]")

		saynn("Nova was so cocky with you not that long ago but now her expression is so.. soft.. and sorry. But all you get back is her shaking her head, not even parting her lips a little bit.")

		saynn("[say=pc]Is that how we're gonna do this?[/say]")

		saynn("You notice her exhaling loudly when you pull your foot away.. but then she gets all tensed up again when that same foot lands on her sheath.. and proceeds to rub it.. While doing so, your hands are busy holding the datapad in such a way that it can capture all the action.")

		saynn("[say=nova]H-hey, what are you.. no, stop..[/say]")

		saynn("As you keep rubbing her sheath.. stroking it even.. the red tip of her cock starts peeking out more and more. And that makes Nova blush hard and put her paws on her crotch, keeping your foot away from the shaft itself.")

		saynn("[say=nova]T-this is h-humiliating..[/say]")

		saynn("[say=pc]Gave you a choice, pup. Hands off. Now.[/say]")

		saynn("But husky doesn't seem to listen, she is protecting her canine member with her paws the best she can. So you just move your foot a little lower and put a moderate amount of pressure on Nova's balls. But even that is enough to make her yelp and whine suddenly.")

		saynn("[say=pc]Do you want me to crush them?[/say]")

		saynn("Nova whines louder but eventually pulls her paws away, allowing you to continue humiliating her by stroking her red veiny cock with your foot. Quite quickly, she starts squirming under you, her ashamed face dropping little moans left and right. You make sure to capture how cute her expression is right now on the camera.")

		saynn("[say=pc]Much better. Moan louder, pup.[/say]")

		saynn("Whining escapes from her each time you slow down to torture her a little. But the moans that come after you continue stroking her cock get louder and quite desperate. It's clear for you that Nova's climax is approaching, her body can't stay in one spot anymore and her breathing is extremely ragged.")

		saynn("[say=nova]..p-please..[/say]")

		addButton("Let her cum", "Make that puppy cum on herself", "do_feet_cum")
		addButton("Deny her", "The pup needs to be humiliated more", "do_feet_deny")
	if(state == "do_feet_cum"):
		playAnimation(StageScene.SexFeetPlay, "head", {pc="pc", npc="nova", npcBodyState={naked=true, hard=true}})
		saynn("You have picked Nova's fate. But why not tease her a little more for the camera.")

		saynn("[say=pc]Can't hear you.[/say]")

		saynn("Nova arches her back and whines desperately when you slow down.")

		saynn("[say=nova]..please let me cum..[/say]")

		saynn("You pretend that you didn't hear that and continue slowing the pace, barely even pleasuring her anymore.")

		saynn("[say=nova]Ple-e-ease!.. Please! I wanna cum! Please, let me have it!..[/say]")

		saynn("[say=pc]Such a slut for feet.[/say]")

		saynn("You press Nova's cock into her belly with your foot and begin stroking it fast and rough, your wiggling toes teasing the tip until the husky gets pushed over the edge.")

		saynn("[say=nova]Fu-uck..[/say]")

		saynn("You can.. feel.. pressure inside her shaft building up until the big explosion. Strings after strings of sticky seed get shot out of her throbbing cock and then instantly landing on her gray fur, creating fancy lewd patterns.")

		saynn("And before Nova can even stop marking herself, you capture some of her cum onto your toes and then suddenly push them past her sharp teeth, forcing the puppy to taste her own jizz. You put the most mean voice that you can.")

		saynn("[say=pc]Suck.[/say]")

		saynn("More muffled whining escapes from Nova, her cute eyes focus on your leg as she starts obediently cleaning your foot, dragging her canine tongue through the creases between your toes and lapping up all the cum. All the while you are recording this through the datapad without her even realizing it.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("You chuckle softly watching this slut enjoy being humiliated so much.")

		addButton("Continue", "See what happens next", "nova_bully_menu")
	if(state == "do_feet_deny"):
		playAnimation(StageScene.SexFeetPlay, "head", {pc="pc", npc="nova", npcBodyState={naked=true, hard=true}})
		saynn("You have picked Nova's fate. But why not tease her a little more for the camera.")

		saynn("[say=pc]Can't hear you.[/say]")

		saynn("Nova arches her back and whines desperately when you slow down.")

		saynn("[say=nova]..please let me cum..[/say]")

		saynn("You pretend that you didn't hear that and continue slowing the pace, barely even pleasuring her anymore.")

		saynn("[say=nova]Ple-e-ease!.. Please! I wanna cum! Please, let me have it!..[/say]")

		saynn("Nova's cock is visibly twitching and actively leaking precum. She craves the release so much.")

		saynn("[say=pc]Such a slut for feet.[/say]")

		saynn("But you decide to screw with her even more and instead grab some of her pre onto your toes before shoving them past her teeth, forcing the puppy to taste her own lewd fluids. You lean in closer and put on your meanest voice possible.")

		saynn("[say=pc]Suck.[/say]")

		saynn("Husky looks at you with desperate eyes. Muffled moans still escape from her..")

		saynn("[say=pc]Now.[/say]")

		saynn("With a long whine, she starts sucking on your toes, thrusting her canine tongue between them and lapping up her precum. All the while her body slowly.. and painfully.. coolsdown..")

		saynn("Even after you pull your foot away from her face, she is still whining. At least denying her made her seem more obedient.")

		saynn("You make sure to record the whole process, how Nova was begging, how she got so close from this humiliating act.. and how her happy ending got stolen from her. Great.")

		addButton("Continue", "See what happens next", "nova_bully_menu")
	if(state == "do_bang"):
		aimCameraAndSetLocName("gym_nearbathroom")
		playAnimation(StageScene.Solo, "stand")
		saynn("The more you think about it.. the more you realize that this slut is just insatiable. Time to get some help breaking her then!")

		saynn("[say=pc]Stay here, pup.[/say]")

		saynn("[say=nova]..w-wha?..[/say]")

		saynn("You stop pinning her and go out into the gym area. Even if Nova wanted to try to escape, she would have to go through you.")

		saynn("Luckily, the gym is still somewhat crowded. You get everyone's attention.")

		saynn("[say=pc]Hey. Everyone. There is a slutty guard in the bathroom. Free to use![/say]")

		saynn("Many ears perk towards your voice.. and your words.. make their heads turn too. Suddenly you get what feels like a hundred hungry stares.")

		saynn("You offer them a little smile as a huge chunk of inmates stop doing what they're doing and begin walking towards you. Luckily, they walk past you..")

		saynn("As you walk back inside.. oh shit, there is a whole queue behind Nova already.")

		addButton("Watch", "See what happens next", "generate_use_nova_scene")
	if(state == "free_use1"):
		playAnimation(StageScene.SexStanding, "fast", {npc="nova", pc=npcID, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("One of the {npc.masc} inmates approaches Nova and, with a firm grasp, bends her over.")

		saynn("[say=nova]"+str(RNG.pick(["E-easy..", "H-hey..", "W-watch it..", "L-let go.."]))+"[/say]")

		saynn("With a forceful thrust, {npc.he} rams {npc.his} {npc.penis} down Nova's pussy, penetrating it and forcing a gasp of pleasure out of her!")

		saynn("The inmate quickly picks up the pace, fucking unwilling Nova roughly. The husky seems to be trying to struggle but a few seconds of being choked seem to calm her down.")

		saynn("After some time, the inmate grunts before shoving {npc.his} cock deep into Nova and releasing {npc.his} seed into her waiting womb, marking it.")

		saynn("[say=nova]"+str(RNG.pick(["F-Fuck!..", "B-bitch..", "I will f-fucking.. k-kh..", "S-stupid i-inmates..", "Not inside, you f-fuckers!.."]))+"[/say]")

		saynn("{npc.He} leaves a tally mark on Nova's ass after using her! You recorded everything on the datapad!")

		saynn("Nova's corruption: "+str(Util.roundF(corruption * 100.0, 1))+"%")

		addButton("More", "See who else is gonna use Nova", "generate_use_nova_scene")
		addButton("Enough", "That was enough gangbanging for Nova", "stop_gangbang")
	if(state == "free_use2"):
		playAnimation(StageScene.SexFreeStanding, "fast", {npc="nova", pc=npcID, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("One of the dominant inmates grabs Nova and quickly asserts control over her body, bending the husky over against her will and wrenching her paws behind her back.")

		saynn("[say=nova]"+str(RNG.pick(["E-easy..", "H-hey..", "W-watch it..", "L-let go.."]))+"[/say]")

		saynn("A second later, {npc.he} already forces {npc.his} {npc.penis} inside Nova's tight, slutty pussy before proceeding to just relentlessly pound it, easily overpowering her resistance.")

		saynn("With a final thrust, the inmate grunts and cums inside, {npc.his} seed flooding Nova's waiting womb, leaving a little bump on her belly even. Nova's voice trembles with a mix of anger and vulnerability.")

		saynn("[say=nova]"+str(RNG.pick(["F-Fuck!..", "B-bitch..", "I will f-fucking.. k-kh..", "S-stupid i-inmates..", "Not inside, you f-fuckers!.."]))+"[/say]")

		saynn("The inmate leaves a tally mark on Nova's ass after using her! You recorded everything on the datapad!")

		saynn("Nova's corruption: "+str(Util.roundF(corruption * 100.0, 1))+"%")

		addButton("More", "See who else is gonna use Nova", "generate_use_nova_scene")
		addButton("Enough", "That was enough gangbanging for Nova", "stop_gangbang")
	if(state == "free_use3"):
		playAnimation(StageScene.SexAllFours, "fast", {npc="nova", pc=npcID, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Nova shivers as one of the inmates approaches her. She makes her best attempt to resist but eventually she is overpowered and put on all fours, her ass sticking out.")

		saynn("[say=nova]"+str(RNG.pick(["E-easy..", "H-hey..", "W-watch it..", "L-let go.."]))+"[/say]")

		saynn("In one switch motion, the inmate positions {npc.himself} behind the husky, {npc.his} hands firmly gripping her hips as {npc.he} roughly penetrates her from behind, {npc.his} {npc.penis} stretching Nova's sex!")

		saynn("The naked vulnerable guard quickly starts to pant as her pussy receives the inmate's powerful thrusts, each one forcing {npc.his} cock a little deeper each time.")

		saynn("[say=nova]D-don't you d-dare..[/say]")

		saynn("With a primal growl, the inmate reaches the peak of {npc.his} desire, releasing {npc.his} seed into Nova's womb, stuffing it full to the brim!")

		saynn("[say=nova]"+str(RNG.pick(["F-Fuck!..", "B-bitch..", "I will f-fucking.. k-kh..", "S-stupid i-inmates..", "Not inside, you f-fuckers!.."]))+"[/say]")

		saynn("The inmate leaves a tally mark on Nova's ass after using her! You recorded everything on the datapad!")

		saynn("Nova's corruption: "+str(Util.roundF(corruption * 100.0, 1))+"%")

		addButton("More", "See who else is gonna use Nova", "generate_use_nova_scene")
		addButton("Enough", "That was enough gangbanging for Nova", "stop_gangbang")
	if(state == "free_use4"):
		playAnimation(StageScene.SexStanding, "fast", {npc="nova", pc=npcID, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("One of the {npc.masc} inmates approaches Nova. The husky already knows what {npc.he} needs so she just bends over for {npc.him} and holds onto the wall. The inmate puts {npc.his} hands on Nova's hips and bends her more though.")

		saynn("[say=nova]"+str(RNG.pick(["E-easy..", "H-hey..", "D-don't be so rough..", "H-how much more..", "Don't b-break me..", "Fuck, I'm losing it.."]))+"[/say]")

		saynn("With a forceful thrust, {npc.he} rams {npc.his} {npc.penis} down Nova's pussy, penetrating it and forcing a gasp of pleasure out of her!")

		saynn("The inmate quickly picks up the pace, fucking unwilling Nova roughly. The husky doesn't seem to be struggling that much this time, it's like she is getting used to.. getting used..")

		saynn("After some time, the inmate grunts before shoving {npc.his} cock deep into Nova and releasing {npc.his} seed into her waiting womb, marking it.")

		saynn("[say=nova]"+str(RNG.pick(["F-Fuck!..", "So much..", "I will f-fucking.. k-kh.. Too much!..", "Y-you, i-inmates..", "Maybe s-stop doing it inside?.. W-who cares anymore I g-guess.."]))+"[/say]")

		saynn("{npc.He} leaves a tally mark on Nova's ass after using her! You recorded everything on the datapad!")

		saynn("Nova's corruption: "+str(Util.roundF(corruption * 100.0, 1))+"%")

		addButton("More", "See who else is gonna use Nova", "generate_use_nova_scene")
		addButton("Enough", "That was enough gangbanging for Nova", "stop_gangbang")
	if(state == "free_use5"):
		playAnimation(StageScene.SexFreeStanding, "fast", {npc="nova", pc=npcID, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("One of the dominant inmates grabs Nova and quickly asserts control over her body, bending the husky over and wrenching her paws behind her back. It feels like she didn't even try to resist though.")

		saynn("[say=nova]"+str(RNG.pick(["E-easy..", "H-hey..", "D-don't be so rough..", "H-how much more..", "Don't b-break me..", "Fuck, I'm losing it.."]))+"[/say]")

		saynn("A second later, {npc.he} already forces {npc.his} {npc.penis} inside Nova's tight, wet pussy before proceeding to just relentlessly pound it. You can see Nova's tongue being out and drooling.")

		saynn("With a final thrust, the inmate grunts and cums inside, {npc.his} seed flooding Nova's waiting womb, leaving a little bump on her belly even. Nova's voice trembles with a mix of desperation and vulnerability.")

		saynn("[say=nova]"+str(RNG.pick(["F-Fuck!..", "So much..", "I will f-fucking.. k-kh.. Too much!..", "Y-you, i-inmates..", "Maybe s-stop doing it inside?.. W-who cares anymore I g-guess.."]))+"[/say]")

		saynn("The inmate leaves a tally mark on Nova's ass after using her! You recorded everything on the datapad!")

		saynn("Nova's corruption: "+str(Util.roundF(corruption * 100.0, 1))+"%")

		addButton("More", "See who else is gonna use Nova", "generate_use_nova_scene")
		addButton("Enough", "That was enough gangbanging for Nova", "stop_gangbang")
	if(state == "free_use6"):
		playAnimation(StageScene.SexAllFours, "fast", {npc="nova", pc=npcID, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Nova shivers as one of the inmates approaches her. She knows what will happen if she doesn't comply so she just gets on all fours willingly before sticking her ass out for the inmate to grab.")

		saynn("[say=nova]"+str(RNG.pick(["Just.. e-easy..", "H-hey..", "D-don't be so rough..", "H-how much more..", "Don't b-break me..", "Fuck, I'm losing it.."]))+"[/say]")

		saynn("In one switch motion, the inmate positions {npc.himself} behind the husky, {npc.his} hands firmly gripping her hips as {npc.he} roughly penetrates her from behind, {npc.his} {npc.penis} stretching Nova's sex!")

		saynn("The naked vulnerable guard quickly starts to pant as her pussy receives the inmate's powerful thrusts, each one forcing {npc.his} cock a little deeper each time.")

		saynn("[say=nova]M-maybe.. pull out?..[/say]")

		saynn("With a primal growl, the inmate reaches the peak of {npc.his} desire, releasing {npc.his} seed into Nova's womb, stuffing it full to the brim!")

		saynn("[say=nova]"+str(RNG.pick(["F-Fuck!..", "So much..", "I will f-fucking.. k-kh.. Too much!..", "Y-you, i-inmates..", "W-who cares anymore I g-guess.."]))+"[/say]")

		saynn("The inmate leaves a tally mark on Nova's ass after using her! You recorded everything on the datapad!")

		saynn("Nova's corruption: "+str(Util.roundF(corruption * 100.0, 1))+"%")

		addButton("More", "See who else is gonna use Nova", "generate_use_nova_scene")
		addButton("Enough", "That was enough gangbanging for Nova", "stop_gangbang")
	if(state == "free_use7"):
		playAnimation(StageScene.SexCowgirl, "fast", {npc="nova", pc=npcID, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("One of the inmates pulls Nova towards one of the benches and takes a seat. Slutty husky sees {npc.his} {npc.penis} and willingly positions herself atop of {npc.him}, straddling {npc.his} member and letting it penetrate her used pussy!")

		saynn("[say=nova]"+str(RNG.pick(["C'mon, let me feel that cock inside me already..", "Fuck that feels good..", "L-let me do this..", "What am I doing.. Fuck it.."]))+"[/say]")

		saynn("With a swift motion of her hips, Nova impales herself upon the inmate's throbbing cock and proceeds to ride it.")

		saynn("Other inmates approach her and she gets one of their cocks into her mouth while stroking the other two. The slut seems to be enjoying it.")

		saynn("She quickly brings the inmate under her to the brink of orgasm. Her own body tenses too as seed begins flowing into her womb yet again.. so much of it..")

		saynn("[say=nova]"+str(RNG.pick(["T-there we go..", "Who is next..", "T-this slut wants more..", "Yes, cum inside me, you fucker..", "S-shit.. so much.."]))+"[/say]")

		saynn("{npc.He} leaves a tally mark on Nova's ass after using her! You recorded everything on the datapad!")

		saynn("Nova's corruption: "+str(Util.roundF(corruption * 100.0, 1))+"%")

		addButton("More", "See who else is gonna use Nova", "generate_use_nova_scene")
		addButton("Enough", "That was enough gangbanging for Nova", "stop_gangbang")
	if(state == "free_use8"):
		playAnimation(StageScene.SexFullNelson, "fast", {npc="nova", pc=npcID, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("One of the inmates grabs Nova and lifts her legs above the floor before locking {npc.his} hands behind her neck, trapping the husky into a full nelson position! The slut doesn't seem to mind it though, her lusty eyes shine brightly.")

		saynn("[say=nova]"+str(RNG.pick(["C'mon, let me feel that cock inside me already..", "Yes, fuck me raw!..", "Use me like the slut that I am..", "Fuck this slutty pussy!", "Breed this whore.. f-fuck.."]))+"[/say]")

		saynn("The inmate quickly aligns {npc.his} {npc.penis} with Nova's used leaking cunt and easily penetrates it, going deep! The husky moans loudly while her helpless body is being fucked so roughly.")

		saynn("Very soon Nova cums, her cock wasting its load. Unlike the inmate, who grunts while stuffing that awaiting womb with even more seed.")

		saynn("[say=nova]"+str(RNG.pick(["T-there we go..", "Who is next..", "T-this slut wants more..", "Yes, cum inside me, you fucker..", "S-shit.. so much.."]))+"[/say]")

		saynn("The inmate leaves a tally mark on Nova's ass after using her! You recorded everything on the datapad!")

		saynn("Nova's corruption: "+str(Util.roundF(corruption * 100.0, 1))+"%")

		addButton("More", "See who else is gonna use Nova", "generate_use_nova_scene")
		addButton("Enough", "That was enough gangbanging for Nova", "stop_gangbang")
	if(state == "free_use9"):
		playAnimation(StageScene.SexMissionary, "fast", {npc="nova", pc=npcID, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Nova bends over as one of the inmates approaches her. But instead of just using Nova like that, {npc.he} instead pulls her down to the floor before pinning her! {npc.He} then raises her legs and shoves {npc.his} {npc.penis} deep down her slutty used cunt.")

		saynn("[say=nova]"+str(RNG.pick(["Fuck, that feels good!..", "Yes, fuck me raw!..", "Use me like the slut that I am..", "Fuck this slutty pussy!", "Breed this whore.. f-fuck.."]))+"[/say]")

		saynn("Nova moans loudly under the onslaught of this inmate, her tongue is out and drooling, her eyes slowly roll up. Very soon her own cock suddenly starts throbbing and shooting cum all over her gray fur.")

		saynn("The inmate grunts as Nova's pussy clenches around {npc.his} member so much. That easily sends {npc.him} over the edge, causing {npc.him} to start shooting seed deep into her abused slit, panting her white and stuffing her womb.")

		saynn("[say=nova]"+str(RNG.pick(["T-there we go..", "Who is next..", "T-this slut wants more..", "Yes, cum inside me, you fucker..", "S-shit.. so much.."]))+"[/say]")

		saynn("The inmate leaves a tally mark on Nova's ass after using her! You recorded everything on the datapad!")

		saynn("Nova's corruption: "+str(Util.roundF(corruption * 100.0, 1))+"%")

		addButton("More", "See who else is gonna use Nova", "generate_use_nova_scene")
		addButton("Enough", "That was enough gangbanging for Nova", "stop_gangbang")
	if(state == "do_fuck"):
		playAnimation(StageScene.SexStanding, "tease", {npc="nova", pc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Patrols don't check the bathrooms that often so this is the perfect opportunity to have some fun with the husky. As you grab her and press her against the wall instead, noises of protest begin to escape from her.")

		saynn("[say=nova]H-hey.. I'm not a slut that you can just use any time![/say]")

		saynn("Pinning the husky harder into the cold concrete makes her yelp and whine. She tries to push back but putting a hand around her neck and gently choking the guard makes her shiver.")

		saynn("[say=pc]Yeah, you're an unwilling whore, Nova. But your resistance won't stop me from using this.[/say]")

		saynn("As your free paw slides between her legs and lands on her folds, Nova whines again, her body reacting with more shivering. The more you tease her slit, the more of her arousal you catch onto your digits.")

		saynn("[say=nova]..at least use a r-rubber?..[/say]")

		saynn("She points at her belt which has some condoms sticking out from one of the pouches.")

		addButton("Use condom", "She is offering after all..", "do_fuck_putcondom")
		addButton("No", "Only raw", "do_fuck_fuck")
	if(state == "do_fuck_fuck"):
		playAnimation(StageScene.SexStanding, "fast", {npc="nova", pc="pc", bodyState={exposedCrotch=true,hard=true,condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		if (usedCondom):
			saynn("[say=pc]Fine.[/say]")

			saynn("You quickly reach out to her equipment and grab one of the wrapped up condoms. But just when you lean towards her belt, Nova sees an opportunity and tries to break free.")

			saynn("[say=nova]L-let go!..[/say]")

			saynn("She nearly succeeds, but you quickly catch her curly tail, giving it a firm tug, forcing Nova back and pressing her against the wall once again.")

			saynn("[say=pc]Think about where you were going, puppy.[/say]")

			saynn("You quickly rip open the package with your teeth and drag the elastic ring over your {pc.penis}, sealing it.")

			saynn("[say=nova]W-wai..[/say]")

		else:
			saynn("[say=pc]No.[/say]")

			saynn("Nova hears that and instantly tries to break free. By some miracle, she manages to shove her elbow into your jaw, stunning you for a second.")

			saynn("[say=nova]F-fuck you!..[/say]")

			saynn("She almost escapes but her curly tail sticks out so much that you easily manage to get a grasp on it before yanking hard, bringing Nova back and shoving her into the wall yet again, your {pc.penis} is hard and brushing against her thighs.")

			saynn("[say=pc]Stupid bitch.[/say]")

			saynn("[say=nova]W-wai..[/say]")

		saynn("With a fair amount of force, you thrust your member inside Nova's tight and unwilling pussy, spreading her petals wide and making her gasp. Instantly, you proceed to move your hips back and forth, fucking that slut while she is bent over and holding onto the cold wall.")

		saynn("[say=nova]S-stop.. please..[/say]")

		saynn("Any kind of attempts are met with you increasing your onslaught on her wet cunt. One of your hands returns to holding onto her neck, pushing the husky deeper into her submissive state. Gradually, her struggles give way to a growing sense of surrender, your dominance breaking through her weak defense.")

		saynn("[say=pc]You're just a slut, Nova.[/say]")

		saynn("[say=nova]N-no..[/say]")

		saynn("Each dirty word that you say to her makes her pussy clench around your member a little tighter. Her own canine dick is fully out, bobbing up and down while you're focused on pounding her sex. Desperate moans begin to escape from the husky, her voice trembling..")

		if (usedCondom):
			saynn("[say=nova]Why s-so rough.. N-not so hard maybe..[/say]")

			saynn("Hearing that only makes you eager to continue because her body only tells you a different story.")

		else:
			saynn("[say=nova]D-don't do it.. p-please.. N-not inside..[/say]")

			saynn("Hearing that only makes you eager to do it inside, just to make that puppy feel even more subby.")

		saynn("It seems your cock has been pressing on her pleasure button for quite a bit because after some deep thrusts her body suddenly starts to shiver and squirm, legs giving up, causing you to grip her neck harder to the point of stealing her air.")

		saynn("[say=nova]Ah-h..[/say]")

		saynn("Her inner walls grip your cock tightly but you keep pushing through that, overstimulating her slit to the point of it squirting and her dick wasting its cum on the wall before her. That orgasming pussy feels so good that you don't feel like pulling out at all..")

		addButton("Cum", "See what happens next", "do_fuck_cum")
	if(state == "do_fuck_cum"):
		playAnimation(StageScene.SexStanding, "inside", {npc="nova", pc="pc", bodyState={exposedCrotch=true,hard=true,condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		if (usedCondom && condomBroke):
			saynn("Why even bother to pull out if you have a condom on. You ram your {pc.cock} as deep as Nova's pussy allows and grunt as her soft insides bring you over the edge.")

			saynn("[say=nova]F-f.. f-uck..[/say]")

			saynn("Something.. feels.. wrong though. For some reason the sensations suddenly become way more real, it's like there is no.. wait. [b]The condom has broke, spilling all its contents![/b] Nova's womb gets stuffed full of your {pc.cum}!")

			saynn("As you pull out, this becomes obvious. The condom has a huge gaping hole in it and Nova's used pussy is leaking seed. It seems the husky begins to understand that too when you show her the broken condom.")

			saynn("[say=nova]W-wha.. wa-ai.. You came inside me! Y-you.. F-fuck..[/say]")

			saynn("Husky tries to grab you but her legs are still weak. You easily overpower her and bring down to the floor.")

			saynn("[say=pc]Accidents happen. What are you gonna do about it?[/say]")

			saynn("Nova is just whining while her pussy pulsates and leaks more.")

		elif (usedCondom):
			saynn("Why even bother to pull out if you have a condom on. You ram your {pc.cock} as deep as Nova's pussy allows and grunt as her soft insides bring you over the edge.")

			saynn("[say=nova]F-f.. f-uck..[/say]")

			saynn("Luckily, the condom holds up nicely, containing all your {pc.cum} inside without spilling into Nova's womb. You let her be your cock warmer for a bit before pulling out and tying up the used condom.")

			saynn("After you dispose of it, Nova is left with a stretched pussy that struggles to close for some time.")

			saynn("[say=nova]You.. F-fuck..[/say]")

			saynn("Husky tries to grab you but her legs are still weak. You easily overpower her and bring down to the floor.")

			saynn("[say=pc]And I will do it again and again. Until you understand.[/say]")

			saynn("Nova is just whining on the floor.")

		else:
			saynn("Nova can feel that you're not planning on pulling out. She tries to struggle out of your grip but you just wrench her arm behind her back and ram your {pc.cock} as deep as her pussy allows, grunting as her soft insides bring you over the edge.")

			saynn("[say=nova]F-f.. F-fuck!..[/say]")

			saynn("It feels so good, your member is throbbing while shooting {pc.cum} deep inside Nova's slit, stuffing her womb to the brim. You let her be your cock warmer for a bit before pulling out and smacking her ass, causing a few spirits of your seed to come out of her used cunt.")

			saynn("[say=nova]You.. F-fuck..[/say]")

			saynn("Husky tries to grab you but her legs are still weak. You easily overpower her and bring down to the floor.")

			saynn("[say=pc]And I will do it again and again. Until you understand.[/say]")

			saynn("Nova is just whining on the floor.")

		addButton("Continue", "See what happens next", "nova_bully_menu")
	if(state == "do_pickstrapon"):
		saynn("Pick what strapon you wanna use to fuck Nova.")

		addButton("Back", "You changed your mind", "nova_bully_menu")
		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "do_strapon_fuck")
	if(state == "do_strapon_fuck"):
		playAnimation(StageScene.SexStanding, "tease", {npc="nova", pc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Patrols don't check the bathrooms that often so this is the perfect opportunity to have some fun with the husky. Nova's eyes go wide as you produce a strapon and secure it around your waist. Then, as you grab her and press her against the wall, noises of protest begin to escape from her.")

		saynn("[say=nova]H-hey.. I'm not a slut![/say]")

		saynn("Pinning the husky harder into the cold concrete makes her yelp and whine. She tries to push back but putting a hand around her neck and gently choking the guard makes her shiver.")

		saynn("[say=pc]Yeah, you're an unwilling whore, Nova. But your resistance won't stop me from doing this.[/say]")

		saynn("As your free paw slides between her legs and lands on her folds, Nova whines again, her body reacting with more shivering. The more you tease her slit, the more of her arousal you catch onto your digits.")

		saynn("[say=nova]..at least it's a strapon..[/say]")

		addButton("Fuck Nova", "Do it", "do_strapon_actually")
	if(state == "do_strapon_actually"):
		playAnimation(StageScene.SexStanding, "fast", {npc="nova", pc="pc", bodyState={exposedCrotch=true,hard=true,condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]What a slut.[/say]")

		saynn("While you were fiddling with your strapon harness, Nova sees an opportunity and tries to break free.")

		saynn("[say=nova]L-let go!..[/say]")

		saynn("She nearly succeeds, but you quickly catch her curly tail, giving it a firm tug, forcing Nova back and pressing her against the wall once again.")

		saynn("[say=pc]Think twice about where you were going, puppy.[/say]")

		saynn("[say=nova]W-wai..[/say]")

		saynn("With a fair amount of force, you thrust your new rubber member inside Nova's tight and unwilling pussy, spreading her petals wide and making her gasp. Instantly, you proceed to move your hips back and forth, fucking that slut while she is bent over and holding onto the cold wall.")

		saynn("[say=nova]S-stop.. please..[/say]")

		saynn("Any kind of attempts are met with you increasing your onslaught on her wet cunt. One of your hands returns to holding onto her neck, pushing the husky deeper into her submissive state. Gradually, her struggles give way to a growing sense of surrender, your dominance breaking through her weak defense.")

		saynn("[say=pc]You're nothing more than a slut, Nova.[/say]")

		saynn("[say=nova]N-no..[/say]")

		saynn("Each dirty word that you say to her makes her pussy clench around your strapon a little tighter. Her own canine dick is fully out, bobbing up and down while you're focused on pounding her sex, driving her closer to the edge. Desperate moans begin to escape from the husky, her voice trembling..")

		saynn("[say=nova]Why s-so rough.. N-not so hard maybe..[/say]")

		saynn("Hearing that only makes you eager to continue because her body only tells you a different story.")

		saynn("It seems your strapon has been pressing on her pleasure button for quite a bit because after some deep thrusts her body suddenly starts to shiver and squirm, legs giving up, causing you to grip her neck harder to the point of stealing her air.")

		saynn("[say=nova]Ah-h..[/say]")

		saynn("Her inner walls grip the rubber cock tightly, but you push through, overstimulating her to the point of her pussy squirting and her canine member releasing its load against the wall before her. The pleasurable friction against your crotch that the strapon brings is too nice to resist, and you find yourself compelled to stay inside her, enjoying slowly moving your hips.")

		saynn("After you finally pull out, Nova is left with a stretched pussy that struggles to close for some time.")

		saynn("[say=nova]You.. F-fuck..[/say]")

		saynn("Husky tries to grab you but her legs are still weak. You easily overpower her and bring down to the floor.")

		saynn("[say=pc]And I will do it again and again. Until you understand.[/say]")

		saynn("Nova is just whining on the floor.")

		addButton("Continue", "See what happens next", "nostrapon_nova_bully_menu")
	if(state == "do_piss"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="nova", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		if (GM.pc.hasPenis()):
			saynn("Time to really humiliate Nova. She gets a little concerned when you suddenly expose your {pc.penis} and direct it towards her belly.")

		elif (GM.pc.hasReachableVagina()):
			saynn("Time to really humiliate Nova. She gets a little concerned when you suddenly expose your {pc.pussyStretch} pussy and spread the sensitive folds with your digits.")

		else:
			saynn("Time to really humiliate Nova. She gets a little concerned when you suddenly expose your crotch and loom over her belly.")

		saynn("[say=nova]..what are you..[/say]")

		saynn("[say=pc]This.[/say]")

		saynn("You stand over her, waiting for the urge. And, a few seconds later, a stream of gross yellow fluids begins washing over her, causing the husky to freeze in shock. All the while you record everything with the datapad and just keep marking her fur, forcing your scent into it.")

		saynn("[say=nova]..h-h-he..hey..[/say]")

		saynn("Nova's expression is that of a girl that saw porn for the first time, her ears turned down, her cheeks blushing brightly. You notice her red cock twitching as you piss all over her sheath and balls, some of the gross fluids streaming down her thighs and hips.")

		saynn("[say=nova]W-why did you do t-that..[/say]")

		saynn("[say=pc]Know your place, pup.[/say]")

		saynn("[say=nova]H-huff..[/say]")

		saynn("Nova looks at her fur that now has a golden tint to it. You're still holding her pinned so she can't even get up and wash it away in the showers. She is forced to endure being your piss toilet and carry your scent. You make sure to get some good angles of this cute piss-slut for the recording.")

		addButton("Enough", "That was fun", "nova_bully_menu")
		if (GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage() || GM.pc.hasReachableVagina()):
			addButton("Piss in mouth", "Humiliate her further", "do_piss_mouth")
	if(state == "do_piss_mouth"):
		playAnimation(StageScene.SexFaceSitting, "sit", {pc="pc", npc="nova", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Even though you humiliated Nova super hard.. your bladder is still not completely empty. So why not take advantage of her shocked state?")

		if (GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
			saynn("Suddenly, you sit on her face and shove your {pc.penis} into her mouth. Husky's eyes open wider when you let the urge come again and begin pissing down her throat!")

		else:
			saynn("Suddenly, you sit on her face and press your pussy against her lips. Husky's eyes open wider when you let the urge come again and begin pissing down her throat!")

		saynn("You can hear subtle whining before it gets replaced by the noises of her throat actively swallowing every few seconds. At some point it becomes too much for the poor husky and she starts gagging as the piss streams down her chin and neck.")

		saynn("[say=pc]Ugh. You need more training.[/say]")

		saynn("After you've done emptying your bladder, you just get up and take a good look at a properly marked husky that now knows how your piss tastes. Nova coughs and makes her best effort to avoid looking you in the eyes.")

		saynn("[say=nova]Bleh..[/say]")

		addButton("Continue", "That was even more fun", "nova_bully_menu")
	if(state == "do_done"):
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction={naked=true}})
		if (didFeet || didGang || didFuck || didPiss):
			saynn("Nova thought she would get off the hook just by naked under your foot? Hah. You properly humiliated her and got enough.. material.. to make sure she doesn't come back. Time to announce it.")

		else:
			saynn("You decided that Nova got humiliated enough when you undressed her. And even though you didn't do anything to her, you still got some good pictures of her being nude under your foot. That should be enough.. material.")

		saynn("The husky looks at you surprised when you take your foot off of her chest.")

		saynn("[say=pc]You can get up.[/say]")

		saynn("[say=nova]W-wha?..[/say]")

		if (didPiss):
			saynn("[say=pc]What? I would offer my hand but.. you know.. I'd rather not touch you.[/say]")

		else:
			saynn("[say=pc]What? Need a hand?[/say]")

		saynn("Nova slowly gets up off the floor. Obviously the first thing she looks at is her stun baton and the shock remote that is still in her belt somewhere.")

		saynn("[say=pc]Wouldn't do that if I were you.[/say]")

		saynn("The naked humiliated guard tilts her head.")

		saynn("[say=nova]What do you mean..[/say]")

		saynn("You flip the datapad towards her. The screen displays everything that happened with her.. The many photos that you took of her in a pretty compromising position.."+str(" How you brought her to the edge with just your feet.." if didFeet else "")+""+str(" How Nova got gangbanged in this very room by many inmates.." if didGang else "")+""+str(" A recording of you fucking Nova and her moaning for you.." if didFuck else "")+""+str(" And obviously.. how you pissed all over her while she didn't even struggle that much.." if didPiss else "")+"")

		saynn("[say=nova]N-no.. no.. no-no.. No!.. Give it back! Delete it!..[/say]")

		saynn("You can hear desperate voice cracks.. Nova suddenly lashes out at you but you protect the datapad and shove her back.")

		saynn("[say=pc]Another step towards me and I will send it all to every staff member on this station.[/say]")

		saynn("Husky hears that.. She sees your finger hovering over the 'share' button.. and starts whining.. like a sorry puppy.")

		saynn("[say=nova]P-please?..[/say]")

		saynn("She lowers her head.. and shoulders.. assuming quite a submissive posture.")

		saynn("[say=pc]If you're gonna be a good puppy then this recording might not go public. But it will stay with me.[/say]")

		saynn("Husky sighs and nods.")

		saynn("[say=pc]All I want is for you not to pursue me for what happened here.[/say]")

		saynn("[say=nova]Sure.. whatever..[/say]")

		if (didPiss):
			saynn("You would pet the girl but you'd rather not get your own piss on your hands.")

		else:
			saynn("You reach your hand out and pet the girl.")

		saynn("[say=pc]And trust me.. I know that they can wipe it remotely.. But I got into it somehow, right~?[/say]")

		saynn("Nova looks down at the floor.. Her eyes are big and sorry. Seems like you shattered all her hope.. what was left of it anyway.")

		saynn("[say=pc]So.. take care.[/say]")

		saynn("[say=nova]..it didn't work out for Tavi..[/say]")

		saynn("[say=pc]What was that?[/say]")

		saynn("[say=nova]Nothing..[/say]")

		saynn("And just like that, you leave the husky in the dressing room while holding her datapad! Exactly what Tavi needs.. Well.. One of the things that she needs.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lost_bathroom_nova"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="nova", npc="pc"})
		lostBathroom = true
		saynn("Defeated, you fall to your knees! But then Nova immediately pins you to the floor and raises her trusty weapon. You can see.. anger.. in her eyes.")

		saynn("[say=nova]The only thing I hate more than this job is when someone is lying to me![/say]")

		saynn("She strikes you with the painstick, sending a painful shock through your already-tired body, causing you to cry out aloud!")

		saynn("[say=nova]Don't lie to me ever![/say]")

		saynn("She just keeps shocking you, forcing more and more agonizing screams out of you. And just to make sure that you can't squirm your way out of this, she holds you pinned under her boot.")

		saynn("[say=nova]You understand me? Or are you asking for more?![/say]")

		saynn("Seconds feel like hours.. She hits you so much that her stun baton loses all its charge by the end of it. Husky is left panting and snarling for some time.")

		saynn("Then her expression begins to soften up the more she sees you recoiling in pain. Husky is deliberating.. until she finally pulls her leg off of you.")

		saynn("[say=nova]That was too much probably.. I can't say you didn't deserve it.. But I shouldn't have.. Here.[/say]")

		saynn("She puts her weapon away and produces a little pill before offering it to you.")

		saynn("[say=nova]Painkillers.[/say]")

		addButton("Swallow it", "Swallow the pill and see what happens", "swallow_pill_oops")
	if(state == "swallow_pill_oops"):
		playAnimation(StageScene.Solo, "stand", {pc="nova"})
		saynn("You swallow the pill.. why not.. It's not like it can make it worse.")

		saynn("Luckily, the husky didn't lie. It does indeed help to soothe the aching pain in your muscles somewhat. Enough for you to sit against the wall and look at.. wait.. Who are those people?")

		saynn("Behind Nova there are a few inmates standing, waiting for her to notice them. It seems your.. loud screams.. attracted them. They probably managed to sneak behind her while the husky way busy beating the hell out of you.")

		saynn("Nova tilts her head seeing that your eyes aren't focused on her.")

		saynn("[say=nova]Is something wrong?.. Oh.. hello there..[/say]")

		saynn("She turns around and finally realizes she got surrounded. The eyes on those inmates though..")

		saynn("[say=nova]Leave, inmates. While you still can.[/say]")

		saynn("Nova fetches her stun baton and presses on the handle to cause some scary noises and sparks.. but none come.")

		saynn("[say=nova]Oops, I forgot..[/say]")

		addButton("Continue", "See what happens next", "nova_gets_rekt")
	if(state == "nova_gets_rekt"):
		playAnimation(StageScene.Solo, "defeat", {pc="nova", bodyState={naked=true}})
		saynn("Nova reaches for her shock remote but the inmates aren't just standing around. They suddenly lash out at the guard and pin her against the wall near you.")

		saynn("[say=nova]H-hey!.. S-stop this!..[/say]")

		saynn("The inmates begin trying to take off her armor but the metallic pieces are held in place by some powerful electromagnets. Doesn't matter to them though, most of them are ripped enough to just tear off all her armored bits one by one, including the main piece that has the generator.")

		saynn("Stopping them.. is not something that you can do in your current state.. But it's hard to stop a crowd of horny inmates anyway. Some of them hold Nova still while the rest start unzipping her undersuit, revealing her {nova.breasts}, her sheath that hides her {nova.penis} and her cute pussy that hides behind her ballsack.")

		saynn("[say=nova]I will break you all![/say]")

		saynn("Ohh, you notice the datapad after the inmates rip Nova's belt off. You grab it and unlock it the way Tavi showed you. Great, there is a camera app. You launch it and begin recording what the inmates are doing to the poor puppy.")

		saynn("Nova is snarling at them but after both her sheath and neck get grabbed and squeezed tight, the husky is left whining.")

		saynn("Oh wow, after that, a queue of inmates begins lining up near her! And the first one is already approaching her..")

		addButton("Watch", "See what happens next", "generate_use_nova_scene")
	if(state == "after_lost_gang"):
		playAnimation(StageScene.SexStart, "start", {npc="nova", npcBodyState={naked=true}})
		setFlag("TaviModule.Ch5BlackmailedNova", true)
		setFlag("NovaModule.Nova_NotThereToday", true)
		saynn("After the whole queue has had their fun with the husky.. she is left on the floor, panting. Her eyes barely focus on you after you try to get her attention.")

		saynn("[say=nova]Nh-h..[/say]")

		saynn("[say=pc]Do you believe in karma?[/say]")

		saynn("[say=nova]No.. Misguided hope for weak people..[/say]")

		saynn("You almost feel bad for the husky. But she did strike you many times. You show Nova her own datapad and play the recording of the gangbang session that has just happened.")

		saynn("[say=nova]H-hey.. How did you..[/say]")

		saynn("She tries to take it back but you don't let her, obviously.")

		saynn("[say=pc]I will be taking this. And if someone else finds out, every staff member on this station will see this video. Mhm?[/say]")

		saynn("Husky whines softly.")

		saynn("[say=nova]F-fine..[/say]")

		saynn("You offer her a pat on the head and get up. You would have some more fun with her but your muscles kinda ache. The lucky slut finally gets some rest. And you have a datapad for Tavi.")

		saynn("Time to go though.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "bath_seduce"):
		playAnimation(StageScene.SexStanding, "tease", {npc="pc", pc="nova"})
		saynn("You take a step back and then raise your hands like you are surrendering. Nova tilts her head but then looks over the corner, seeing.. that there is no blood or bodies or anything strange.")

		saynn("[say=nova]Um. Did you lie to me, inmate?[/say]")

		saynn("Nova lashes out at you and then pins you against the wall, her hands wrenching your arms behind your back, forcing you to kiss the concrete.")

		saynn("[say=pc]Ow.. ow.. yes, I did. I'm sorry.[/say]")

		saynn("Powerful husky growls into your ear, sending shivers down your spine.")

		saynn("[say=nova]A simple apology is not enough for liars. Why did you do that? Huh?[/say]")

		saynn("The longer you don't say anything, the more pressure she puts on your arm, making it feel quite painful.. Time to come up with something..")

		saynn("[say=pc]Because I wanted to be with you for a bit..[/say]")

		saynn("That really catches Nova off-guard.")

		saynn("[say=nova]What are you..[/say]")

		saynn("[say=pc]Some alone time, you know?.. You and me..[/say]")

		saynn("Nova's grip on your arms relaxes, she blinks quickly and tilts her head.")

		saynn("[say=nova]Why are you saying that..[/say]")

		saynn("But then she pins you into the concrete again! Ow.")

		saynn("[say=nova]Oh, I know. You keep lying to me. Because you just want to be punished, huh. By a big mommy. I got something big for you.[/say]")

		addButton("Continue", "See what happens next", "nova_about_to_fuck")
	if(state == "nova_about_to_fuck"):
		playAnimation(StageScene.SexStanding, "tease", {npc="pc", pc="nova", bodyState={naked=true,hard=true,condom=true}, npcBodyState={naked=true, hard=true}})
		saynn("Nova switches off her armor and begins to slowly strip the metal pieces before taking off her belt and leaving it all in a neat pile. You can see the datapad right there, attached to her belt.. But she still holds you pinned to the wall.. It seems you need another plan..")

		saynn("All the while Nova unzips her undersuit, exposing her sheath with the red canine cock already peeking out of it. You can feel its pointy tip already brushing up against your "+str("pussy" if GM.pc.hasReachableVagina() else "tailhole")+"..")

		saynn("[say=nova]What~? You wanted to be with me, didn't you~. Unless that was a lie as well.[/say]")

		saynn("Nova then produces a wrapped-up condom and quickly opens the package before applying it to her canine shaft..")

		saynn("[say=nova]Taking no chances with you.[/say]")

		saynn("It seems that datapad will have to wait..")

func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "do_strapon_fuck", [strapon])


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
		setFlag("TaviModule.Ch5StoleDatapadFromNova", true)
		addMessage("Task updated!")
		addExperienceToPlayer(100)

	if(_action == "do_feet"):
		processTime(5*60)
		didFeet = true

	if(_action == "do_bang"):
		processTime(5*60)
		didGang = true

	if(_action == "do_fuck"):
		processTime(5*60)
		didFuck = true

	if(_action == "do_piss"):
		didPiss = true
		processTime(10*60)
		getCharacter("nova").pissedOnBy("pc")

	if(_action == "do_done"):
		processTime(5*60)
		setFlag("TaviModule.Ch5BlackmailedNova", true)
		setFlag("NovaModule.Nova_NotThereToday", true)

	if(_action == "do_feet_cum"):
		processTime(3*60)
		getCharacter("nova").cummedOnBy("nova", FluidSource.Penis, 0.8)
		getCharacter("nova").cummedInMouthBy("nova")

	if(_action == "do_feet_deny"):
		processTime(3*60)

	if(_action == "generate_use_nova_scene"):
		processTime(10*60)
		var possible = []
		if(corruption < 0.4):
			possible.append_array(["free_use1", "free_use2", "free_use3"])
		elif(corruption < 0.9):
			possible.append_array(["free_use4", "free_use5", "free_use6"])
		else:
			possible.append_array(["free_use7", "free_use8", "free_use9"])
		
		var pickedState = RNG.pick(possible)
		
		if(npcID != ""):
			removeCharacter(npcID)
			npcID = ""
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.NoChastity], [NpcCon.HasPenis]], InmateGenerator.new(), {NpcGen.NoChastity: true, NpcGen.Level: RNG.randi_range(1, 10), NpcGen.HasPenis: true})
		addCharacter(npcID)
		
		corruption += RNG.randf_range(0.05, 0.1)
		corruption = clamp(corruption, 0.0, 1.0)
		
		getCharacter("nova").addTallymarkButt()
		getCharacter("nova").cummedInVaginaBy(npcID)
		setState(pickedState)
		return

	if(_action == "stop_gangbang"):
		if(lostBathroom):
			setState("after_lost_gang")
		else:
			setState("nova_bully_menu")
		return

	if(_action == "do_fuck_putcondom"):
		usedCondom = true
		if(GM.pc.shouldCondomBreakWhenFucking("nova", 30)):
			condomBroke = true
		setState("do_fuck_fuck")
		return

	if(_action == "do_fuck_cum"):
		processTime(10*60)
		if(!usedCondom || condomBroke):
			getCharacter("nova").cummedInVaginaBy("pc")
		if(usedCondom && !condomBroke):
			addFilledCondomToLootIfPerk(GM.pc.createFilledCondom())
		GM.pc.orgasmFrom("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "do_strapon_fuck"):
		processTime(10*60)
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		didFuck = true

	if(_action == "do_strapon_actually"):
		processTime(5*60)
		getCharacter("nova").cummedInVaginaBy("pc", FluidSource.Strapon)

	if(_action == "nostrapon_nova_bully_menu"):
		GM.pc.unequipStrapon()
		setState("nova_bully_menu")

	if(_action == "do_piss_mouth"):
		processTime(3*60)
		getCharacter("nova").cummedInMouthBy("pc", FluidSource.Pissing)

	if(_action == "swallow_pill_oops"):
		processTime(6*60)
		GM.pc.addPain(-100)

	if(_action == "nova_gets_rekt"):
		processTime(3*60)

	if(_action == "nova_about_to_fuck"):
		processTime(2*60)

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
			GM.pc.addPain(300)
			GM.pc.doWound("nova")

func saveData():
	var data = .saveData()

	data["usedCondom"] = usedCondom
	data["condomBroke"] = condomBroke
	data["didFeet"] = didFeet
	data["didGang"] = didGang
	data["didFuck"] = didFuck
	data["didPiss"] = didPiss
	data["npcID"] = npcID
	data["corruption"] = corruption
	data["lostBathroom"] = lostBathroom

	return data

func loadData(data):
	.loadData(data)

	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	didFeet = SAVE.loadVar(data, "didFeet", false)
	didGang = SAVE.loadVar(data, "didGang", false)
	didFuck = SAVE.loadVar(data, "didFuck", false)
	didPiss = SAVE.loadVar(data, "didPiss", false)
	npcID = SAVE.loadVar(data, "npcID", "")
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	lostBathroom = SAVE.loadVar(data, "lostBathroom", false)
