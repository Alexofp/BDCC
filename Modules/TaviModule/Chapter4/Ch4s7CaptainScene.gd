extends SceneBase

var skar_added_blindfold = false

func _init():
	sceneID = "Ch4s7CaptainScene"

func _run():
	if(state == ""):
		GM.pc.setLocation("solitary_cell")
		playAnimation(StageScene.HangingDuo, "idle", {npc="tavi", npcAction="kneel", bodyState={naked=true}, npcBodyState={naked=true}})
		aimCameraAndSetLocName("solitary_cell")
		addCharacter("tavi", ["naked"])
		saynn("You, the real you, blink a few times. Tavi's story was so immersive that you forgot that you two are still stuck in solitary, naked and with your hands cuffed.")

		saynn("Tavi looks down at her purple body with green glowing spots. Then she looks at you.")

		saynn("[say=tavi]So. What do you think? Am I a monster for what I did?[/say]")

		addButton("Kinda", "That was pretty fucked up", "say_yes")
		addButton("No", "Tavi did what she had to do", "say_no")
	if(state == "say_yes"):
		setFlag("TaviModule.Ch4SaidTaviIsMonster", true)
		saynn("[say=pc]That was pretty fucked up, you destroyed an entire space station.[/say]")

		saynn("Tavi tilts her head down again. She is quiet for a few seconds.")

		saynn("[say=tavi]I'd say that I had no choice.[/say]")

		saynn("You pick up her subtle smile.")

		saynn("[say=tavi]But that would be a lie.[/say]")

		saynn("She looks at you, her eyes shine brightly in the dim cell.")

		saynn("[say=tavi]I don't regret a single thing, cutie. Seeing that station collapse under its own weight.. It's a highlight of my life.[/say]")

		saynn("[say=pc]A lot of people died, how can that be a highlight?[/say]")

		saynn("Tavi rattles her chains.")

		saynn("[say=tavi]Because I had no other highlights, okay?![/say]")

		saynn("She frowned at you. But then quickly calms down. Tavi throws her head back, staring at the ceiling.")

		saynn("[say=tavi]My entire life is a mess. Partly because the world is a mess. Our dreams guide us. After that our choices define us. But what should you do if the world only gives you bad ones?[/say]")

		saynn("You hear quiet clapping coming from the corridor, someone is approaching.")

		addButton("Continue", "See what happens next", "captain_walks_in")
	if(state == "say_no"):
		setFlag("TaviModule.Ch4SaidTaviIsMonster", false)
		saynn("[say=pc]You did what you had to do to survive. I would have probably done the same.[/say]")

		saynn("Tavi offers you a soft smile, her eyes shine brightly in the dim cell.")

		saynn("[say=tavi]Yeah, well. Try to avoid being like me, cutie.[/say]")

		saynn("[say=pc]Why so?[/say]")

		saynn("[say=tavi]I would say that I had no choice. But that would be a lie. I made many choices before that.[/say]")

		saynn("Her smile is still there but it looks more ominous combined with her dark tone.")

		saynn("[say=tavi]And I don't regret a single thing. Seeing that station collapse under its own weight.. It's a highlight of my life.[/say]")

		saynn("[say=pc]Wow.[/say]")

		saynn("[say=tavi]Now I want everyone who worked on that station to die. Just so there can be less people like me.[/say]")

		saynn("[say=pc]You.. you can't stop that, I don't think.[/say]")

		saynn("Tavi tilts her head slightly.")

		saynn("[say=tavi]I can surely try. You know.. Each kill.. makes me feel something inside. Something that I can't quite describe. Like I'm getting closer to the truth. And that feeling beats not feeling anything at all.[/say]")

		saynn("[say=pc]I guess..[/say]")

		saynn("You hear quiet clapping coming from the corridor, someone is approaching.")

		addButton("Continue", "See what happens next", "captain_walks_in")
	if(state == "captain_walks_in"):
		addCharacter("captain")
		playAnimation(StageScene.HangingDuo, "idle", {npc="captain", bodyState={naked=true}})
		saynn("Captain Wright approaches your cell. You're still divided by a thick glass panel but it seems to have a few small holes.")

		saynn("[say=captain]That was a very sad story, Tavi.[/say]")

		saynn("Tavi instantly shows off her fangs, she keeps her legs shut. Even though the captain's voice seems genuine.")

		saynn("[say=captain]I'm being serious. But, sadly, your methods do go against the AlphaCorp's laws. Which is why you're here, in my possession. I hope at least that part seems fair to you.[/say]")

		saynn("[say=tavi]Slavery used to be legal. Well, it still is, I guess. Eavesdropping can get you in trouble, captain.[/say]")

		saynn("He chuckles softly.")

		saynn("[say=captain]It's you who is gonna tell me that? And besides, I didn't learn it from you. Your last little infiltration mission has left me quite a surprise. A very helpful surprise.[/say]")

		saynn("[say=tavi]What are you talking about?[/say]")

		saynn("[say=captain]Let me show you rather than trying to explain.[/say]")

		saynn("He produces some kind of spherical object. Seems to be a projector of sorts. He finds a button on it and presses it..")

		addButton("Continue", "See what happens next", "elena_appears")
	if(state == "elena_appears"):
		addCharacter("elena")
		playAnimation(StageScene.HangingDuo, "idle", {npc="elena", bodyState={naked=true}})
		saynn("The projector constructs a hologram in the air. A hologram.. of Elena.")

		saynn("[say=elena]Tavi, they found the ship! I tried to triangulate your position but they were faster..[/say]")

		saynn("Tavi's face shows a constant emotion. A mix of regret and anger.")

		saynn("[say=tavi]It's.. it's fine, Elena. I'm glad you're okay. Don't tell them anything.[/say]")

		saynn("[say=elena]I'm sorry, Tavi.. I couldn't..[/say]")

		addButton("Continue", "See what happens next", "elena_goes_away")
	if(state == "elena_goes_away"):
		removeCharacter("elena")
		playAnimation(StageScene.HangingDuo, "idle", {npc="captain", bodyState={naked=true}})
		saynn("The captain presses the button on the projector, causing the hologram to fade away.")

		saynn("[say=captain]Your little personal assistant was quite useful, she helped us to solve a lot of mysteries. We finally know everything that you. And I know more about you now. I like learning the past lives of inmates here.[/say]")

		saynn("Tavi goes quiet. But you can't stay silent anymore.")

		saynn("[say=pc]Before ordering to kill them? Or brainwashing? Breeding? What is your favorite fetish, captain?[/say]")

		saynn("He directs his attention to you now. And he looks surprised after your words.")

		saynn("[say=captain]Killing? No. Taking away someone's life is the worst thing you can do. It is necessary sometimes, yes. But, as a captain of BDCC, I strive to do better.[/say]")

		saynn("He crosses his arms.")

		saynn("[say=captain]Most of you can never be integrated into a normal society ever again because of your past deeds. Doesn't mean we should give up on you. But the process of redemption should start with understanding.[/say]")

		saynn("[say=pc]And what if they won't understand? You will brainwash them and start from scratch? Sounds so scummy.[/say]")

		saynn("Captain gets quiet for a few seconds, his canine eyes watching you and Tavi. He leans against the glass, getting closer to you.")

		saynn("[say=captain]Brainwashing? Hah. Where did you get that idea from? Brainwashing kills the soul. No. I prefer to show people why they are wrong and hope that they change.[/say]")

		saynn("Huh? Is he lying? You look at Tavi. She rolls her eyes. You have the proof that he is lying but telling him about it would.. spoil the surprise.")

		saynn("[say=captain]As for breeding.. Let me ask you something. Why do you think I decided to allow any kinds of sexual acts here, in BDCC?[/say]")

		addButton("No idea", "You don't know why", "breed_noidea")
		addButton("Can't control", "Because they can't control it", "breed_cantcontrol")
		addButton("For fun", "Because why not", "breed_forfun")
		addButton("Punishments", "Sexual torture is used as punishments", "breed_punishments")
	if(state == "breed_noidea"):
		saynn("[say=pc]I can only guess.[/say]")

		saynn("The captain smiles.")

		saynn("[say=captain]Whatever your guess is, it's probably not wrong. BDCC is a very.. disconnected place, as you have already learned. That allows me to.. take some liberties with how I run things.[/say]")

		saynn("He looks around, at all the dark concrete that your cell is made out of.")

		addButton("Continue", "See what happens next", "captain_explains")
	if(state == "breed_cantcontrol"):
		saynn("[say=pc]Because there is no way for you to control it? You're not as good of a leader, right?[/say]")

		saynn("The captain smiles.")

		saynn("[say=captain]Chastity belts and cages do exist, no sex policy could have been easily enforced if I wanted to. But no. BDCC is a very.. disconnected place, as you have already learned. That allows me to.. take some liberties with how I run things.[/say]")

		saynn("He smartly skips your comment about his leadership skills and just looks around, at all the dark concrete that your cell is made out of.")

		addButton("Continue", "See what happens next", "captain_explains")
	if(state == "breed_forfun"):
		saynn("[say=pc]You enjoy sex? Breeding helpless inmates? Or do you just like watching?[/say]")

		saynn("The captain smiles.")

		saynn("[say=captain]I.. I don't have sex with inmates or staff. I won't deny though, I got a little bit spoiled by all the inmates who beg to be my pets. There is something nice about seeing them humiliate themselves. But only because it's fun to see them being happy.[/say]")

		saynn("He scratches behind his head.")

		saynn("[say=captain]BDCC is a very.. disconnected place, as you have already learned. That allows me to.. take some liberties with how I run things.[/say]")

		addButton("Continue", "See what happens next", "captain_explains")
	if(state == "breed_punishments"):
		saynn("[say=pc]You use it as a punishment? The staff can go ahead and have fun with someone unruly against their will? Helps to keep staff morale high and inmate's will low?[/say]")

		saynn("The captain smiles.")

		saynn("[say=captain]I won't lie, you got me there. Staff do use it as a punishment sometimes. But sex can be used for so much more than that. It can help to keep inmates happy too. Happy, not suppressed. BDCC is a very.. disconnected place, as you have already learned. That allows me to.. take some liberties with how I run things.[/say]")

		addButton("Continue", "See what happens next", "captain_explains")
	if(state == "captain_explains"):
		saynn("[say=captain]This prison is not a heaven and it's not trying to be. But, I think, the ability to.. have intimate moments.. balances things out. And it brings value to AlphaCorp.[/say]")

		saynn("[say=pc]What do you mean?[/say]")

		saynn("The captain stares you in the eyes.")

		saynn("[say=captain]It's a self-regulating machine. The balance.. is at its core. Convicted criminals here are able to offset their bad deeds.. by doing things that they enjoy. And giving value back to the society in the process.[/say]")

		saynn("Tavi suddenly realizes something.")

		saynn("[say=tavi]I get it. You're making soldiers out of inmate's kids. Different space station, same fucking thing.[/say]")

		saynn("The captain lets Tavi yell at him. The feline growls and struggles against the chains harder. The captain continues to speak with a normal voice, even if with a slightly more cunning tone.")

		saynn("[say=captain]As much as it might seem like that, it's really not, Tavi. I'm not making soldiers out of anyone. Yes, we do have the facilities here that allow us to teach the new generations. We teach kids all sorts of professions. Doctors, engineers, scientists, pilots and of course soldiers too. They have a choice, Tavi. We don't take away their childhood, we make it as best as we can.[/say]")

		saynn("Tavi continues to snarl at the captain even if not as eagerly.")

		saynn("[say=captain]You all heard it a million times, the war calls for more heroes, it's true. But once AlphaCorp wins, all of these kids will be free to do whatever they want with their lives. They won't be.. constrained.. by what their parents did. All of them will be valuable members of society. Each one will have a great future ahead.[/say]")

		saynn("[say=pc]What if it doesn't? What if the war is never gonna end?[/say]")

		saynn("The captain shrugs.")

		saynn("[say=captain]That's why we need every advantage we can get. But my methods are entirely ethical. It's pretty much how nature works. Although, we do try to keep kids away from their parents. For obvious reasons.[/say]")

		saynn("The captain looks at Tavi next.")

		saynn("[say=captain]I'm giving you one last chance, Tavi. After that I will have to do something with you, this can't go on like this. It might look like I'm trying to tell you to give up on your dreams. But. It's not about giving up, Tavi. It's about accepting yourself.[/say]")

		saynn("Tavi glares at him. All the while the captain looks at someone you can't see and gestures to them to step closer.")

		addButton("Continue", "See what happens next", "skar_walkin")
	if(state == "skar_walkin"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="skar", bodyState={naked=true}})
		addCharacter("skar")
		saynn("Skar walks in while also bringing some kind of contraption. The main part of this contraption is a long.. seat.. of an uncomfortable triangular shape.")

		saynn("[say=captain]A few hours on a wooden horse should make you both reconsider your behavior. Skar here will ensure you understand the reasons behind your punishment. In case it isn't obvious. Right, Skar?[/say]")

		saynn("[say=skar]Yeah, sir. I can do that.[/say]")

		saynn("Tavi doesn't look too happy about it. But seeing Skar does make her strangely inspired.")

		saynn("[say=tavi]Gonna torture us now? Until we break?[/say]")

		saynn("The captain smiles.")

		saynn("[say=captain]Who said this is designed to break you? This is justice, Tavi. You know that word well.[/say]")

		saynn("He taps Skar on the shoulder and whispers something to him before leaving.")

		addButton("Continue", "See what happens next", "skar_prepares")
	if(state == "skar_prepares"):
		removeCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="skar", bodyState={naked=true}})
		saynn("Skar presses something and the whole glass wall begins to slowly lower itself down. He then rolls in the wooden horse and begins to secure it so it doesn't move around anymore.")

		saynn("He is working quietly.")

		saynn("[say=tavi]You heard everything, didn't you, Skar?[/say]")

		saynn("He doesn't answer and just unchains your hands from the ceiling before bringing you to the wooden horse. He is strong and your hands are still cuffed so you can't do anything but obey the cold touch of his prosthetic arms.")

		saynn("[say=tavi]Wanna share your thoughts about it~? I'm very curious, trust me.[/say]")

		saynn("He lowers the wooden horse enough for you to just get on it. Your legs can still reach the floor easily so you just use them for support. His powerful arms then chain your ankles and your wrists to the contraption.")

		saynn("[say=tavi]I can start first if you want.[/say]")

		saynn("After being done with you, Skar approaches Tavi and crouches before her. The feline winks at him, she is still naked and her paws are cuffed to the wall, forcing her to present herself for the guy.")

		saynn("[say=tavi]I'm sorry that my body doesn't consist of 60% prosthetic parts.[/say]")

		saynn("[say=skar]It's fine.[/say]")

		saynn("[say=tavi]No, really. I should be looking like you by this point. With all sorts of battle scars and missing limbs.[/say]")

		saynn("Skar tries not to react and just unchains Tavi from the wall before bringing you to the same wooden horse and positioning her near you. His hands chain her ankles and wrists to the contraption too.")

		saynn("[say=tavi]But as you can see, I'm fine. And I'm happy. You know why?[/say]")

		saynn("[say=skar]You destroyed an entire space station, killing everyone who worked there?[/say]")

		saynn("[say=tavi]I stopped a soldier factory, Skar. I didn't follow any orders. And because of that, I wasn't forced to see my squad get wiped out on the battlefield because of some old guy's mistake.[/say]")

		saynn("Skar's arms make a whole lotta mechanical noise as he clenches his fists.")

		saynn("[say=tavi]Oh wow. That was a wild guess. But you know, a lot of the war stories are similar. Friends losing friends, one by one or all at the same time. And when there are no friends around anymore, you begin to lose yourself.[/say]")

		saynn("He continues to contain himself as best as he can. And he seems to succeed, his arms relaxing before he proceeds to raise the main part of the wooden horse, making it so you have to stand on your toes, both you and Tavi.")

		addButton("Continue", "See what happens next", "skar_raises_horse")
	if(state == "skar_raises_horse"):
		playAnimation(StageScene.WoodenHorseDuo, "idle", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		if (GM.pc.hasVagina()):
			saynn("The triangle-shaped seat gets pressed against your sensitive lady parts. You can still just about reach the floor but you really have to put effort into standing on your toes. The moment you slip up, the sharp edge begins to put stress on your pussy lips, spreading them and then digging into the sensitive part.")

		else:
			saynn("The triangle-shaped seat gets pressed against your taint. You don't possess a pussy but it still provides enough discomfort for you"+str(" and your {pc.penis}" if GM.pc.hasPenis() else "")+". You can still just about reach the floor but you really have to put effort into standing on your toes. The moment you slip up, the sharp edge begins to put stress on your taint, bringing pain.")

		saynn("You look at Tavi, she has to suffer a similar fate, her {tavi.breasts} bob slightly as her green glowing petals are being pressured by the wooden horse. She stares at you with her eyes full of hope.")

		saynn("[say=tavi]Ow. You're not gonna tell us anything? You enjoy torture so much?[/say]")

		saynn("[say=skar]I don't.[/say]")

		saynn("[say=tavi]Oh? Well, you probably aren't afraid of me. Or my cutie here. But you're afraid of my words, aren't you? You don't wanna listen to me. You know why?[/say]")

		saynn("Skar presses a button causing the wooden horse to raise its seat even more.")

		addButton("Continue", "See what happens next", "skar_tortures")
	if(state == "skar_tortures"):
		playAnimation(StageScene.WoodenHorseDuo, "lightstruggle", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		if (GM.pc.hasVagina()):
			saynn("The sharp edge digs into your pussy more. Fuck, you almost can't escape it anymore. You try to struggle but that just makes things worse, any motion causes you to lose touch with the ground and begin to put your full weight on the frame. You're getting somewhat wet from the little stimulation that you're getting but that doesn't help much, the discomfort is rising.")

		else:
			saynn("The sharp edge digs into your taint area more. Fuck, you almost can't escape it anymore. You try to struggle but that just makes things worse, any motion causes you to lose touch with the ground and begin to put your full weight on the frame. You're getting somewhat hard from the little stimulation that you're getting but that doesn't help much, the discomfort is rising.")

		saynn("All the while Tavi uses her natural height advantage and stays still. She still has to endure her pussy being put under stress but she seems to just about manage, only biting her lip sometimes. But she understands that with each second the situation gets worse for both of you.")

		saynn("[say=tavi]Because deep inside you know.. that I'm right.. But you're holding onto your old set of lies because they're more familiar to you.. Listen, it's never too late to pick new ones.. Mine are better..[/say]")

		saynn("Skar suddenly smacks Tavi's ass with his metal palm, causing the feline to yelp and to lose traction with the ground too. The guard then raises the wooden horse even more. The torture begins..")

		addButton("Continue", "See what happens next", "more_torture")
	if(state == "more_torture"):
		playAnimation(StageScene.WoodenHorseDuo, "struggle", {npc="tavi", npcAction="lightstruggle", bodyState={naked=true}, npcBodyState={naked=true}})
		if (GM.pc.hasVagina()):
			saynn("You throw your head back and let out a stifled noise as your pussy gets put under a lot of stress. You can't sit still, it's impossible, your body tries to struggle but that only leads to your pussy sliding over the sharp edge and getting stimulated more. And all the chains means you can't escape this precarious situation so easily, you're forced to endure the pain.")

		else:
			saynn("You throw your head back and let out a stifled noise as your taint gets put under a lot of stress. You can't sit still, it's impossible, your body tries to struggle but that only leads to your perineum area sliding over the sharp edge and getting stimulated more. And all the chains means you can't escape this precarious situation so easily, you're forced to endure the pain.")

		saynn("Tavi produces a quiet moan, her tits bounce a little each time she dares to move a little. Her pussy coats the sharp edge under her with her juices. Her facial expression gets less and less confident and more sorry by the second.")

		saynn("Skar just crosses his arms.")

		saynn("[say=skar]Wars are unavoidable, Tavi.[/say]")

		saynn("[say=tavi]They.. are.. fuck.. What happened to.. using words.. instead of weapons.. Just.. Fucking.. communicate more.. Ease it up a little.. maybe?..[/say]")

		saynn("[say=skar]Some people only understand force.[/say]")

		saynn("[say=tavi]Drones.. Virtual fights.. Online battles.. Otherwise.. more kids will go through the same.. as you.. Same war stories..[/say]")

		saynn("Skar looks at Tavi. But then lowers his gaze. All the while Tavi is busy panting and trying to not fidget too much. You're both failing at that though, the torture machine does its job, bringing your privates lots of discomfort and pain.")

		addButton("Continue", "See what happens next", "skar_gets_confused")
	if(state == "skar_gets_confused"):
		saynn("A few minutes pass. But it feels like forever. A few hours of this? What is the captain thinking?")

		saynn("Tavi is unable to taunt the guy anymore, she only hisses and groans as her pussy begins to shine brighter, the sensitive skin there got very irritated by now. She desperately tries to pull herself up by the chains but that only makes it worse when eventually has to let go and have her pussy tortured harder.")

		saynn("She had the right idea though. You probably can escape that way but first you gotta loosen the cuffs.")

		saynn("Skar is leaning against the wall with his hands crossed, not paying too much attention. Now would be the best time to escape.. Or give up completely.")

		if (GM.pc.hasVagina()):
			saynn("You gotta do it fast though.. Your pussy is beginning to feel irritated too.")

		else:
			saynn("You gotta do it fast though.. The skin of your taint is beginning to feel irritated too.")

		addButton("Continue", "See what happens next", "woodenhorse_loop")
	if(state == "woodenhorse_loop"):
		playAnimation(StageScene.WoodenHorseDuo, "lightstruggle", {npc="tavi", npcAction="lightstruggle", bodyState={naked=true}, npcBodyState={naked=true}})
		var pcPain = GM.pc.getPainLevel()
		if (pcPain <= 0.2):
			if (GM.pc.hasVagina()):
				saynn("You feel your weight working against you, your sensitive slit is being put under a lot of pressure, causing discomfort. At least you can still kinda endure it. But for how much longer no one knows.")

			else:
				saynn("You feel your weight working against you, your taint area is being put under a lot of pressure, causing discomfort. At least you can still kinda endure it. But for how much longer no one knows.")

		elif (pcPain <= 0.4):
			if (GM.pc.hasVagina()):
				saynn("The discomfort is quickly rising, even the most simple motions echo back with your pussy getting more sore. You're enduring it as best as you can. Tavi is holding on too but you can hear her hissing occasionally.")

			else:
				saynn("The discomfort is quickly rising, even the most simple motions echo back with your crotch getting more sore. You're enduring it as best as you can. Tavi is holding on too but you can hear her hissing occasionally.")

		elif (pcPain <= 0.6):
			if (GM.pc.hasVagina()):
				saynn("It might seem like your pussy is getting stimulated while you fidget back and forth on that torture device but in reality the pain and discomfort are overpowerting any pleasure by a long shot. Random noises like cries and pleading escape from your mouth. Your slit looks quite irritated.")

			else:
				saynn("It might seem like your crotch area is getting stimulated while you fidget back and forth on that torture device but in reality the pain and discomfort are overpowerting any pleasure by a long shot. Random noises like cries and pleading escape from your mouth. The skin on your taint looks quite irritated.")

		elif (pcPain <= 0.8):
			if (GM.pc.hasVagina()):
				saynn("This is getting too much for you real fast. The constant pain that's coming from your pussy causes you to start arching your back which in turn brings more awful sensations. If you weren't begging before, you feel like you will start doing that soon. Tavi is not doing any better, her pussy slit got so irritated that it drips green glowing blood onto the frame.")

			else:
				saynn("This is getting too much for you real fast. The constant pain that's coming from your taint causes you to start arching your back which in turn brings more awful sensations. If you weren't begging before, you feel like you will start doing that soon. Tavi is not doing any better, her pussy slit got so irritated that it drips green glowing blood onto the frame.")

		else:
			if (GM.pc.hasVagina()):
				saynn("The pain is almost unbearable, it's so bad that you can't even rest anymore. But at least you feel like it won't get any worse from now on. You grit your teeth while your pussy lips basically get cut by the sharp edge of that wooden horse. Tavi's eyes roll up while she grits her teeth too, she has given up resisting a long time ago, just counting seconds, hoping that this torture will end soon.")

			else:
				saynn("The pain is almost unbearable, it's so bad that you can't even rest anymore. But at least you feel like it won't get any worse from now on. You grit your teeth while your taint area basically gets cut by the sharp edge of that wooden horse. Tavi's eyes roll up while she grits her teeth too, she has given up resisting a long time ago, just counting seconds, hoping that this torture will end soon.")

		if (pcPain < 1.0):
			addButton("Rest", "Try to rest and get some stamina back", "do_rest")
		else:
			addDisabledButton("Rest", "Too painful!")
		if (GM.pc.getStamina() > 0):
			addButton("Struggle", "Resist your restraints", "do_struggle")
		else:
			addDisabledButton("Struggle", "You don't have any strength left to struggle")
		if (!GM.pc.hasBoundArms() && !GM.pc.hasBoundLegs()):
			addButton("Escape", "You can try to escape!", "do_escape")
		else:
			addDisabledButton("Escape", "Your must free your arms and legs")
		addButton("Give up", "Accept that you won't escape", "do_giveup")
	if(state == "do_rest"):
		playAnimation(StageScene.WoodenHorseDuo, "idle", {npc="tavi", npcAction="lightstruggle", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You rest a few minutes, trying to be completely motionless. But the sharp edge of that device is a really bad seat, it keeps bringing you pain and discomfort either way.")

		addButton("Continue", "See what happens next", "woodenhorse_loop")
	if(state == "do_escape"):
		playAnimation(StageScene.Duo, "stand", {npc="skar"})
		saynn("You managed to loosen up the cuffs enough for you to escape them! You quickly pull yourself up using the chains and get off the damn torture machine. That's a huge relief for your body.")

		saynn("You would save Tavi.. But Skar is still there, he saw what you did. And from his glare and deep breathing you can deduct that he isn't happy.")

		saynn("[say=skar]Can't run forever. You will just die tired.[/say]")

		saynn("[say=pc]Just let us go and you won't get hurt.[/say]")

		saynn("[say=skar]No.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "fight_skar")
	if(state == "if_lost"):
		playAnimation(StageScene.WoodenHorseDuo, "struggle", {npc="tavi", npcAction="lightstruggle", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You lost the battle. Skar quickly throws you back onto the wooden horse and cuffs your arms and legs, leaving you pretty much zero room for struggling.")

		saynn("[say=pc]Fuck, argh..[/say]")

		saynn("And with no strength to struggle, all you can do is give up and let your crotch be tortured..")

		addButton("Give up", "Oh well", "do_giveup")
	if(state == "if_won"):
		playAnimation(StageScene.Duo, "stand", {npc="skar", npcAction="defeat"})
		saynn("Skar hits the floor, defeated by your hand. You instantly go to Tavi and lower the torture machine before unchaining her paws and ankles. The feline cries out from pain as her slit no longer makes any contact with the sharp edge of that seat. Her pussy looks wounded to the point of it dripping green blood onto the floor.")

		saynn("[say=tavi]Ugh.. Thank you, cutie.[/say]")

		saynn("Naked Tavi tackles Skar and cuffs his arms with his own restraints, rendering him helpless.")

		saynn("[say=tavi]You can't stop us.[/say]")

		saynn("[say=skar]The consequences will catch up with you.[/say]")

		saynn("[say=tavi]Hah. I am the consequences.[/say]")

		saynn("[say=skar]And now you just wanna watch the world burn?[/say]")

		saynn("[say=tavi]I just wanna be happy, Skar. I know that you're too stubborn to change your mind, don't worry. What should we do with him, cutie?[/say]")

		saynn("Tavi looks at the wooden horse. Then she looks at you and winks while smiling.")

		addButton("Just leave", "No need to torture him", "just_leave")
		addButton("Wooden horse", "Throw Skar onto the wooden horse", "torture_skar")
	if(state == "just_leave"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("[say=pc]We should just leave, no need to humiliate him.[/say]")

		saynn("[say=tavi]Aw, if you say so. It was only fair. He is a soldier who just follows orders without taking responsibility.[/say]")

		saynn("Tavi finds her uniform in one of the bins outside and proceeds to cuff Skar to her old spot.")

		saynn("[say=skar]I'm not.[/say]")

		saynn("Tavi caresses his cheek lightly.")

		saynn("[say=tavi]Then turn your head on already. Hearts and minds, friend.[/say]")

		saynn("Tavi gets up and grabs your hand before proceeding to find the exit out of this place.")

		addButton("Continue", "See what happens next", "tavi_pc_escape")
	if(state == "tavi_pc_escape"):
		aimCameraAndSetLocName("hall_ne_corner")
		GM.pc.setLocation("hall_ne_corner")
		playAnimation(StageScene.Hug, "hug", {npc="tavi"})
		removeCharacter("skar")
		saynn("You and Tavi follow a series of corridors, looking for an exit out of this section of the station. Most of the doors don't open for you because you obviously lack access. After a few close ones where you almost got caught, you two stumble upon a catwalk that hangs over the main hall.")

		saynn("[say=tavi]Perfect.[/say]")

		saynn("[say=pc]Uh.. Isn't that a little too high?[/say]")

		saynn("Yeah, it was. But Tavi seems to know her ways around. She just jumps onto one of the concrete pillars and hugs it before sliding down. You follow her and do the same, it looked scarier than it was.")

		saynn("Tavi waits for you to slide down and comes to give you a tight hug.")

		saynn("[say=tavi]You should stop saving me. Next time it's my turn to take one for the team. Okay, cutie?[/say]")

		saynn("[say=pc]Yes, Miss Tavi.[/say]")

		saynn("[say=tavi]I need to come up with the next plan. I have a task for you in the meantime..[/say]")

		saynn("[say=pc]Don't you remember what the captain said? Last chance and all.[/say]")

		saynn("[say=tavi]Yeah. I do. You wanna give up?[/say]")

		saynn("You stay silent for a second and then shake your head. Tavi smiles.")

		saynn("[say=tavi]I want you to find Kait. And I want you to teach her a lesson, your choice how. Okay, cutie?[/say]")

		saynn("[say=pc]Where can I find her?[/say]")

		saynn("[say=tavi]Well, she is a lilac slut. Catch her in the lilac block during the morning. And please, be rough with her subby ass.[/say]")

		saynn("And just like that, you're free. Relatively speaking. Tavi scritches you under the chin before leaving and heading to her usual spot.")

		addButton("Continue", "Time to go", "endthescene")
	if(state == "torture_skar"):
		setFlag("TaviModule.Ch4TorturedSkar", true)
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("[say=pc]Let's see how he likes being on the other side.[/say]")

		saynn("[say=tavi]I bet he is really heavy with all that metal junk.[/say]")

		saynn("Tavi finds her uniform in one of the bins outside and proceeds to take off Skar's armor and uniform. The guy growls to himself.")

		saynn("[say=skar]I was following the captain's orders.[/say]")

		saynn("[say=tavi]Yeah-yeah-yeah, give me your pants already.[/say]")

		addButton("Continue", "See what happens next", "begin_skar_torture")
	if(state == "begin_skar_torture"):
		setFlag("TaviModule.Ch4TaviKnowsSkarsName", true)
		playAnimation(StageScene.WoodenHorseSolo, "idle", {pc="skar", bodyState={naked=true,hard=true}})
		saynn("With your help, Tavi manages to throw Skar onto the wooden horse. She quickly forces his hands and legs into the cuffs while you attach chains to them and tighten them up. Skar barely reaches the floor with his toes, just like you were before, he is already fidgeting uncomfortably.")

		saynn("You take a closer look, the guy has so many more old scars and bruises under his clothing, the missing fur around these spots makes it obvious.")

		saynn("[say=tavi]What's your real name, Skar?[/say]")

		saynn("He grunts softly, trying to get used to this position, his muscles working hard.")

		saynn("[say=skar]..why ask that.[/say]")

		saynn("[say=tavi]Just curious if you have one. Or if you ever had one at all.[/say]")

		saynn("[say=skar]Echo, pre-war name. UGh.[/say]")

		addButton("Continue", "See what happens next", "skar_torture_start")
	if(state == "skar_torture_start"):
		playAnimation(StageScene.WoodenHorseSolo, "lightstruggle", {pc="skar", bodyState={naked=true,hard=true}})
		saynn("He tries to pull himself up using his mechanical arms but the moment he lets go, his full package gets smacked against the triangular seat followed by his taint receiving the rest of the stress.")

		saynn("Tavi slowly raises the wooden horse, making it so the guy can't stand on his toes anymore. The naked wolf can't help but to start fidgeting harder.")

		saynn("[say=tavi]The wolf named Echo, huh. I like it. Better than being called something toxic.[/say]")

		saynn("Tavi directs her attention to you.")

		saynn("[say=tavi]Wanna humiliate him a little bit more?[/say]")

		saynn("[say=pc]What do you have in mind?[/say]")

		saynn("[say=tavi]That red rocket he has seems hard, just imagine..[/say]")

		saynn("Skar grunts and tries to close his legs but there is nothing he can do, each attempt to resist brings him pain.")

		addButton("Torture harder", "You'd rather have him experience more pain", "torture_skar_harder")
		addButton("Stroke him", "Relief at least some of the guy's tension", "stroke_skar")
	if(state == "stroke_skar"):
		playAnimation(StageScene.WoodenHorseSolo, "struggle", {pc="skar", bodyState={naked=true,hard=true}})
		saynn("[say=pc]Huh, sounds fun.[/say]")

		saynn("You reach for the guy's impressive member and wrap your digits around it. His balls are resting on the triangle which means they aren't resting at all and are under some stress too. You rub the pointy tip, squeezing a drop of precum before spreading it across the whole length.")

		saynn("Tavi's cunning smile shines while she watches Skar struggle with two problems at once now. Skar arches his back and grunts loudly, his body shifting slightly back and forth.")

		saynn("[say=pc]You like that, don't you?[/say]")

		saynn("[say=skar]Very fun.. ugh..[/say]")

		saynn("[say=tavi]Probably more fun than being a mindless guard, eh?[/say]")

		saynn("Skar growls slightly so you stroke his cock faster, making him pant instead. The orb near the base of his member starts inflating with blood, the tip leaking more precum with each motion.")

		saynn("[say=pc]C'mon, you wanna cum I can feel it.[/say]")

		saynn("The guy throws his head back and lets out passionate noises, his body probably confused from all the pain and pleasure that it's receiving at the same time. But you keep stroking him further until his shaft starts throbbing and twitching, he is so close.")

		addButton("Let him cum", "Might as well", "make_skar_cum")
		addButton("Deny him", "Be very mean with him", "deny_skar_cum")
	if(state == "make_skar_cum"):
		playAnimation(StageScene.WoodenHorseSolo, "lightstruggle", {pc="skar", pcCum=true, bodyState={naked=true,hard=true}})
		saynn("You feel his rocket throbbing more and more. But you don't stop, you keep jacking him off until moans start escaping out of his mouth. The guy arches his back again while his canine dick bursts with thick ropes of seed, painting the wooden horse that's underneath him with white.")

		saynn("But each pleasure wave also brings more pain with it as the guy's body struggles to contain the sensations, his perineum area is not particularly happy about it all.")

		saynn("[say=skar]Fuck..[/say]")

		saynn("[say=tavi]Good~. I'm curious, do you think that we are mean?[/say]")

		saynn("[say=skar]Whatever answer that satisfies you is my answer.[/say]")

		saynn("[say=tavi]Good boy.[/say]")

		saynn("Tavi begins to lower the wooden horse. But only enough for his feet to be touching the floor again.")

		saynn("[say=tavi]You earned this.[/say]")

		saynn("Skar huffs audibly and just keeps standing on his toes, his mind probably already trying to come up with explanations for all of this.")

		saynn("Tavi grabs your hand before proceeding to find the exit out of this place.")

		addButton("Continue", "See what happens next", "tavi_pc_escape")
	if(state == "deny_skar_cum"):
		saynn("You feel that Skar is close and deny him completely, your hand squeezes his shaft, preventing his cum from leaking even if it wanted to. And Skar, having his release stolen, is not too happy, he starts thrashing against his restraints which only makes his situation worse, his crotch looking quite bruised already.")

		saynn("[say=skar]Arghh-h.. Fu-uck..[/say]")

		saynn("[say=pc]You wanna cum? Well too bad.[/say]")

		saynn("You're not moving your hand no matter how hard he tries to resist. His attempts to hump your hand only result in him dragging his taint over the sharp edge.")

		saynn("[say=tavi]Oh wow, you're even more mean than me. Poor pup~[/say]")

		saynn("[say=pc]That will be a lesson for trying to stop us, twice.[/say]")

		saynn("Tavi begins to lower the wooden horse. But only enough for his feet to be touching the floor again.")

		saynn("[say=tavi]Let's not torture him too much.[/say]")

		saynn("Skar huffs audibly and just keeps standing on his toes, his mind probably already trying to come up with explanations for all of this.")

		saynn("Tavi grabs your hand before proceeding to find the exit out of this place.")

		addButton("Continue", "See what happens next", "tavi_pc_escape")
	if(state == "torture_skar_harder"):
		playAnimation(StageScene.WoodenHorseSolo, "struggle", {pc="skar", bodyState={naked=true,hard=true}})
		saynn("[say=pc]I have a better idea.[/say]")

		saynn("Instead of touching him, you find some extra weights that you begin attaching to Skar's ankles. That forces his crotch to put even more weight onto the sharp triangular edge, his perineum area is almost getting crushed by that, you can hear him grunting more.")

		saynn("[say=tavi]Oh wow, that's mean~[/say]")

		saynn("He can't help but to struggle more, thrashing against his restraints. But in doing so, he is only forced to endure more pain.")

		saynn("[say=pc]That's what he gets for going against us, twice.[/say]")

		saynn("Tavi begins to lower the wooden horse. But only enough for his feet to be touching the floor again.")

		saynn("[say=tavi]I understand your anger. But let's not torture him too much.[/say]")

		saynn("Skar huffs audibly and just keeps standing on his toes, his mind probably already trying to come up with explanations for all of this.")

		saynn("Tavi grabs your hand before proceeding to find the exit out of this place.")

		addButton("Continue", "See what happens next", "tavi_pc_escape")
	if(state == "do_giveup"):
		playAnimation(StageScene.WoodenHorseDuo, "struggle", {npc="tavi", npcAction="lightstruggle", bodyState={naked=true}, npcBodyState={naked=true}})
		setFlag("TaviModule.Ch4TortureEnd", "gaveup")
		saynn("This is too much. But it seems both you and Tavi have lost the will to struggle.")

		if (GM.pc.hasVagina()):
			saynn("Your sensitive pussy lips and clit are both irritated to the point of this being extremely painful. What felt kinda kinky at first is now a torture. Desperate, you hump the contraption, spreading your pussy juices over it.")

		else:
			saynn("Your sensitive taint area is irritated to the point of this being extremely painful. What felt kinda kinky at first is now a torture. Desperate, you hump the contraption, trying to avoid the same spot receiving all the stress.")

		saynn("Tavi is breathing deeply, her belly twitching sometimes and her breasts bouncing slightly as a result. Poor feline's eyes are watery, she hisses occasionally while her tail wags very annoyed between all the spikes of pain.")

		saynn("Time passes..")

		addButton("Continue", "See what happens", "torture_happens")
	if(state == "torture_happens"):
		saynn("One hour later, you almost.. got used to it. The pain is still there but you both learned to work around it, to live with it. Your private bits are receiving more damage but what can you do?")

		saynn("Skar sees that and grabs some weights before proceeding to attach them to your legs. Ow, they're heavy, too heavy. The suffering continues as you're now also fighting against extra weight in addition to your bodies.")

		saynn("Tavi would glare at the wolf but she is just too weak for that. The room gets filled with noises of pain and suffering yet again.")

		addButton("Continue", "See what happens next", "torture_ends")
	if(state == "torture_ends"):
		saynn("More time passes, who knows how much.. You're both exhausted to the point of just being still again.")

		saynn("Finally, Skar lowers the wooden horse, letting your legs touch the floor. Oww.. Any change in position brings in more bad sensations. But at least your crotch is not under pressure anymore.")

		saynn("Skar slowly unchains you both, leaving the cuffs.")

		saynn("[say=tavi]Ah.. Done.. already?.. I can do this all day..[/say]")

		saynn("[say=skar]You served your punishment.[/say]")

		saynn("[say=tavi]This won't stop us.[/say]")

		saynn("[say=skar]Then you will suffer the consequences each time.[/say]")

		saynn("[say=tavi]Hah.. fuck.. Even smiling hurts. I am the consequences, okay?[/say]")

		saynn("[say=skar]You wanna watch the world burn?[/say]")

		saynn("[say=tavi]I just wanna be happy, Skar.. I know that you're too stubborn to change your mind, don't worry. Just let us go already..[/say]")

		addButton("Continue", "See what happens next", "skar_lets_you_go")
	if(state == "skar_lets_you_go"):
		playAnimation(StageScene.Hug, "hug", {npc="tavi"})
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		removeCharacter("skar")
		saynn("Skar helps you get down and then uncuffs you. As much as you would love to punch him, you know that you will instantly lose and probably serve another hour as a wooden horse rider.")

		saynn("Tavi hisses while putting on her uniform, her shorts instantly receive a green blood stain.")

		saynn("[say=tavi]Aww, hell.[/say]")

		saynn("The guy then puts you both on a leash and proceeds to tug you out of this room. Tavi follows even if unwillingly. You do as well, getting choked by your collar is the last thing you want.")

		saynn("Skar drags you through some corridors before ending up near the checkpoint.")

		saynn("[say=skar]Off you go, inmates.[/say]")

		saynn("[say=tavi]Thank you, friend.[/say]")

		saynn("Both you and Tavi are still panting softly. The guard leaves, letting you finally let it all out.")

		saynn("[say=pc]That didn't turn out well.[/say]")

		saynn("[say=tavi]It didn't begin well to be honest.[/say]")

		saynn("[say=pc]Will you give up now?[/say]")

		saynn("Tavi comes closer to give you a tight hug.")

		saynn("[say=tavi]I appreciate you trying to save us. Even if it doesn't always work out. Next time it's my turn to take one for the team. Okay, cutie?[/say]")

		saynn("[say=pc]Yes, Miss Tavi.[/say]")

		saynn("[say=tavi]The captain won't stop us that easily. But I need to come up with the next plan. I have a task for you in the meantime..[/say]")

		saynn("[say=pc]What is it?[/say]")

		saynn("[say=tavi]I want you to find Kait. And I want you to teach her a lesson, your choice how. Okay, cutie?[/say]")

		saynn("[say=pc]Where can I find her?[/say]")

		saynn("[say=tavi]Well, she is a lilac slut. Catch her in the lilac block during the morning. And please, be rough with her subby ass.[/say]")

		saynn("And just like that, you're free. Relatively speaking. Tavi scritches you under the chin before leaving and heading to her usual spot.")

		addButton("Continue", "Time to go", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "captain_walks_in"):
		processTime(60*10)

	if(_action == "elena_appears"):
		processTime(5*60)

	if(_action == "skar_walkin"):
		processTime(60*10)

	if(_action == "skar_prepares"):
		getCharacter("tavi").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("tavi").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))
		GM.pc.removeAllRestraints()
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "skar_tortures"):
		processTime(20*60)

	if(_action == "skar_gets_confused"):
		processTime(60*5)

	if(_action == "do_rest"):
		GM.pc.addPain(20)
		GM.pc.addStamina(50)
		processTime(5*60)

	if(_action == "do_struggle"):
		playAnimation(StageScene.WoodenHorseDuo, "struggle", {npc="tavi", npcAction="lightstruggle", bodyState={naked=true}, npcBodyState={naked=true}})
		runScene("StrugglingScene", [true, false], "struggle")
		return

	if(_action == "do_escape"):
		GM.pc.addPain(-GM.pc.getPain())

	if(_action == "fight_skar"):
		runScene("FightScene", ["skar"], "skarfight")

	if(_action == "tavi_pc_escape"):
		processTime(10*60)
		addExperienceToPlayer(100)
		addMessage("Task updated")
		setFlag("TaviModule.Ch4ServedPunishment", true)
		getCharacter("skar").removeAllRestraints()

	if(_action == "begin_skar_torture"):
		getCharacter("skar").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("skar").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))
		processTime(60*5)

	if(_action == "torture_happens"):
		processTime(60*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina)

	if(_action == "torture_ends"):
		processTime(60*90)

	if(_action == "skar_lets_you_go"):
		getCharacter("tavi").removeAllRestraints()
		GM.pc.removeAllRestraints()
		addExperienceToPlayer(100)
		addMessage("Task updated")
		setFlag("TaviModule.Ch4ServedPunishment", true)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "struggle"):
		processTime(5*60)
		GM.pc.addPain(20)
		if(!skar_added_blindfold && GM.pc.getPainLevel() >= 0.5):
			skar_added_blindfold = true
			addMessage("Skar notices you struggling against restraints and blindfolds you!")
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		else:
			addMessage("The wooden horse brings more pain to you")
		setState("woodenhorse_loop")

	if(_tag == "skarfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(100)
			getCharacter("tavi").removeAllRestraints()
			setFlag("TaviModule.Ch4TortureEnd", "escaped")
		else:
			setState("if_lost")
			addExperienceToPlayer(20)
			GM.pc.removeAllRestraints()
			setFlag("TaviModule.Ch4TortureEnd", "lost")
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))

func saveData():
	var data = .saveData()

	data["skar_added_blindfold"] = skar_added_blindfold

	return data

func loadData(data):
	.loadData(data)

	skar_added_blindfold = SAVE.loadVar(data, "skar_added_blindfold", false)
