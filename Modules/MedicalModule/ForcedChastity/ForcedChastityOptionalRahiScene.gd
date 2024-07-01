extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ForcedChastityOptionalRahiScene"

func _run():
	
	if(state == ""):
		aimCameraAndSetLocName("medical_confessionary")
		GM.pc.setLocation("medical_confessionary")
		playAnimation(StageScene.HangingSolo, "idle", {bodyState={naked=true}})
		
		saynn("You open your eyes and realize that this is that day again. Dimly-lit room, fancy furniture, an iron hook that your wrists are cuffed to. Looking down you see your own permanent cage. You can’t hide it, you might be kinda excited.")

		saynn("You hear soft footsteps..")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		addCharacter("rahi")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="rahi", npc="eliza"})
		
		saynn("[say=rahi]Is the leash really necessary..[/say]")

		saynn("[say=eliza]How else am I gonna make sure you don’t run away, patient~.[/say]")

		saynn("[say=rahi]Into space?..[/say]")

		saynn("Eliza and Rahi walk into the room. Doctor turns towards the brown feline and unclips the leash from her collar while she looks around and eventually spots you.")

		saynn("[say=rahi]Oh.. Hi there.[/say]")

		saynn("You nod to the kitty, your privates being exposed cause her to blush and turn away while she obviously-sneakily eyes you out. She seems both surprised and fascinated.")

		saynn("[say=pc]Yeah, hello there kitten..[/say]")

		saynn("Eliza perks her ears.")

		saynn("[say=eliza]You two know each other well? Oh, this will be fun.[/say]")

		saynn("[say=rahi]But.. why is kitty here..[/say]")

		saynn("Eliza grabs the other feline by the shoulder and directs her towards you. She leans in down to her ear and switches to a very soft cunning tone, almost whispering. Rahi doesn’t resist the authoritative touch.")

		saynn("[say=eliza]See {pc.him}? The cage that {pc.he} {pc.isAre} wearing? I want you to help me. Help {pc.him}.[/say]")

		saynn("[say=rahi]Help? But how.. meow..[/say]")

		saynn("She fidgets around a lot. Eliza wraps her paws around the kitty’s belly while whispering more into her ear, very intimate.")

		saynn("[say=eliza]I want you to.. make {pc.him} squirm.. {pc.He} {pc.isAre} locked.. but {pc.his} butt isn’t.. Finger {pc.him}, fuck {pc.him}, pound {pc.his} ass until {pc.he} {pc.isAre} a drooling dripping mess, I don’t care~. Bonus points for making {pc.him} into a true buttslut~. I want {pc.him} to experience everything this kind of lifestyle has to offer. And I want you to help me do that~.[/say]")

		saynn("As Eliza says, a bigger and brighter blush appears on Rahi’s cheeks, her ears droop and fluffy tail wraps around her leg.")

		saynn("[say=rahi]But.. She is always the one on the receiving end.. She doesn’t even have..[/say]")

		saynn("Eliza cuts her off.")

		saynn("[say=eliza]That’s not a problem~.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		saynn("Eliza brings the brown kitty to the sofa that has some kind of box on it. It’s more a crate really, a wide metal crate that takes up almost the whole sofa. Doctor opens it, revealing.. oh so much..")

		saynn("Its contents consist of all sorts of sex toys, strapons and tubes of lube. Rahi looks genuinely surprised and even more embarrassed now.")

		saynn("[say=eliza]C’mon, kitty cat. I’m sure you have something in you.. You know.. Sometimes subs are the best tops. Know why? They know exactly what feels good.[/say]")

		saynn("After that little speech, Rahi has become quiet. You see uncertainty is in her eyes.. as she looks at the contents of the crate. Eventually she makes up her mind and points at something.")

		saynn("[say=rahi]Can she?..[/say]")

		saynn("Eliza nods.")

		saynn("[say=eliza]Of course~.[/say]")

		addButton("Continue", "See what happens to you next", "giverahistrapon")

	if(state == "giverahistrapon"):
		addCharacter("rahi", ["naked"])
		playAnimation(StageScene.HangingDuo, "idle", {npc="rahi", bodyState={naked=true}, npcBodyState={naked=true}})
		
		saynn("Rahi grabs one of the toys. It looks like a dildo.. One that resembles a knotted canine cock, pretty hefty in size too. But after looking at it for longer you realize that it's actually double-sided with one side being shorter and also tilted straight up.")

		saynn("[say=eliza]Ohh, good choice. I love strapless strapons~.[/say]")

		saynn("Kitty is fascinated too. She takes her time undressing her uniform, revealing her comparably modest breasts and a cute pink pussy. This kitten has such girly curves, you can give her that.")

		saynn("Then she brings the feeldoe strapon to her slit and carefully starts to insert it. A little embarrassed moan escapes from her lips as the tip spreads her folds open and slides inside with ease, a little drop of arousal drips down its rubber texture already.")

		saynn("[say=rahi]Mm.. Feels good..[/say]")

		saynn("Rahi holds one paw wrapped around her new fake member and tugs on it slightly, causing more little moans to escape from her lips. Then she grabs a tube of lube and spreads it over her new shaft by giving herself a few very slow strokes. She looks at you, her eyes are still very much shy.")

		saynn("[say=rahi]Do you like it?..[/say]")

		# (Options are yes and no)
		addButton("Yes", "You like how she looks", "yes")
		addButton("No", "That will probably make the kitty very sad", "no")

	if(state == "no"):
		removeCharacter("rahi")
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", bodyState={naked=true}})
		
		saynn("You’re really not a fan so you shake your head. Rahi looks confused. Then she tilts her head down.")

		saynn("[say=rahi]No?.. Um.. but.. uh.. sor.. sorr.. she is..[/say]")

		saynn("Eliza sees what’s happening and quickly hugs the feline again, whispering into her ear.")

		saynn("[say=eliza]C’mon. {pc.He} didn’t mean it. Just do it anyway. {pc.He} will come around. Please, kitty cat.[/say]")

		saynn("But Rahi looks very sad. Her eyes tear up.")

		saynn("[say=rahi]She c-can’t.. sorry.. s-she will go now.. Very sorry..[/say]")

		saynn("She carefully removes the feeldoe strapon and places it on the sofa before grabbing her clothes and scratching at the door, really wishing to be on the other side of it. Eliza sighs and lets Rahi leave. Doctor looks at you, clearly unhappy.")

		saynn("[say=eliza]Look what you did.[/say]")

		saynn("Eliza frowns while looking you into the eyes. You pick up on a slight growling.")

		saynn("[say=eliza]I thought you were ready. I really did.[/say]")

		saynn("She reaches forward and grabs you by the balls. All the while you are completely helpless hanging from the ceiling. She starts applying more pressure onto your orbs, squeezing very tightly to the point of it bringing discomfort. Strangely enough it also makes you leak pre.")

		saynn("[say=eliza]You know what holds me back? I don’t want the cage to slip off. Think about what you did and what you missed.[/say]")

		saynn("After letting some of her rage out, Eliza sighs and finally lets go of your berries, letting you relax somewhat too.")

		saynn("[say=eliza]Anyway. At least you’re still caged. I will see you some other time, inmate.[/say]")

		saynn("And with that, she uncuffs you and throws you out of the confessionary with all your clothing. Rude.")

		# (scene ends)
		addButton("Leave", "Time to think about your behaviour", "badendscene")

	if(state == "yes"):
		playAnimation(StageScene.HangingSex, "tease", {npc="rahi", bodyState={naked=true}, npcBodyState={naked=true}})
		
		saynn("You check out the view some more. A cute shy naked kitty with a lubed up feeldoe strapon is about to peg you.. Of course you like how it looks. You nod.")

		saynn("[say=pc]You look great..[/say]")

		saynn("Eliza chuckles and pats Rahi on the head.")

		saynn("[say=eliza]It’s great that you asked, kitty. But you shouldn’t. Just take what you want from {pc.him}. Enjoy yourself, please~. It will be very obvious when {pc.he} likes it, trust me~.[/say]")

		saynn("After that Eliza just takes a seat and lets Rahi act on her own.")

		saynn("The brown feline slowly approaches you, her rubber strapon meets with your cage. The size difference is insane. It’s quite obvious who’s the alpha here. Rahi silently rubs the tip of her fake cock against your chastity. Then she walks around you and stops behind. One of her paws lands on your side and holds you still.")

		saynn("[say=rahi]You’re a.. slut.[/say]")

		saynn("Ohh. Well it didn’t land as well as she thought it would but A for effort. Her paw gives your {pc.masc} ass a sudden smack before resting on your side again.")

		saynn("[say=rahi]Ow.. She will fuck you now. You hear?.. You.. w-whore..[/say]")

		saynn("She is certainly more mouthy than she usually is. But you’re completely helpless, your {pc.analStretch} hole is exposed for her. Rahi guides her rubber cock towards your star and then suddenly jerks forward, forcing herself inside you! Lubed-up canine strapon stretches your anus with ease and slides inside while its other side shifts inside Rahi, making her blush again.")

		saynn("[say=rahi]Ah..[/say]")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "continue3"):
		playAnimation(StageScene.HangingSex, "sex", {npc="rahi", bodyState={naked=true}, npcBodyState={naked=true}})
		
		saynn("After letting her rubber cock to pierce your fuckhole, Rahi gives you a second to get used to how it feels. It’s not the smallest toy, it’s quite filling even though it’s only about halfway in. You bite your lip and feel your own dick tingling behind the permanent cage.")

		saynn("Kitten places both her paws on your hips and starts pulling out. But before she does, she instead throws her lower body forward again, thrusting deep inside you and smashing your pleasure spot in the process. It feels so unlike normal sex, your whole body wants to squirm but the chains limit you a lot.")

		saynn("Rahi breathes warmly into the back of your head. You feel her perky nipples rubbing against your back while she prepares for another thrust.")

		saynn("[say=rahi]See-e?.. She is inside you.. fucking your tight.. fuckhole.. You should.. moan for her![/say]")

		saynn("As she says she starts pulling her cock out again just to ram it in, only the knot of her strapon stops her from shoving the entire thing into you. And she doesn’t stop there, she starts working her hips, sliding the rubber cock inside you.")

		saynn("[say=rahi]She.. can’t hear you. Moan.. slut.[/say]")

		saynn("Her voice, you hear some demanding tones. And this feeling of being fucked with a strapon.. How could you not moan? Little pleasure noises escape from your lips while Rahi slowly picks up the pace, pounding your butt and putting quite some pressure on your prostate, making you leak profusely.")

		saynn("The toy shifts inside her pussy quite a bit, probably reaching the g-spot. Rahi can’t help but to let out cute noises too, her breathing is very deep. Suddenly you feel her paw landing on your neck, above the collar. She makes breathing slightly more difficult for you! Oh fuck.")

		saynn("[say=rahi]Moan louder, you.. little breeding bitch! She wants to hear and feel you![/say]")

		saynn("Even Eliza is looking surprised at what Rahi is capable of. Your eyes want to roll up from how good this feels though, your cock is shooting little string of pre and prostate fluids while your poor star is being fucked so rough. You give in to it and let some passionate moans out. Just to feel Rahi apply more pressure onto your neck a second later, pretty much choking you. And that makes you clench around her shaft..")

		addButton("Continue", "See what happens next", "continue4")

	if(state == "continue4"):
		playAnimation(StageScene.HangingSex, "fast", {npc="rahi", pcCum=true, bodyState={naked=true}, npcBodyState={naked=true}})
		
		saynn("But your clenching only makes the brown kitty more eager. She starts fucking you even harder, her hips slapping against your ass as she sends you forward a bit just to catch you on the way back with another thrust. Her fake knot slaps against your sensitive ring and tries to stretch beyond its limit. All the while moaning herself from the increased friction between her pussy and the other side of the strapon.")

		saynn("You can’t endure this for long. Very soon you begin to feel strange pressure arising in your caged member. And it doesn’t stop, not while Rahi is going to town with your ass. You feel yourself clenching around her cock involuntary, your poor member really tires to get hard by the cage is relentless. Your balls sway back and forth while more pre land on them. Your prostate seems to get harder and more swole, it’s easier to hit and so much more sensitive.")

		saynn("Rahi moans into your ear while pegging you.. And soon enough.. you cum.. Weak strings of {pc.cum} get shoved past the cage. And then a slow but mostly steady flow of your seed begins flowing from your cock. You arch your back and moan like a slut while Rahi milks your prostate and gives you a wet orgasm. You wanna scream from how good this feels but the lack of oxygen really makes it tough to say anything.")

		saynn("Rahi feels that you’re experiencing some kind of climax and finally lets go of your neck, not letting you pass out now. But she seems to be close too, how motions become more jerky and fast. She tries really hard to shove the whole thing inside and very soon the rubber knot manages to stretch your hole beyond its limit and slip inside! Her knot is huge, it applies so much pressure on your poor p-spot that you immediately shoot out another few weak strings of {pc.cum} from your caged up cock. And moments after that happens, Rahi lets out a long passionate noise as she finally cums too, her pussy pulsates around the strapon and showers it with plenty of her femcum. She bares her fangs and bites into your shoulder while the orgasm overtakes her feline body, making the kitty shake and shiver.")

		saynn("And now you two are stuck together by Rahi’s knot. Your caged cock is still slowly trickling {pc.cum} while the feline rides her own climax to the end. You catch some glimpses of Eliza, she rubs herself under her skirt while biting her lip.")

		saynn("[say=eliza]Wow~. Didn’t expect for the small kitty to be able to do something like that.[/say]")

		addButton("Continue", "See what happens next", "continue5")

	if(state == "continue5"):
		playAnimation(StageScene.HangingSex, "tease", {npc="rahi", bodyState={naked=true}, npcBodyState={naked=true}})
		
		saynn("Rahi finally lets go of your neck and then licks the small wounds that she left a few times. Her cheeks begin to blush bright red again. She is still breathing heavily, like you.")

		saynn("[say=rahi]That was.. intense.. for her..[/say]")

		saynn("[say=eliza]Yeah, I see that~. You made {pc.him} cum, good job, kitty, I wouldn’t mind letting you help me milk inmates in the future~.[/say]")

		saynn("Brown kitty begins trying to yank the knot out. But the first few attempts obviously fail, you both moan as both sides of the strapon shift inside your sensitive holes. But soon enough Rahi manages to put enough pressure to stretch your fuckhole enough to pull her cock out, leaving you to gape. Rahi looks at your cage and sees the mess you made on the carpet.")

		saynn("[say=rahi]Oh.. Kitty just let her instincts take over..[/say]")

		saynn("[say=eliza]Well, you left {pc.him} speechless I think, so that’s good~.[/say]")

		saynn("Rahi takes off the strapon, producing a muffled moan as her pussy gets stretched slightly again to let the other side of the toy out. She hands it to Eliza, clearly being embarrassed of how wet it looks. Whole room smells of sex.")

		saynn("You, being spent, just allow the chains to support you from failing. Your anus slowly closes up but the pleasurable afterglow is still there, reminding you of how good anal sex is..")

		saynn("[say=eliza]I will clean up here, kitty, you’re free to go. You’ve been incredibly helpful, I will find a way to reward you later.[/say]")

		saynn("Kitty nods a few times and puts her uniform on. She glances at you with the same shy eyes as before, looking embarrassed for what she did.")

		saynn("[say=rahi]Thank you..[/say]")

		saynn("And with that, Eliza lets her out.")

		addButton("Continue", "See what happens next", "continue6")

	if(state == "continue6"):
		removeCharacter("rahi")
		aimCameraAndSetLocName("medical_nearconfessionary")
		GM.pc.setLocation("medical_nearconfessionary")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Doctor Quinn stares at you and giggles. She talks to you while uncuffing your hands, being careful not to step into the mess that you made.")

		saynn("[say=eliza]Don’t know what I expected. But I’m satisfied for sure. I won’t even ask you, I know that you loved it. Keep that cage on and you will have more events like these in your life, isn’t that great~?[/say]")

		saynn("After that she hands you your clothes. You can barely stand. Starting your day fully spent is so strange.")

		saynn("Eliza guides you out of the room.")

		saynn("[say=eliza]See you around~.[/say]")

		# (scene ends)

		addButton("Continue", "That was something", "endthescene")
		


