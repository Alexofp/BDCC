extends "res://Scenes/SceneBase.gd"

var gotPayed = false

func _init():
	sceneID = "RishaGymScene"

func _run():
	if(state == ""):
		addCharacter("risha", ["naked"])
		playAnimation(StageScene.Duo, "stand", {
			npc="risha", npcAction="sit", 
			bodyState={},
			npcBodyState={naked=true,hard=true},
		})

#ACEPREGEXPAC - Risha in the Gym has a few line variants
#I dont know for sure if Risha can actually be knocked up by someone other than the player, maybe I'll add a special line later but for now I can leave it ambiguious
	if(state == ""):
		saynn("It’s pretty late so this area is not that crowded. But, you see somebody that you didn’t expect to see here. Risha, the lynx, is sitting on one of the benches and removing pieces of her armor. You decide to approach her and ask what’s up.")

		saynn("[say=pc]What are you doing?[/say]")

		saynn("[say=risha]What does it look like I’m doing? I’m here to lift some heavy ass weights. Gotta keep the gains somehow.[/say]")

		saynn("As Risha strips her forearm and shoulder protectors, you do indeed notice the curves of her toned muscles covered by bright cyan fur. The girl’s been working out quite regularly.")

		saynn("[say=pc]Aren’t you afraid that somebody will steal your armor?[/say]")

		saynn("[say=risha]My riot gear? You know, the last fucktoy that even touched it got his neck fried. I’d honestly like to see you try, you would make a great show for all the cameras. AlphaCorp isn’t fucking around with their security.[/say]")

		if(getCharacter("risha").isVisiblyPregnant()):
			saynn("She finishes stripping off her arms. Then she moves on to her chest, taking off the waist and chest plates, gradually coming down around her pregnant midsection. Whatever is holding down the undersuit around her gravid belly practically snaps off now that it isnt being pulled so tight. As she strips you realize that she has absolutely nothing under her armor. She casually exposes her huge leaky breasts with bright red perky nipples and stretches a bit like all cats do.")
			
			saynn("[say=risha]Getting hard to even fit into it.[/say]")
		else:
			saynn("She finishes stripping off her arms. Then she moves on to her chest, taking off the waist and chest plates. As she strips you realize that she has absolutely nothing under her armor. She casually exposes her huge breasts with bright red perky nipples and stretches a bit like all cats do.")

		saynn("[say=risha]Wearing it feels like being in an oven and it weighs a ton, fuck me.[/say]")

		saynn("Risha carefully places all the pieces nearby and strips further, removing her protected boots and armored thigh pieces. She also removes the crotch protector, revealing her feline barbed cock and a red moist cunt hidden behind her ballsack, she is a herm. All the while still being casual about it. She catches your concerned look.")

		saynn("[say=risha]What? Never seen a cat dick before or what?[/say]")

		saynn("[say=pc]Uh. Nothing.[/say]")

		saynn("[say=risha]How about you stop staring at my cock and spot me instead. It’s the end of my shift, I can do whatever I fucking want.[/say]")

		addButton("Sure", "Why not", "sure")
		addButton("Nah", "You don’t feel like spotting for a naked guard lynx", "nah")

	if(state == "nah"):
		saynn("[say=pc]Nah, you better find someone else.[/say]")

		saynn("[say=risha]Well then don’t fucking waste my time, fucktoy[/say]")
		
		if(getCharacter("risha").isVisiblyPregnant()):
			saynn("Risha holds her gravid stomach as she lays back onto the bend and starts lifting heavy weights. She is growling as she quickly picks up the pace and starts to consistently push her body. You stare at her and her stored equipment a little longer and decide to leave her be.")
		else:
			saynn("Risha lies onto the bend and starts lifting heavy weights. She is growling as she quickly picks up the pace and starts to consistently push her body. You stare at her and her stored equipment a little longer and decide to leave her be.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

	if(state == "sure"):
		saynn("You shrug and stand behind the bench so you can watch over Risha.")

		saynn("[say=pc]You’re putting a lot of trust into someone you don’t know.[/say]")

		saynn("Completely naked lynx quickly stretches some more and then takes place on the bench. She grabs the heavy bar, lifts it from its resting position and starts doing barbell bench presses.")

		saynn("[say=risha]Oh yeah? You inmates are all the same, either want to stick your limp dicks into someone else or be railed so hard you can’t walk the next day.[/say]")

		saynn("[say=pc]Really, now? And what do you want?[/say]")

		saynn("Risha starts really pushing herself, panting and growling slightly as she works the barbell at a steady pace. Due to her fur she is not really sweating but you do catch her strong scent.")

		saynn("[say=risha]Me? I’m just here to have fun. I will take the job of handling fucktoys like you over dying somewhere out there on a war for some fucker that has too much money.[/say]")

		saynn("[say=pc]Huh. What about the captain, he seems to like having you around. Isn’t he like that.[/say]")

		saynn("Risha does some more reps until she is completely out of breath. And even then, she focuses on the lifting weights and growls louder as she pushes herself past the point of exhaustion. You seem to notice her barbed cock getting harder as she does that, it leaks precum and throbs each time she lifts the bar. Finally, she stops and, with your help, puts the bar back into its resting place. Risha sits down and quickly catches her breath.")

		saynn("[say=risha]Fuck yeah, I’m so fucking ripped! The captain? I don’t ask stupid questions, I just do what’s told. Hey, do you wanna get paid? I have a huge problem that needs to be taken care of.[/say]")

		saynn("You move from behind the bench and approach the sitting Risha. Your gaze gets stolen by her erect cock, even the barbs look like they are inflated with blood.")

		saynn("[say=pc]Yeah, one huge problem. With a cock.[/say]")

		saynn("[say=risha]Very funny, slut. 5 credits.[/say]")

		saynn("You look around and decide. The place is empty, everyone is either sleeping or doing something else.")

		addButton("Nah", "She can go fuck herself", "nah1")
		addButtonWithChecks("Offer pussy", "Be bred by Risha", "offer_pussy", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Offer ass", "Be fucked in the ass by Risha", "offer_ass", [], [ButtonChecks.HasReachableAnus])
		addButton("Offer handjob", "Make her cum while being a bit of a brat", "offer_handjob")
		addButtonWithChecks("Fuck Risha", "(noncon) That lynx is a herm so how about you help her take the edge off by fucking her", "fuck_risha", [], [ButtonChecks.HasReachablePenis, [ButtonChecks.StatCheck, Stat.Strength, 8]])

	if(state == "nah1"):
		saynn("[say=pc]I think you can go fuck yourself for 5 credits.[/say]")

		saynn("Risha chuckles.")

		saynn("[say=risha]Everyone has a price, sweetie. You’re no angel, no one is. You can fuck off though, I need some alone time, can’t you see.[/say]")

		saynn("Well, you decide that you don’t need to watch this show. You shrug and leave the cat alone.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

	if(state == "offer_ass"):
		playAnimation(StageScene.SexAllFours, "sex", {
			pc="risha", npc="pc", 
			bodyState={naked=true,hard=true},
			npcBodyState={exposedCrotch=true,},
		})
		
		saynn("You turn and playfully wiggle your {pc.thick} rear for the lynx. You look behind your shoulder and see Risha checking out your ass. She seems to be very pent up, already massaging her feline balls at the view.")

		saynn("[say=pc]How’s this for a solution.[/say]")

		saynn("[say=risha]Good enough.[/say]")

		saynn("Suddenly she grabs you by the arms and switches places, bending you over the bench. You don’t even find time to struggle before she masterfully shoves your head under the metal bar while chaining your arms to its heavy rings, creating a makeshift pillory. The bench itself prevents you from closing your legs, you are quickly made helpless!")

		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("Risha {pc.undressMessageS}, leaving you butt-naked.")

		saynn("[say=pc]H-hey..[/say]")

		saynn("She then lands a smack on your {pc.masc} butt and spreads the cheeks open, catching the view of your {pc.analStretch} anal ring clenching from the pain. She hovers over your ass and drools over your star.")
		if(getCharacter("risha").isVisiblyPregnant()):
			saynn("[say=risha]Hope you’re ready for me, slut. This pregnancy has been rough and I need to take the edge off.[/say]")
		else:
			saynn("[say=risha]Hope you’re ready for me, slut. I just need to take the edge off.[/say]")

		saynn("Well she isn’t wrong technically, you are doing this for the credits. Risha doesn’t waste time for too long, she guides her barbed feline cock and presses it against your tailhole. You arch your back and struggle against the metal bar as the cat’s soft spikes are brushing against your soft {pc.thick} butt.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Even though you are stuck in quite an exposed position and are about to be taken advantage of, you feel kinda excited, your {pc.cock} is trying to get more erect but it’s still neatly contained behind chastity.")
		elif(GM.pc.hasPenis()):
			saynn("Even though you are stuck in quite an exposed position and are about to be taken advantage of, you feel kinda excited, your {pc.cock} is getting more erect.")

		saynn("Risha spits on her cock and, without much more preparation, buckles her hips forward, forcing her barbed member to penetrate your {pc.analStretch} hole and stretch it open enough to shove the head inside. You arch your back more and let out a moan as she roughly pushes her cock deeper, her spikes raking at your soft inner walls.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("You feel her cock pushing at your sensitive spot, squeezing transparent fluids out of your cock.")

		saynn("[say=pc]Fuck.. So rough.[/say]")

		saynn("[say=risha]See, you, inmates, are so easy to handle.[/say]")

		saynn("Risha shoves her cock as deep as your {pc.masc} ass allows before retracting just enough to not pull out completely. She gives your butt another smack, causing you to moan and clench your tailhole, before thrusting deep again, easily pushing through your attempts at resistance. Risha quickly picks up the pace, ramming her cock down your ass before almost pulling it out. You feel the discomfort slowly fading away, being replaced by a very pleasurable feeling, you part your lips and begin moaning out loud.")

		saynn("[say=risha]Oh yeah, I know you love it. Each whore of this station was on this cock, zero complaints so far.[/say]")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your {pc.cock} is leaking more and more precum mixed with your prostate fluids, the way her thick shaft rubs your p-spot sends shivers down your spine and makes your member throb. You feel like you won’t be able to endure this for long, after your hard prostate is squeezed it only gets filled more the next second, you feel the peak closing in..")

		# (if has vagina)
		if(GM.pc.hasVagina()):
			saynn("Even though your other bits aren’t being used, your needy pussy is drenched with juices! Risha’s cock is so thick it rubs your pleasure spot through the inner wall, making it feel very good. Can you really get off to anal sex..")

		saynn("You feel like you are about to cum, your anal ring is getting tighter around the cat’s cock and she feels it. She only increases her pace, basically ravaging your stretched fuckhole, using her precum and saliva as lube.")

		saynn("[say=risha]You're gonna take it all, you hear?[/say]")

		saynn("Your eyes begin to roll up on their own..")

		addButton("Cum", "The orgasm overtakes your body", "cumAnal")

	if(state == "cumAnal"):
		playAnimation(StageScene.SexAllFours, "fast", {
			pc="risha", npc="pc", 
			pcCum=true, npcCum=true,
			bodyState={naked=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("You begin to thrash against the restraints and make loud pleasure noises, your whole body squirms and shivers as you struggle to stay still. Though Risha’s hands hold your ass nice and tight, she keeps shoving her cock in and out even through your climax.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your member desperately tries to get hard but the chastity cage is being very mean to you and prevents all of that. Your prostate got absolutely smashed, it didn’t take long for your {pc.cock} to start leaking weak lines of {pc.cum} onto the bench and floor. She really drains you, even during your wet orgasm she pounds at your p-spot until there is nothing left in your balls.")
		elif(GM.pc.hasPenis()):
			saynn("Your prostate got absolutely smashed, it didn’t take long for your {pc.cock} to start leaking strong lines of {pc.cum} onto the bench and floor. She really drains you, even during your wet orgasm she pounds at your p-spot until there is nothing left in your balls.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your tailhole got so much stimulation that your neglected pussy suddenly squirts juices all over the bench.")

		saynn("[say=risha]Did my little fuckdoll cum already? Oh, what a shame. Now it’s my turn.[/say]")

		saynn("And she wasn’t kidding, even as your inner walls try to close around her shaft, she keeps fucking your ass, thrusting slow but putting full force into each one. Eventually you begin to feel her barbs hardening, they catch onto your soft insides and scrape on them, preventing Risha from pulling out. She starts to groan, her cock throbbing and pulsating as it shoots wave after wave of hot cum down your anus! Your belly starts to look inflated as she fills you to the brim.")

		saynn("Eventually you both come down from your orgasms but your body still shivers on its own. Risha’s barbs soften up so she pulls her messy cock out, leaving your used fuckhole to gape and leak cum.")

		saynn("Risha quickly catches her breath and admires the view.")

		# (if not pay)
		if(!gotPayed):
			saynn("[say=risha]You are a great fuck. But I already paid you this week, can’t have you spoiled. Sorry fucktoy~.[/say]")

			saynn("[say=pc]Huh?.. H-hey..[/say]")

			saynn("Risha quickly unchains you from the bar, causing you to fall onto the bench.")

			saynn("[say=risha]Now go away, I’m sure some lilac will happily clean up after you.[/say]")

			saynn("With nothing else to do, you quickly gather yourself and stand up, cum still leaking out of you as you awkwardly walk away. Satisfied, though.")

		# (if will pay)
		else:
			saynn("[say=risha]You are a great fuck. There you go, you earned it.[/say]")

			saynn("Risha slides a credit chip into your hand and then quickly unchains you from the bar, causing you to fall onto the bench.")

			saynn("[say=risha]Now go away, I’m sure some lilac will happily clean up after you.[/say]")

			saynn("With nothing else to do, you quickly gather yourself and stand up, cum still leaking out of you as you awkwardly walk away. Satisfied, though.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

	if(state == "offer_handjob"):
		# (You get on her knees and start stroking her)
		playAnimation(StageScene.SexHandjob, "sex", {
			pc="risha", npc="pc", 
			bodyState={naked=true,hard=true},
			npcBodyState={},
		})

#ACEPREGEXPAC - Player and Risha have some additional lines if she's pregnant.
#dialogue is still, eh, its there. I can come back later if I have to. Maybe its just the weirdness of actually doing it vs thinking of it.
		saynn("Five credits is still something, you lower yourself onto your knees and shift closer to the bench. Risha spreads her legs for you, offering a full view of her male and female bits. She idly strokes her feline cock while her balls sway slightly, sometimes offering glimpses of her wet cunt.")

		saynn("[say=risha]That was the right choice.[/say]")

		saynn("[say=pc]Why don’t you find someone to fuck you. Would give a reason for your slit.[/say]")

		saynn("Risha stops stroking herself as you wrap your digits around her shaft instead and start gently sliding them along her length. You feel her barbs softly tickling your palm as you brush it over the cock’s head, such a strange feeling. Risha just leans back and enjoys you working.")

		saynn("[say=risha]I didn’t exactly choose it, you know. I’m not gonna bottom for some wanna be criminal scum. I’d rather use them as my cock sock.[/say]")

		if(getCharacter("risha").isVisiblyPregnant()):
			saynn("You look up from under the lynx's expecting belly.")
			
			saynn("[say=pc]Are you sure about that?[/say]")
			
			saynn("[say=risha]Maybe, but you're still the same toy as the rest of the sluts here.[/say]")

#		elif(getCharacter("risha").isVisiblyPregnantFromPlayer()):
#			saynn("You look up from under the lynx's expecting belly.")
#
#			saynn("[say=pc]That didnt stop me.[/say]")
#
#			saynn("[say=risha]And yet you're back being my toy. Like all the other desperate sluts.[/say]")

		else:
			saynn("[say=pc]Really now?[/say]")

		saynn("You keep stroking her red meaty shaft, you digits catch some of her precum and spread it along the surface. Risha smirks while watching you, her face doesn’t really indicate how much pleasure your stroking brings. You decide to toy with her and sneak the second hand under her ballsack, your digits landing on her pussy and teasing the sensitive folds, they are so wet. Risha lets out a surprised moan.")

		saynn("[say=risha]Ah. The toy is getting cheeky, huh?[/say]")

		saynn("[say=pc]Just proving that you’re wrong~.[/say]")

		saynn("[say=risha]Sure, slut. Just make me cum.[/say]")

		saynn("Two of your digits spread her needy pussy, spawning a few strings of her juices between the petals. Then you use the third digit to prod at her pussy hole until it gives in, surprisingly easy. You other hand still slides over her shaft while the second now playfully fingers her cunt. You feel how big of an effect it has on Risha, her legs start to shift and shake slightly, she raises her chin high and lets out a few lusty moans as you pleasure her both sets of bits.")

		saynn("[say=pc]I think somebody is enjoying this way too much~[/say]")

		saynn("[say=risha]Shut up.. And do it faster.[/say]")

		saynn("You decide to obey but not exactly. As you increase your onslaught on her cunt, you slow down your other hand, barely stroking her cock at this point. You feel her shaft throbbing and pulsing, leaking precum and begging for more attention but you only finger her cunt harder instead, searching for her g-spot and then hammering away at it, causing the lynx to start arching her back and squirming, she clearly won’t be able to resist this for long.")

		addButton("Make her cum", "Send that bitch to the heavens", "make_her_cum")

	if(state == "make_her_cum"):
		# (cum in mouth, stretches mouth, covers in cum)
		playAnimation(StageScene.SexHandjob, "fast", {
			pc="risha", npc="pc", 
			pcCum=true,
			bodyState={naked=true,hard=true},
			npcBodyState={},
		})

		saynn("You stop stroking her cock completely, instead just squeezing it near the base. You can feel her veins bulging as she is being edged, her member is leaking precum profusely but she doesn’t cum. You hear her desperate moans as you finger-fuck her pussy, subtle growling can be heard too.")

		saynn("[say=pc]Why aren’t you begging, slut~[/say]")

		saynn("Suddenly Risha leans forward and puts her hands around your head, the sharp discomfort makes you whine and open your mouth enough for her to pull your head onto her shaft, making you part your lips and then shoving her throbbing cock deep down your throat. She cries out a groan as your throat closes around her dick, quickly sending the lynx over the edge.")
#ACEPREGEXPAC - V2 - More Preg Risha lines
		if(getCharacter("risha").isHeavilyPregnant()):
			saynn("Her heavily pregnant tummy is pressed against your face as her buff arms bend around it to hold you down around her cock.")
		
		saynn("[say=risha]Grr.. I told you to shut up, fucktoy[/say]")

		saynn("Your fingers are still lodged into her cunt, you feel her pussy clenching and squirting juices all over your hand as her cock starts shooting many waves of hot cum down your throat. The barbs make sure pulling out at this moment would be a very painful thing so you sit still and allow the dickgirl to force feed you her semen. This orgasm seems very powerful for her, she is groaning and squirming a lot, moans escape one after another until you drain her balls completely.")

		saynn("Her barbs finally soften up, allowing you to escape her grasp. As you pull away from the cock, the last strings of cum end up stuffing your mouth and on your face, leaving quite a lovely mess.")

		saynn("[say=pc]Bitch..[/say]")

		saynn("Risha leans down to you, still panting slightly.")

		saynn("[say=risha]Wanna repeat that?[/say]")

		saynn("You notice her cock still being mostly hard and twitching so you shake your head. Her cum slowly oozes down your cheeks and drips from the chin.")

		# (if no pay)
		if(!gotPayed):
			saynn("[say=risha]That’s better. No credits for you, I already gave you some. Now go clean yourself or whatever, slut.[/say]")

			saynn("[say=pc]Really?..[/say]")

			saynn("You stand up and quickly fix your appearance to the best of your ability.")

		# (if pay)
		else:
			saynn("[say=risha]That’s better. These are your credits. Now go clean yourself or whatever, slut.[/say]")

			saynn("You grab the chip, then stand up and quickly fix your appearance to the best of your ability.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

	if(state == "offer_pussy"):
		# (needs pussy)
		playAnimation(StageScene.SexAllFours, "sex", {
			pc="risha", npc="pc", 
			bodyState={naked=true,hard=true},
			npcBodyState={exposedCrotch=true,},
		})

		saynn("You put your hand over your pussy and begin teasing yourself in Risha’s line of sight. You find your clit and begin rubbing it while producing some cute moans. The lynx seems to be very pent up watching you, already massaging her feline balls.")

		saynn("[say=pc]You’d love to breed this, wouldn’t you~.[/say]")

		saynn("[say=risha]And who will stop me.[/say]")

		saynn("Suddenly she grabs you by the arms and switches places, bending you over the bench. You don’t even find time to struggle before she masterfully shoves your head under the metal bar while chaining your arms to its heavy rings, creating a makeshift pillory. The bench itself prevents you from closing your legs, you are quickly made helpless!")

		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("Risha {pc.undressMessageS}, leaving you naked and your pussy exposed!")

		saynn("[say=pc]H-hey..[/say]")

		saynn("She then spreads open your slit with her digits and checks how wet you are. Having your arms restrained to this frame brings some discomfort but you also feel quite.. excited. Warm feeling rushes throughout your body while Risha focuses on rubbing your little sensitive clit, you are swaying your hips while your snatch gets wet from your juices.")

		saynn("[say=risha]What an eager whore, I will enjoy breeding you[/say]")

		saynn("Risha doesn’t waste time for too long, she guides her barbed feline cock and presses it against your pussy, its tip sliding up and down along your petals. You arch your back and struggle against the metal bar as the cat’s soft spikes are brushing against your soft flesh.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Even though you are stuck in quite an exposed position and are about to be taken advantage of, you feel very horny, your {pc.cock} is trying to get more erect but it’s still neatly contained behind chastity.")
		elif(GM.pc.hasPenis()):
			saynn("Even though you are stuck in quite an exposed position and are about to be taken advantage of, you feel so horny, your {pc.cock} is getting hard.")

		saynn("Risha gets some of your juices and rubs them into her cock and then, without much more preparation, buckles her hips forward, forcing her barbed member to penetrate your {pc.pussyStretch} pussy hole and stretch it open enough to shove the tip inside. You arch your back more and let out a moan as she roughly pushes her cock deeper, her spikes raking at your soft inner walls.")
#ACEPREGEXPAC - V2 - More Preg Risha lines
		if(getCharacter("risha").isHeavilyPregnant()):
			saynn("The weight of Risha's large expecting belly rests on your ass as she bottoms out inside your pussy.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("You feel your useless cock leaking behind the chastity cage, being fucked by a tall lynx makes you so aroused.")
		elif(GM.pc.hasPenis()):
			saynn("You feel your neglected cock leaking, being fucked by a tall lynx makes you so aroused.")


		saynn("[say=pc]Fuck.. So rough.[/say]")

		saynn("[say=risha]See, you, inmates, are so easy to handle.[/say]")

		saynn("Risha shoves her cock balls deep down your fuckhole, smashing the cervix, before retracting just enough to not pull out completely. She gives your butt a firm smack, causing you to moan and clench, before thrusting deep again, easily pushing through your attempts at resistance, a high amount of lube and precum help her to rail you harder. Risha quickly picks up the pace,the way her barbed member pounds at the natural barrier makes you roll up your eyes and moan passionately.")

		saynn("[say=risha]Oh yeah, I know you love it. Each whore of this station was on this cock, zero complaints so far.[/say]")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your {pc.cock} is leaking more and more precum, the way her thick shaft fucks you sends shivers down your spine and makes both your member and your pussy pulse. You feel like you won’t be able to endure this for long.")

		saynn("Each time Risha rams her cock inside you she hits your g-spot, sending a huge amount of pleasure through your body, sure amount of it slowly making your mind hazy. You stick your tongue out and moan more often.")

		saynn("You feel like you are about to cum, your pussy hole is getting tighter around the cat’s cock and she feels it. She only increases her pace, basically ravaging your stretched fuckhole, using her precum and your female juices as lube.")

		saynn("[say=risha]Ready to carry my kittens, whore?[/say]")

		saynn("Your eyes begin to roll up on their own..")

		addButton("Cum", "The orgasm overtakes your body", "cumVaginal")

	if(state == "cumVaginal"):
		playAnimation(StageScene.SexAllFours, "fast", {
			pc="risha", npc="pc", 
			pcCum=true, npcCum=true,
			bodyState={naked=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true,},
		})
		
		saynn("You begin to trash against the restraints and make loud pleasure noises, your whole body squirms and shivers as you struggle to stay still. Though Risha’s hands hold your ass nice and tight, she keeps shoving her cock in and out even through your climax. Your fuckhole got so overstimulated that you squirt juices all over the bench.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your member desperately tries to get hard but the chastity cage is being very mean to you and prevents all of that. It didn’t take long for your {pc.cock} to start leaking weak lines of {pc.cum} onto the bench and floor. She really drains you, even during your wet orgasm she pounds at your pleasure spot until there is nothing left in your balls.")
		elif(GM.pc.hasPenis()):
			saynn("It didn’t take long for your {pc.cock} to start shooting strong lines of {pc.cum} onto the bench and the floor. She really drains you, even during your orgasm she pounds at your pleasure spot, causing your cock to erupt with more {pc.cum} until there is nothing left in your balls.")

		saynn("[say=risha]Did my little fuckdoll cum already? Oh, what a shame. Now it’s my turn.[/say]")

		saynn("And she wasn’t kidding, even as your inner walls try to close around her shaft, she keeps fucking your slit, thrusting slow but putting full force into each one, your cervix getting softer and eventually getting penetrated, causing you to have another spike of pleasure. You feel her barbs hardening, they catch onto your soft insides and scrape on them, preventing Risha from pulling out. She starts to groan, her cock throbbing and pulsating as it shoots wave after wave of hot cum directly into your womb! Your belly starts to look inflated as she fills you to the brim. She stuffs you so much that some cum already starts to leak.")

		saynn("Eventually you both come down from your orgasms but your body still shivers on its own. Risha’s barbs soften up so she pulls her messy cock out, leaving your used fuckhole to gape and leak cum at a high rate.")

		saynn("Risha quickly catches her breath and admires the view.")

		# (if not pay)
		if(!gotPayed):
			saynn("[say=risha]You are a great fuck. But I already paid you this week, can’t have you spoiled. Sorry fucktoy~.[/say]")

			saynn("[say=pc]Huh?.. H-hey..[/say]")

			saynn("Risha quickly unchains you from the bar, causing you to fall onto the bench.")

			saynn("[say=risha]Now go away, I’m sure some lilac will happily clean up after you.[/say]")

			saynn("With nothing else to do, you quickly gather yourself and stand up, cum still leaking out of you as you awkwardly walk away. Satisfied, though.")

		# (if will pay)
		else:
			saynn("[say=risha]You are a great fuck. There you go, you earned it.[/say]")

			saynn("Risha slides a credit chip into your hand and then quickly unchains you from the bar, causing you to fall onto the bench.")

			saynn("[say=risha]Now go away, I’m sure some lilac will happily clean up after you.[/say]")

			saynn("With nothing else to do, you quickly gather yourself and stand up, cum still leaking out of you as you awkwardly walk away. Satisfied, though.")

		addButton("Continue", "Time to go", "endthescene")
		# (scene ends)
		
		

	if(state == "fuck_risha"):
		# (needs cock and strength)
		playAnimation(StageScene.SexAllFours, "sex", {
			pc="pc", npc="risha", 
			npcCum=true,
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={naked=true,hard=true},
		})

		saynn("[say=pc]I don’t need your credits.[/say]")

		saynn("[say=risha]Well then fuck off, why don’t you.[/say]")

		saynn("You swiftly expose your {pc.cock} and reach for Risha’s neck. The lynx snarls as you put pressure on her throat and pin her to the bench. The lynx instinctevely tries to pry your hands off but you manage to overpower her.")

		saynn("[say=pc]Your pussy will do just fine. Don’t worry, slut. You will cum by the end of this.[/say]")

		saynn("The lynx squirms and struggles, she is clearly not done resisting, her sweaty body is tensing up and tries to shove you away but you get a better grasp and reach for a long chain that connects the barbell to the bench. That chain is long enough for you to wrap around the herm’s paws a few times, rendering them restrained.")

		saynn("[say=risha]F-fuc..ker![/say]")

		saynn("Now that she can’t scratch, bite or punch you, it’s time to get to the business. You let go of her throat, making her cough and breathe heavily as you pull her down along the bench, her chained paws are now above her head and her lower part of the body is fully accessible to you. Risha’s barbed cock is still hard as a rock, her slit hides behind her fluffy balls and seems to be quite wet too, maybe she likes roughness.")

		saynn("You forcefully spread Risha’s legs and keep them parted with your knees as you get a grasp on the herm’s cock and balls and move them out of the way while guiding your own cock towards the guard’s now-exposed slit.")

		saynn("[say=risha]Don’t you dare, bitch.[/say]")

		saynn("[say=pc]What? This?[/say]")

		saynn("And as you say that, you force yourself inside the lynx, your {pc.cock} is spreading the herm’s folds and stretches the hole enough to plop inside. Risha lets out a grunt, she is surprisingly tight for a girl of her height, her wet insides wrap around your shaft very much.")

		saynn("[say=risha]GHh-h..h..[/say]")

		saynn("[say=pc]I’m just helping you take the edge off, shut up and enjoy it, slut.[/say]")

		saynn("You shove your member in until you feel her natural barricade. Then you start pulling out but stop just before retracting the tip and instead ram your dick deep inside her again. Risha lets out another noise as her barbed cock leaks some precum. You start fucking her raw, pounding at her cervix and making sure to hit the pleasure button on the way there. Little moans escape from the tall kitty, moans that she tries to hide, her eyes go from burning with hatred to showing pleasure. She didn’t agree to this but seems like her body betrays her.")

		saynn("[say=risha]F-fuck.. I will throw you into stocks.. when you’re done with me. ah..[/say]")

		saynn("[say=pc]No you won’t. You love this. You will come back for more.[/say]")

		saynn("You catch all of the precum off the tip of her cock and shove your digits into the herm’s mouth. Risha seems surprised at that bold move but it seems she doesn’t plan on biting you. Instead, she starts gently sucking her own precum off of your fingers while you keep thrusting inside her, stretching her wet needy pussy out. Your digits get pulled out and dried against the dickgirl’s cheeks, humiliating her.")

		saynn("You bend forward and support yourself off of the bench while picking up the pace. Risha’s hard cock gets trapped between your bodies, rubbing against them while you slide your hips back and forth. It only takes a few more seconds before Risha suddenly lets out a loud moan and cum, her cock starts shooting cum onto her own breasts and belly, her pussy tenses around your shaft even more and squirts, her body wants to create an arch but you keep her pinned to the bench.")

		saynn("[say=risha]Ahh-h.. fu-u-uck..[/say]")

		saynn("That needy cunt quickly makes you reach your own peak, you feel like you’re about to cum too. And Risha feels that.")

		saynn("[say=risha]N-not.. inside.[/say]")

		addButton("Cum inside", "Stuff her womb full of your cum", "cum_inside_risha")
		addButton("Pull out", "You’d rather be safe", "pull_out_on_risha")


	if(state == "cum_inside_risha"):
		playAnimation(StageScene.SexAllFours, "fast", {
			pc="pc", npc="risha", 
			pcCum=true,
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={naked=true,hard=true},
		})
		
		saynn("[say=pc]Prepare.. to receive.. my load..[/say]")

		saynn("You grunt and shove your {pc.cock} as deep as Risha’s pussy allows, you break into her womb and start filling it up with your {pc.cum}. The lynx moans and struggles against her chains, her eyes show a mixture of pleasure and regret. A little bump appears on her lower part of the belly, that amount of {pc.cum} is too much for her so some is already leaking back out of her stuffed slit and creating a mess on her thighs.")

		# (if risha not visibly pregnant)
		if(!getCharacter("risha").isVisiblyPregnant()):
			saynn("[say=risha]That will get me p-pregnant, you fucker![/say]")

		# (else)
		else:
			saynn("[say=risha]Fuck![/say]")

		saynn("You ride the rest of your orgasm and flop on top of Risha, resting with your member still inside her pussy.")

		saynn("[say=pc]Shut up. You loved it.[/say]")

		saynn("You slowly pull your messy cock out and watch how the herm’s used cunt is already leaking some of the load back. As you prepare to leave, you catch Risha’s concerned eyes. She rattles the chain and tries to free her paws but can’t.")

		saynn("[say=risha]Hey! Fucker! You forgot something![/say]")

		saynn("[say=pc]No I didn’t~[/say]")

		saynn("Risha rolls her eyes and throws her head back, it’s like she accepted her fate.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "pull_out_on_risha"):
		playAnimation(StageScene.SexAllFours, "tease", {
			pc="pc", npc="risha", 
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={naked=true,hard=true},
		})
				
		saynn("You grunt as the orgasm overwhelms you but manage to pull out the moment before your {pc.cock} throbs and shoots out many strings of {pc.cum}, the first one hitting the girl’s outer pussy lips with the rest landing on her tits and belly. Risha now looks quite messy, covered in two layers of cum.")

		saynn("[say=risha]You fucker..[/say]")

		saynn("[say=pc]Shut up. You loved it.[/say]")

		saynn("You take a step back and admire the view of a messy herm, her cock is still hard and leaking. As you prepare to leave, you catch Risha’s concerned eyes. She rattles the chain and tries to free her paws but can’t.")

		saynn("[say=risha]Hey! Fucker! You forgot something![/say]")

		saynn("[say=pc]No I didn’t~[/say]")

		saynn("Risha rolls her eyes and throws her head back, it’s like she accepted her fate.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

func _react(_action: String, _args):

	if(_action in ["offer_pussy", "offer_ass", "offer_handjob"]):
		var lastDay = getModuleFlag("GymModule", "Gym_RishaLastDayGotPaid", -10)
		var currentDay = GM.main.getDays()
		if(currentDay >= (lastDay + 7) ):
			gotPayed = true
			setModuleFlag("GymModule", "Gym_RishaLastDayGotPaid", currentDay)
		else:
			gotPayed = false
			
	if(_action in ["cumAnal", "make_her_cum", "cumVaginal"]):
		if(gotPayed):
			GM.pc.addCredits(5)
		GM.main.addRoomMemoryCurrentLoc("You notice some cum stains on one of the benches", 2)

	if(_action in ["cum_inside_risha", "pull_out_on_risha"]):
		GM.main.addRoomMemoryCurrentLoc("You notice some cum stains on one of the benches, a reminder of the fun time you had with Risha", 2)

	if(_action == "cum_inside_risha"):
		getCharacter("risha").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("risha")
		GM.pc.addSkillExperience(Skill.SexSlave, 50, "risha_gymfuck")
	
	if(_action == "pull_out_on_risha"):
		GM.pc.orgasmFrom("risha")
		GM.pc.addSkillExperience(Skill.SexSlave, 60, "risha_gymfuck")
	
	if(_action == "cumAnal"):
		GM.pc.orgasmFrom("risha")
		GM.pc.gotAnusFuckedBy("risha")
		GM.pc.cummedInAnusBy("risha")
		GM.pc.addSkillExperience(Skill.SexSlave, 50, "risha_gymfuck")
	
	if(_action == "make_her_cum"):
		GM.pc.gotThroatFuckedBy("risha")
		GM.pc.cummedInMouthBy("risha")
		GM.pc.cummedOnBy("risha")
		GM.pc.addSkillExperience(Skill.SexSlave, 10, "risha_gymfuck")
	
	if(_action == "cumVaginal"):
		GM.pc.orgasmFrom("risha")
		GM.pc.gotVaginaFuckedBy("risha")
		GM.pc.cummedInVaginaBy("risha")
		GM.pc.addSkillExperience(Skill.SexSlave, 50, "risha_gymfuck")
	
	if(_action == "endthescene"):
		processTime(60*60*1)
		
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["gotPayed"] = gotPayed
	
	return data
	
func loadData(data):
	.loadData(data)
	
	gotPayed = SAVE.loadVar(data, "gotPayed", false)

func getDevCommentary():
	return "I needed some repeatable way to encounter Risha so this is that way. Gives you some insight into Risha. Yeah, she is a horny bitch. But maybe she is slightly more than that? Naaaah x3"

func hasDevCommentary():
	return true
