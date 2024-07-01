extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ForcedChastityOptionalTaviScene"

func taviIsKind():
	return !getFlag("TaviModule.Tavi_IsAngryAtPlayer", false)

func _run():
	
	if(state == ""):
		aimCameraAndSetLocName("medical_confessionary")
		GM.pc.setLocation("medical_confessionary")
		playAnimation(StageScene.HangingSolo, "idle", {bodyState={naked=true}})
		
		saynn("You open your eyes and realize that this is that day again. Dimly-lit room, fancy furniture, an iron hook that your wrists are cuffed to. Looking down you see your own permanent cage. You can’t hide it, you might be kinda excited.")

		saynn("You hear footsteps and some kind of commotion outside. Almost like there is a fight going on.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		addCharacter("tavi")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="eliza"})
		
		saynn("[say=tavi]You’re always lying to get more test subjects.[/say]")

		saynn("You hear Tavi hissing softly as she is being brought into the room with her paws cuffed and on a leash.")

		saynn("[say=eliza]Your DNA is barely resembling anything that is worth doing tests on, Tavi.[/say]")

		saynn("You hear hissing being replaced with deep growling.")

		saynn("[say=tavi]Grr-r..[/say]")

		saynn("Eliza looks Tavi into the eyes.")

		saynn("[say=eliza]One test.. and everything inside you is gonna collapse on itself.[/say]")

		saynn("Tavi frowns and keeps eye contact back. It looked like she was about to explode. But then her expression changes to a more calm and even slightly kind one. Tavi's tone is so cunning.")

		saynn("[say=tavi]But if I die, you will get thrown behind bars. Inmates will love their new toy.[/say]")

		saynn("Now it's the doctor's turn to frown and growl. It feels like you’re about to see a catfight when Tavi finally notices you and your cage.")

		# (if kind)
		if(taviIsKind()):
			saynn("[say=tavi]Forget that. Why is {pc.he} here?[/say]")

		# (else)
		else:
			saynn("[say=tavi]Forget that. What is {pc.he} doing here?[/say]")

		saynn("[say=eliza]You two know each other?[/say]")

		saynn("[say=tavi]Perhaps? Saw them once or twice. Can I get uncuffed yet?[/say]")

		saynn("Tavi seems to pretend to not know you very well and you decide to play along. Eliza holds Tavi on a short leash. The tall cat is not happy about that obviously but lets Eliza guide her into the middle of the room.")

		saynn("[say=eliza]Not unless I get a few promises.[/say]")

		saynn("[say=tavi]That kind of trade seems a little one-sided, don’t you think?[/say]")

		saynn("[say=eliza]You’d rather get shocked unconscious and shoved into a padded cell?[/say]")

		saynn("[say=tavi]Pff-f. What do you want?[/say]")

		saynn("Eliza unclips the leash from Tavi’s collar and then takes a spot behind her before uncuffing her hands. Tavi stands still, eyeing you and the room out.")

		saynn("[say=eliza]Well, this patient here is going through a little experiment.[/say]")

		saynn("[say=tavi]You want me to fuck {pc.him} in the butt?[/say]")

		saynn("[say=eliza]And your.. huh? How did you knew?[/say]")

		saynn("[say=tavi]{pc.He} {pc.isAre} bound and naked. Room looks like some kind of sex dungeon. If you’re not gonna explain anything I’m gonna theorize.[/say]")

		saynn("Eliza huffs.")

		saynn("[say=tavi]Most importantly your little prisoner here looks a lot like a buttslut with that cute cage on. So what do I get?[/say]")

		saynn("Eliza rolls her eyes. She then reaches to open a bulky crate that is left on the sofa, revealing its contents consisting of all sorts of dildos and strapons. Tavi looks surprised by the size of some of them.")

		saynn("[say=eliza]You will get satisfaction.[/say]")

		saynn("Tavi looks at the toys. And then at you. You can’t help but to blush seeing her cunning smile.")

		# (if kind)
		if(taviIsKind()):
			saynn("[say=tavi]You know what. Sure. I will gladly dominate {pc.him} my way, make that cutie squirm and beg.[/say]")

		# (else)
		else:
			saynn("[say=tavi]Huh. You know what. I will gladly dominate {pc.him}, settle some minor disagreements we had with each other.[/say]")

		saynn("Eliza chuckles and just takes a seat on the fancy chair.")

		addButton("Continue", "See what happens next", "givetavistrapon")

	if(state == "givetavistrapon"):
		# (Tavi receives a horsecock strapon)
		addCharacter("tavi", ["naked"])
		playAnimation(StageScene.HangingDuo, "idle", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})

		saynn("Tavi goes through the crate of toys and seemingly picks.. the biggest one that it has. A horsecock strapon that is at least the size of your arm. Even seeing it sway around in Tavi’s paws makes you clench your pucker.")

		saynn("[say=tavi]Go big or go home~.[/say]")

		saynn("She sets it aside for a second and begins undressing. As Tavi takes off her shirt you notice her careful nipples being of the same bright green color as the random spots on her fur. As she takes off her shorts, you see that her neat tight-looking slit has the same color as well. Tavi grabs the strapon and puts it on her crotch, the leather harness is sturdy enough to hold the flared shaft straight.")

		saynn("After making sure everything is secured, Tavi looks at your face and smiles, she smiles pretty much constantly as she approaches you.")

		saynn("[say=tavi]So. My little friend. How about we kick off this little interaction with you addressing me correctly. I prefer Miss Tavi.[/say]")

		saynn("She traps her horsecock between the two bellies and moves her hips slightly, letting you feel its weight. Your caged member looks so small compared to it. You’re just realizing how helpless you are in this situation.")

		# (Options are Miss Tavi and Stay silent)

		addButton("Miss Tavi", "Say it", "miss_tavi")
		addButton("Stay silent", "You don’t wanna humiliate yourself like that", "stay_silent")


	if(state == "miss_tavi"):
		saynn("[say=pc]Miss Tavi..[/say]")

		saynn("Tavi purrs as she hears that, she reaches out to pull on your cheek with her paw.")

		saynn("[say=tavi]That’s what I wanna hear, little precious toy~. Now let me get some of that..[/say]")

		saynn("She unceremoniously forces a few digits into your mouth and makes you lick them. She gathers some of your saliva that way and then spreads it over her newly acquired shaft. Tavi also coats the flared tip with actual lube.")

		saynn("[say=tavi]I was thinking of going gentle on you. But I think you want exactly the opposite~. You love when there is a strong heel pinning your head to the floor, don’t you.[/say]")

		saynn("She grabs her cock and instead guides between your thighs, letting your balls rest on it. Tavi smirks.")

		saynn("[say=tavi]You love serving, pleasing. And I love being pleased~. This is what good pets will be getting in return.[/say]")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "stay_silent"):
		saynn("You stay silent, not dropping a word.")

		saynn("Tavi tilts her head to the side slightly, staring at you and your lips from an angle.")

		saynn("[say=tavi]You should know that I always get what I want. Eventually.[/say]")

		saynn("She grabs you by the chin and forces eye contact.")

		saynn("[say=tavi]You know what happens to disobeying pets?[/say]")

		saynn("She grabs the shaft of her cock with her free paw and then gently smacks your balls with it. Ow, it feels like everything inside you has just shrunk. Tavi catches you wincing and forces eye contact again.")

		saynn("[say=tavi]Punishments.[/say]")

		saynn("She grabs you by the cheek and tugs on it, exposing some of your teeth.")

		saynn("[say=tavi]Open your mouth. Or I will do it again. My relationships are built only on brutal honesty.[/say]")

		saynn("Realizing that you might still need your balls, you decide to obey and part your lips slightly. Tavi then unceremoniously forces a few digits into your mouth and makes you lick them. She gathers some of your saliva that way and then spreads it over her newly acquired shaft. Tavi also coats the flared tip with actual lube.")

		saynn("[say=tavi]You need to learn a lesson it seems. And it just so happens that I have a good teaching tool now.[/say]")

		saynn("Tavi holds her shaft between your thighs, just letting your balls rest on it. She smirks.")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		playAnimation(StageScene.HangingSex, "tease", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		
		saynn("After teasing you enough, Tavi circles you and ends up behind, her paws tracing your {pc.masc} curves before landing on your cage.")

		saynn("[say=tavi]This is fun, you should keep it~. Unless you’re stuck with it forever. A symbol of your devotion.[/say]")

		saynn("Tavi leans towards your ear while letting you feel the flared tip of her strapon spreading your buttcheeks.")

		saynn("[say=tavi]Then you will have to obey me just to be able to cum~.[/say]")

		saynn("Tavi catches doctor Quinn’s gaze.")

		saynn("[say=tavi]And others who have a cock, of course~.[/say]")

		saynn("Tavi leans towards your ear again and whispers this time to make sure Eliza can’t pick up on it.")

		# (if kind)
		if(taviIsKind()):
			saynn("[say=tavi]Afraid we have to play along, cutie. Try to enjoy it.[/say]")

		# (else)
		else:
			saynn("[say=tavi]You will regret crossing me.[/say]")

		saynn("And with that, she guides her rubber cock towards your little {pc.analStretch} star. The flared flat tip finds it and already begins to put pressure on it. It's big, so big that just the act of it stretching your hole is making you moan and throw your head back. Tavi catches your hair and makes you stay like that, with your back arched.")

		saynn("[say=tavi]Relax, cutie~. You have to give in.[/say]")

		saynn("She puts more and more pressure on your pucker, which combined with the lube causes it to start making progress. As soon as Tavi feels that the head of her cock is inside you, she thrusts forward with her hips, causing the rubber shaft to forcibly spread your soft inner walls. She doesn’t feel anything but she sees you squirming and shivering around her cock as the fat girth of that toy is pushing on your pleasure spot non-stop.")

		saynn("[say=pc]NGhh-h..[/say]")

		saynn("[say=tavi]Wasn’t so hard~. I can get used to doing this. Can I keep it?[/say]")

		saynn("Eliza rolls her eyes again. Tavi chuckles while your caged member is already visibly leaking.")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "continue3"):
		playAnimation(StageScene.HangingSex, "sex", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		
		saynn("Tavi lets go of your hair and gets a better grasp on your body, holding onto your {pc.masc} hips while she proceeds to pull out and then thrust inside again, leaving some empty space and then stuffing it again, trying to shove her rubber member slightly deeper. You’re completely helpless under Tavi’s onslaught, all you can do is rattle your chains and clench your butt but the last one only makes it feel even more pleasurable, your locked dick is desperately trying to get hard but quickly meets the metal and is forced to stay limp.")

		saynn("[say=tavi]You’re so easy to handle with this thing, pet.[/say]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Tavi slowly picks up the pace, she clearly never had a dick between her legs before but she seems to be a quick learner, already going so fast that you feel her fake balls slapping against your wet pussy slit.")

		# (else)
		else:
			saynn("Tavi slowly picks up the pace, she clearly never had a dick between her legs before but she seems to be a quick learner, already going so fast that you feel her fake balls slapping against your taint.")

		saynn("You can’t stay silent while your butt is being pounded but a horsecock, more lusty noises escape from your lips, your whole body shifts forward and then meets Tavi’s shaft, almost involuntary helping her to rail you. You feel pressure rising behind your metal chastity cage..")

		saynn("[say=tavi]Now. I wanna hear you beg for it. You don’t get to cum without my permission, pet.[/say]")

		# (Options are Beg and Just cum)

		addButton("Beg", "Give it your all", "beg")
		addButton("Just cum", "You’re not gonna humiliate yourself!", "just_cum")


	if(state == "beg"):
		playAnimation(StageScene.HangingSex, "fast", {npc="tavi", pcCum=true, bodyState={naked=true}, npcBodyState={naked=true}})
		
		saynn("You’re getting close and at this point you really wanna cum. You part your lips and begin begging Tavi in between all your other noises.")

		saynn("[say=pc]Please.. Let me cum.. I really want to, I will do anything..[/say]")

		saynn("Tavi holds onto your hair again, threatening to yank on it while she speeds up even more, making your butthole make wet noises while she pounds it.")

		saynn("[say=tavi]Oh yeah? Then you will surely address me correctly first, right?[/say]")

		saynn("The way she fucks you now, you feel all your thoughts slipping away, replaced with desire to let the climax happen. You’re melting, only focusing on her flared cock smashing your prostate and milking it for all its fluids.")

		saynn("[say=pc]Sorry, Miss Tavi.. Please allow me to cum, I’m begging you, Miss Tavi..[/say]")

		saynn("You hear Tavi’s low-pitched purring near your ear as she playfully nips it.")

		saynn("[say=tavi]Yes, be a good pet for me and cum from my cock~.[/say]")

		saynn("She pounds your ass as fast as your clenching butt allows, her words send shivers down your spine, you let your tongue roll out and drool while thanking her.")

		saynn("[say=pc]T-thank you, thank you Miss Tavi..[/say]")

		saynn("The pressure in your cage rises to the point of no return, your poor locked away member begins to suddenly leak {pc.cum} instead of prostate fluids. You can’t stop cumming, your seed flows from the tip of your cage pretty much constantly while Tavi continues to thrust her rubber horsecock inside you, its flared tip reaching super deep while the fat ring near the base is massaging your spot.")

		# (if kind)
		if(taviIsKind()):
			saynn("[say=tavi]Ye-es, you’re very welcome, my pet.[/say]")

		# (else)
		else:
			saynn("[say=tavi]You act stupid sometimes but you have it in you. You’re welcome, pet.[/say]")

		addButton("Continue", "See what happens next", "continue4")

	if(state == "just_cum"):
		playAnimation(StageScene.HangingSex, "tease", {npc="tavi", pcCum=true, bodyState={naked=true}, npcBodyState={naked=true}})
		
		saynn("She humiliated you enough so you go against what she orders you and keep quiet. Well, as quiet as you can with a giant horsecock strapon up your butt.")

		saynn("Tavi seems to trust you though, she holds onto your hair again while she speeds up even more, making your butthole make wet noises while she pounds it.")

		saynn("[say=tavi]I’m not hearing anything~.[/say]")

		saynn("The way she fucks you now, you feel all your thoughts slipping away, replaced with desire to let the climax happen. You’re melting, only focusing on her flared cock smashing your prostate and milking it for all its fluids.")

		saynn("[say=tavi]Almost like someone wants to be sneaky~.[/say]")

		saynn("You hear Tavi’s low-pitched purring near your ear as she playfully nips it. She might be right but she still pounds your ass as fast as your clenching butt allows, her words send shivers down your spine, you let your tongue roll out and drool.")

		saynn("The pressure in your cage rises to the point of no return, your poor locked away member begins to suddenly leak {pc.cum} instead of prostate fluids. Tavi feels that and suddenly stops thrusting completely, instead retracting the horsecock out of your butt. That means you lost the only source of pleasure. Your powerful orgasm is now nothing more but a ruined one, you keep squirming and thrashing against the chains while Tavi smacks your butt for being so naughty. Your cage does leak some seed but you feel zero pleasure from that.")

		saynn("[say=tavi]Gonna be a lesson for you, pet. You can’t trick me.[/say]")

		addButton("Continue", "See what happens next", "continue4")

	if(state == "continue4"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Tavi pulls away from you and takes off the strapon harness before directing her attention to Eliza.")

		saynn("[say=tavi]There you go. Maybe you want some too, doctor? You were watching this whole time, must be horny.[/say]")

		saynn("[say=eliza]Pff. I was watching to make sure you don’t do anything stupid.[/say]")

		saynn("Tavi smiles and starts putting on her uniform. All the while you are left a wet mess with your tailhole struggling to close up after such a huge toy.")

		saynn("[say=tavi]I handled this perfectly, see.[/say]")

		saynn("[say=eliza]Anyone can use the horsecock in the bluntest way possible.[/say]")

		saynn("[say=tavi]You think that’s all I did?[/say]")

		saynn("Eliza shrugs and lets Tavi out of the room. Now you two are alone.")

		saynn("[say=eliza]Well, that was something.[/say]")

		saynn("Eliza reaches out to uncuff your wrists. You fall onto all fours as your legs feel like jello.")

		saynn("[say=eliza]That was more than something.[/say]")

		saynn("She helps you to get up and then hands you your belongings before letting you out of the room too.")

		saynn("[say=eliza]I will tell somebody to clean up. See you next time~[/say]")

		# (scene ends)

		addButton("Continue", "That was something", "endthescene")
		


func _react(_action: String, _args):
	if(true):
		processTime(RNG.randi_range(3,8)*60)

	if(_action == "givetavistrapon"):
		var tavi = getCharacter("tavi")
		tavi.getInventory().removeItemFromSlot(InventorySlot.UnderwearBottom)
		tavi.getInventory().equipItem(GlobalRegistry.createItem("StraponHorse"))

	if(_action == "endthescene"):
		endScene()
		getCharacter("tavi").resetEquipment()
		return
		
	if(_action == "continue3"):
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 35)
		
	if(_action == "beg"):
		GM.pc.orgasmFrom("tavi")
		
	if(_action == "just_cum"):
		GM.pc.addLust(100)
		
	if(_action in ["stay_silent", "just_cum"]):
		increaseFlag("MedicalModule.Chastity_OptionalBadBehavourCounter")

	
	setState(_action)

func getDevCommentary():
	return "Tavi is fun to write. Tavi is kinda my dominant side just concentrated in one character. With some weaknesses sprinkled on top x3. She will act smart but if she can see that she isn't fooling anyone - why embarrass yourself. Just try to get the best out of the situation you are given. That's basically Tavi."

func hasDevCommentary():
	return true