func _react(_action: String, _args):
	if(true):
		processTime(RNG.randi_range(3,8)*60)

	if(_action == "giverahistrapon"):
		var rahi = getCharacter("rahi")
		rahi.getInventory().removeItemFromSlot(InventorySlot.UnderwearBottom)
		rahi.getInventory().equipItem(GlobalRegistry.createItem("StraponFeeldoe"))

	if(_action == "endthescene"):
		endScene()
		getCharacter("rahi").resetEquipment()
		return
		
	if(_action == "continue3"):
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 20)
		
	if(_action == "continue4"):
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)
		GM.pc.orgasmFrom("rahi")
		
	if(_action == "no"):
		GM.pc.addPain(10)
		
	if(_action == "badendscene"):
		increaseFlag("MedicalModule.Chastity_OptionalBadBehavourCounter")
		increaseFlag("MedicalModule.Chastity_OptionalBadBehavourCounter")
		GM.pc.setLocation("medical_nearconfessionary")
		
		endScene()
		getCharacter("rahi").resetEquipment()
		return

	
	setState(_action)

func getDevCommentary():
	return "This is the first scene that I wrote where Rahi acts like a dom ^^. This was way before the dedicated content for Rahi was written. Kind of a test to see if people would like domme Rahi. And I think it was a success ^^\n\nJust so you know, in-game Rahi is not me, not even close. Yes, she is shy. And I'm shy too. That's about it, heh. I used to add lots of dots.. at the end of my chat messages.. people were asking if I'm sad.. I don't think I was.. x3 I still do use them in my writing when I feel like they fit. They help to slow down the scene a little without adding extra words. Like..\n\nSpace.. Stars.. Sky.. Clouds.. Trees.. Rahi.. walking home.."

func hasDevCommentary():
	return true
