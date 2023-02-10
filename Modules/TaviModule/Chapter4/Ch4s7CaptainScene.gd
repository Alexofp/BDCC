extends SceneBase

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

		saynn("She snarls at you. But then quickly calms down. Tavi throws her head back, staring at the ceiling.")

		saynn("[say=tavi]My entire life is a mess. Partly because the world is a mess. Our dreams guide us. Our choices define us. But what should you do if the world only gives you bad ones?[/say]")

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

		saynn("[say=captain]I'm serious. Sadly, your methods do go against the AlphaCorp's laws. Which is why you're here, in my possession. I hope at least that part seems fair to you.[/say]")

		saynn("[say=tavi]Eavesdropping can get you in trouble, captain.[/say]")

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

		saynn("[say=captain]Your little personal assistant was quite useful, she helped us to solve a lot of mysteries. We can finally update your confirmed crimes list. And I know more about you now, Tavi. I like learning more about the past lives of inmates here.[/say]")

		saynn("Tavi goes quiet. But you can't stay silent anymore.")

		saynn("[say=pc]Before ordering to kill them? Or brainwashing? Breeding? What is your favorite fetish, captain?[/say]")

		saynn("He directs his attention to you now. And he looks surprised after your words.")

		saynn("[say=captain]Killing? No. Taking away someone's life is the worst thing you can do. It is necessary sometimes, yes. But, as a captain of BDCC, I strive to do better.[/say]")

		saynn("He crosses his arms.")

		saynn("[say=captain]Most of you can never be integrated into a normal society ever again because of your past deeds. But that doesn't mean we should give up on you. I want everyone here to understand how much bad they caused to the world. And then let them spend what time they have to try to fix their mistakes.[/say]")

		saynn("[say=pc]And what if they won't understand? You will brainwash them and start from scratch? Sounds so scummy.[/say]")

		saynn("Captain gets quiet for a few seconds, his canine eyes watching you and Tavi. He leans against the glass, getting closer to you.")

		saynn("[say=captain]Brainwashing? Hah. Where did you get that idea from? Brainwashing is pretty similar to killing someone, their soul is dead even if their body is still alive. No. Brainwashing is too easy, my friend. I prefer to show people why they are wrong and hope that they change. I believe in second and third chances.[/say]")

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

		saynn("[say=captain]I.. I don't have sex with inmates or staff. I won't deny though, I got a little bit spoiled by all the inmates who beg to be my pets. There is something nice about seeing them humiliate themselves. It is fun to see how much they enjoy it too.[/say]")

		saynn("He scratches behind his head.")

		saynn("[say=captain]BDCC is a very.. disconnected place, as you have already learned. That allows me to.. take some liberties with how I run things.[/say]")

		addButton("Continue", "See what happens next", "captain_explains")
	if(state == "breed_punishments"):
		saynn("[say=pc]You use it as a punishment? The staff can go ahead and have fun with someone unruly against their will? Helps to keep staff morale high and inmate's will low?[/say]")

		saynn("The captain smiles.")

		saynn("[say=captain]I won't lie, you got me there. Staff do use it as a punishment sometimes. But sex can be used for so much more than that. It can help to keep inmates happy too. Happy, not suppressed. BDCC is a very.. disconnected place, as you have already learned. That allows me to.. take some liberties with how I run things.[/say]")

		addButton("Continue", "See what happens next", "captain_explains")
	if(state == "captain_explains"):
		saynn("[say=captain]This prison is not a heaven and it's not trying to be. But, I think, the ability to.. have intimate moments.. balances things out. It makes staff happier, it makes inmates more obedient. And it brings value to AlphaCorp, a lot of value.[/say]")

		saynn("[say=pc]What do you mean?[/say]")

		saynn("The captain stares you in the eyes.")

		saynn("[say=captain]It's a self-regulating machine. The balance.. is at its core. Convicted criminals here are able to offset their bad deeds.. by doing things that they enjoy. And giving value back to the society in the process.[/say]")

		saynn("Tavi suddenly realizes something.")

		saynn("[say=tavi]You're making soldiers out of kids! Doing the same fucking thing! You're ruining lives! All so your fucking war can continue for as long as possible![/say]")

		saynn("The captain lets Tavi yell at him. The feline growls and struggles against the chains harder. The captain continues to speak with a normal voice, even if with a slightly more cunning tone.")

		saynn("[say=captain]As much as it might seem like that, it's really not, Tavi. I'm not making soldiers out of anyone. Yes, we do have the facilities here that allow us to teach the new generations. We teach kids all sorts of professions. Doctors, engineers, scientists, pilots and of course soldiers too. They have a choice, Tavi. We don't take away their childhood, we make it as best as we can.[/say]")

		saynn("Tavi continues to snarl at the captain even if not as eagerly.")

		saynn("[say=captain]You all heard it a million times, the war calls for more heroes, it's true. But once AlphaCorp wins, all of these kids will be free to do whatever they want with their lives. They won't be.. constrained.. by what their parents did. All of them will be valuable members of society. Each one will have a great future ahead.[/say]")

		saynn("[say=pc]What if it doesn't? What if the war is never gonna end?[/say]")

		saynn("The captain shrugs.")

		saynn("[say=captain]That's why we need every advantage we can get. But my methods are entirely ethical. It's pretty much how nature works. Although, we do try to keep kids away from their parents. For obvious reasons.[/say]")

		saynn("The captain looks at Tavi next.")

		saynn("[say=captain]And if I was you, I'd really think about what I did. I'm giving you one last chance. One last chance before I move on to more.. drastic measures. Someone else in my shoes would space you a long time ago and be done with you. But for now.. For now this will do I think. You both need to be punished after all.[/say]")

		saynn("Tavi glares at him. All the while the captain looks at someone you can't see and gestures to them to step closer.")

		addButton("Continue", "See what happens next", "skar_walkin")
	if(state == "skar_walkin"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="skar", bodyState={naked=true}})
		addCharacter("skar")
		saynn("Skar walks in while also bringing some kind of contraption. The main part of this contraption is a long.. seat.. of an uncomfortable triangular shape.")

		saynn("[say=captain]A few hours on a wooden horse should make you reconsider your behavior. Skar here will ensure you understand the reasons behind your punishment. In case it isn't obvious. Right, Skar?[/say]")

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

		saynn("[say=tavi]Sure. And I did it because I wanted to. I didn't follow any orders. I wasn't forced to see my squad get wiped out on the battlefield because of some old guy's mistake.[/say]")

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

		saynn("[say=tavi]They.. are.. fuck.. What happened to.. using words.. instead of weapons.. Just.. Fucking.. communicate more.. A little less stress.. maybe?..[/say]")

		saynn("[say=skar]Some people only understand force.[/say]")

		saynn("[say=tavi]Drones.. Virtual fights.. Online battles.. Otherwise.. more kids will go through the same.. as you.. Same war stories..[/say]")

		saynn("Skar looks at Tavi. But then lowers his gaze. All the while Tavi is busy panting and trying to not fidget too much. You're both failing at that though, the torture machine does its job, bringing your privates lots of discomfort and pain.")

		addButton("Continue", "See what happens next", "skar_gets_confused")
	if(state == "skar_gets_confused"):
		saynn("A few minutes pass. But it feels like forever. A few hours of this? What is the captain thinking?")

		saynn("Tavi is unable to taunt the guy anymore, she only hisses and groans as her pussy begins to shine brighter, the sensitive skin there got very irritated by now. She desperately tries to pull herself up by the chains but that only makes it worse when eventually has to let go and have her pussy tortured harder.")

		saynn("She had the right idea though. You probably can escape that way but first you gotta loosen the cuffs.")

		saynn("Skar is busy contemplating his life choices. Now would be the best time to escape.. Or give up completely.")

		if (GM.pc.hasVagina()):
			saynn("You gotta do it fast though.. Your pussy is beginning to feel irritated too.")

		else:
			saynn("You gotta do it fast though.. The skin of your taint is beginning to feel irritated too.")

		addButton("Continue", "See what happens next", "struggle_intro")

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

	setState(_action)
