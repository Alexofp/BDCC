extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AxisLostToScene"

func _run():
	if(state == ""):
		addCharacter("axis")
		playAnimation(StageScene.Duo, "kneel", {
			npc="axis", npcAction="stand", 
			bodyState={exposedCrotch=true,},
			npcBodyState={exposedCrotch=true,hard=true},
		})

	if(state == ""):
		saynn("Unable to continue fighting, you drop to your knees. Fuck, that alpha energy was just too strong. Axis takes his time approaching you.")

		saynn("[say=axis]You did your best, right? It just wasn’t enough. Don’t worry, I won’t be too rough.[/say]")

		saynn("You are obviously aren’t too happy that you lost.")

		saynn("[say=pc]Oh yeah? I think you were rough while fucking your ego, it’s so inflated.[/say]")

		saynn("He chuckles audibly at your joke, what a light-hearted guy.")

		addButton("Get fucked", "See what happens next..", "get_fucked")
		GM.ES.triggerRun("ArenaFighterPCLost", ["axis"])

	if(state == "get_fucked"):
		playAnimation(StageScene.SexStanding, "sex", {
			npc="pc", pc="axis", 
			pcCum=true, npcCum=true,
				bodyState={exposedCrotch=true,hard=true},
				npcBodyState={exposedCrotch=true,caged=true},
		})
		
		saynn("Axis pulls his shorts down, exposing his giant red cock, it must be at least {axis.penisSizeStr}. Its knot is already fat, filled with blood, and the tip is actively leaking precum, the audience is cheering loudly seeing that heavy tool. You don’t get enough time to react to that sudden introduction, the wolf grabs you by the collar and pulls your head straight towards his shaft, your nose is pressed against the wet meaty orb, making you smell his scent. It’s.. arousing.. Unusually so. As soon as you got a taste of his alpha scent, your mind got instantly attacked with his pheromones, causing you to act so subby.. and needy.")

		saynn("Your eyes show desire, you eagerly stick your tongue out and drag it along the lengthy knotted cock. Then you catch the precum off of its pointy tip and swallow it, feeling even more lusty after that.")

		saynn("[say=axis]Look at you, breathing in my knot. Yeah, use that tongue, like a good kitty would.[/say]")

		saynn("He lets you tease his cock until it’s throbbing before putting a hand on the back of your head and directing you to take his shaft into your mouth. You eagerly obey and part your lips, letting that giant lollipop in while still dragging your tongue along its length. It quickly hits the back of your mouth but the guy is not satisfied yet, he applies more pressure, forcing his cock to go down your throat until the knot slaps against your lips. The size of that cock causes you to gag and struggle but that only makes him and the audience more happy.")

		saynn("He slowly face-fucks you, pulling his cock out of your throat just to ram it even deeper the next time. And your mind wants it, you eagerly drag your tongue over the veiny shaft while he uses your mouth and throat for his pleasure. After a few strong thrusts, he pulls it out completely and plops it onto your face, there is a visible string of saliva hanging between your mouth and the tip of that beautiful cock. You go cross-eyed while looking at it with your tongue out.")

		saynn("[say=axis]Don’t wanna get too excited and knot your mouth. Let’s move on~[/say]")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("He pulls his cock away from your face and tugs you up by the collar. He then {pc.undressMessageS}, leaving you naked with your privates exposed!")

			saynn("[say=axis]No need for your clothes to get messy.[/say]")

		# (if naked)
		else:
			saynn("He pulls his cock away from your face and tugs you up by the collar. Axis takes a good look at your exposed privates.")

			saynn("[say=axis]All ready for me already, good.[/say]")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("He notices that you’re wearing a chastity cage on your {pc.cock} and smiles.")

			saynn("[say=axis]Such a cute useless dick you have there. I would have locked it away myself if that wasn’t already the cage.[/say]")

			saynn("Oh, you feel like you should be resisting. But.. You’re so horny that you don’t even care, you actually welcome him rubbing your chastity cage a bit. It makes your member put so much pressure onto the cage.. While it’s forcing your drippy cock to stay flacid.")
		elif(GM.pc.hasPenis()):
			
			saynn("He notices your erect {pc.cock} and smiles. He then pulls out something from one of his pockets. It’s a.. chastity cage.")

			saynn("[say=axis]That cute dick is useless, might as well lock it away.[/say]")

			saynn("Oh, you feel like you should be resisting. But.. You’re so horny that you don’t even care, you actually welcome him forcing your cock into a small pink cage before attaching a padlock and locking it. So much pressure.. The cage is forcing your drippy cock to be flacid.")

			# (end cock)

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Axis doesn’t waste any more time, he pulls you closer to the nearest fence before turning you away from him and putting his arm under your leg and raising it, giving the crowd a great view of your juicy needy slit. You hold this position for him while he instead puts both his arms under your armpits and raises you off the floor before directing you onto his giant cock. Your feet are not touching the floor, his canine member pierces your slit with ease and then gets forced deeper inside you! A lusty moan escapes from your lips while the alpha has you his way.")

			saynn("There is barely enough space inside you for him but he doesn’t care, he starts moving his hips while using his grasp on you to fuck you hard and deep, your cervix is smashed every time he thrusts inside, causing you to open your mouth and start drooling. That is when he leans his head closer to yours and forces a deep kiss, pushing his tongue inside your mouth and rubbing it against yours, exhaching saliva. Fuck, you feel completely helpless under his onslaught, the audience is cheering him to breed you like the slut that you are. A few more thrusts and you start having your first orgasm, your g-spot got so stimulated by his cock that your pussy began squirting out your juices, your cervix becomes softer and then gets broken into, causing a second pleasure spike, your body is shaking while you’re desperately moaning into the alpha’s mouth.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your locked-away cock shoots a weak string of {pc.cum} indicating that you came completely hands-free. The audience is happy to see such an eager sissy.")

			saynn("He pulls his tongue out and replaces it with a few fingers, letting you suck on them while he picks up the pace, shoving his shaft in and out at a crazy rate, your poor {pc.pussyStretch} pussy is forced to stretch so much to accommodate for his size. The only thing that’s stopping him is the fat red knot that is unable to fit inside you. The guy is panting into your ear, he clearly enjoys fucking you.")

			saynn("[say=axis]Mhmh-h. You’re tight. But that won’t stop me.[/say]")

			saynn("He gets a better grasp on you and starts going for depth, doing slow powerful thrusts while trying to squeeze his orb inside. Your stretched pussy lips are gradually getting stretched even more, there is a visible bump on your belly each time he breaks into your cervix.")

			saynn("[say=pc]Y-you’re not g-gonna.. ah-h-h..[/say]")

			saynn("He decides to not answer verbally, he instead pulls his cock almost fully out, gathering all the strength while leaving lots of empty space inside you. One last huge push and he manages to knot you, his whole giant cock gets shoved inside you while the orb traps it inside. It’s just too much, your legs and arms start shaking, your mouth drops a moan after another, you’re squirming before the orgasmic waves overtake your body again, your pussy clenches around that huge rod and squirts at the fence before you, your mind is betraying you while drowning in the sea of ecstasy.")

			saynn("All the while the guy himself gets pushed over the edge too, he grunts and locks his arms around your neck while his canine cock starts shooting liters of cum directly into your womb, instantly overfilling it. But the knot prevents any leakage, you’re forced to be his eager cum dumpster, his breeding bitch, your belly quickly starts to look inflated.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your locked cock shoots {pc.cum} again. And again. Each time a little string of your fluids escapes from the cage, it looks very cute.")

			saynn("Even though the guy’s orgasm ends, yours doesn’t, you keep squirming with his cock inside as more orgasmic waves overtake your body and mind.")

			saynn("[say=axis]Wow, how many times are you gonna cum. You’re stuck there for a while. If your pussy continues to clench so much I might cum again~.[/say]")

			saynn("The crowd goes wild seeing you fucked and bred. All the while you can’t stop moaning like a slut.")

		# (if NO pussy)
		else:
			saynn("Axis doesn’t waste any more time, he pulls you closer to the nearest fence before turning you away from him and putting his arm under your leg and raising it, giving the crowd a great view of your private bits. You hold this position for him while he instead puts both his arms under your armpits and raises you off the floor before directing you onto his giant cock. Your feet are not touching the floor, his canine member pierces your tailhole with ease and then gets forced deeper inside you! A lusty moan escapes from your lips while the alpha has you his way.")

			saynn("There is barely enough space inside you for him but he doesn’t care, he starts moving his hips while using his grasp on you to fuck you hard and deep, your pleasure spot is smashed every time he thrusts inside, causing you to open your mouth and start drooling. That is when he leans his head closer to yours and forces a deep kiss, pushing his tongue inside your mouth and rubbing it against yours, exhaching saliva. Fuck, you feel completely helpless under his onslaught, the audience is cheering him to breed you like the slut that you are. A few more thrusts and you start having your first orgasm, your body is shaking while you’re desperately moaning into the alpha’s mouth.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your locked-away cock shoots a weak string of {pc.cum} indicating that you came completely hands-free. The audience is happy to see such an eager sissy.")

			saynn("He pulls his tongue out and replaces it with a few fingers, letting you suck on them while he picks up the pace, shoving his shaft in and out at a crazy rate, your poor {pc.analStretch} fuckhole is forced to stretch so much to accommodate for his size. The only thing that’s stopping him is the fat red knot that is unable to fit inside you. The guy is panting into your ear, he clearly enjoys fucking you.")

			saynn("[say=axis]Mhmh-h. You’re tight. But that won’t stop me.[/say]")

			saynn("He gets a better grasp on you and starts going for depth, doing slow powerful thrusts while trying to squeeze his orb inside. Your stretched anus is gradually getting stretched even more, there is a visible bump on your belly each time he thrusts inside your {pc.masc} ass.")

			saynn("[say=pc]Y-you’re not g-gonna.. ah-h-h..[/say]")

			saynn("He decides to not answer verbally, he instead pulls his cock almost fully out, gathering all the strength while leaving lots of empty space inside you. One last huge push and he manages to knot you, his whole giant cock gets shoved inside you while the orb traps it inside. It’s just too much, your legs and arms start shaking, your mouth drops a moan after another, you’re squirming before the orgasmic waves overtake your body again, your tailhole clenches around that huge rod and squirts at the fence before you, your mind is betraying you while drowning in the sea of ecstasy.")

			saynn("All the while the guy himself gets pushed over the edge too, he grunts and locks his arms around your neck while his canine cock starts shooting liters of cum down your ass, instantly overfilling it. But the knot prevents any leakage, you’re forced to be his eager cum dumpster, his breeding bitch, your belly quickly starts to look inflated.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your locked cock shoots {pc.cum} again. And again. Each time a little string of your fluids escapes from the cage, it looks very cute.")

			saynn("Even though the guy’s orgasm ends, yours doesn’t, you keep squirming with his cock inside as more orgasmic waves overtake your body and mind.")

			saynn("[say=axis]Wow, how many times are you gonna cum. You’re stuck there for a while. If your ass continues to clench so much I might cum again~.[/say]")

			saynn("The crowd goes wild seeing you fucked and bred. All the while you can’t stop moaning like a slut.")

		addButton("Continue", "See what happens next..", "continue")

	if(state == "continue"):
		playAnimation(StageScene.SexStanding, "tease", {
			npc="pc", pc="axis", 
				bodyState={exposedCrotch=true,hard=true},
				npcBodyState={exposedCrotch=true,caged=true},
		})
		
		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("After some long minutes, the guy’s knot finally deflates enough. He pulls it out, letting your used gaping pussy to gush out cum. Your legs refuse to listen so he carefully places you onto the ground, ass up so everyone can see you leaking.")

		# (if no pussy)
		else:
			saynn("After some long minutes, the guy’s knot finally deflates enough. He pulls it out, letting your used gaping tailhole to gush out cum. Your legs refuse to listen so he carefully places you onto the ground, ass up so everyone can see you leaking.")

		saynn("[say=axis]Such a tight toy.[/say]")

		saynn("He hides his cock and takes a good look at you.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("He then unlocks your cage and takes it off, unleashing the stored pressure and causing your {pc.cock} to throb and shoot out a huge load, draining your balls. The wolf sighs seeing you cum onto his cage.")

			saynn("[say=axis]Mind cleaning up after yourself?[/say]")

			saynn("He moves the messy cage to your mouth and you start eagerly cleaning it with your tongue, licking away any mess and then swallowing it like a good slut. Wolf pets you and puts his cage away.")

		# (end cock)

		saynn("[say=axis]That was a good breeding, come back if you want~.[/say]")

		saynn("And with that, he leaves you alone. Little moans still escape from your mouth, the afterglow feeling is so strong and pleasurable. You don’t even care that the crowd is watching you, they can watch all they want.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "get_fucked"):
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("axis")
			GM.pc.cummedInVaginaBy("axis")
		else:
			GM.pc.gotAnusFuckedBy("axis")
			GM.pc.cummedInAnusBy("axis")
		GM.pc.orgasmFrom("axis")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "axis_getfucked")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

