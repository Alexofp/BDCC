extends SceneBase

var tookRahi = false

func _init():
	sceneID = "Ch7NoEndingScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {npc="captain", pc="tavi"})
		saynn("You offer Tavi a subtle shake of your head. And she understands the rest.")

		saynn("She smiles before crossing arms and glancing at the smug captain.")

		saynn("[say=tavi]We'd rather not.[/say]")

		saynn("[say=captain]Excuse me?[/say]")

		saynn("He tilts his head ever so slightly, genuinely confused. And Tavi repeats his motion but makes it way more exaggerated.")

		saynn("[say=tavi]No. N. O. We don't want to be your spies. Or agents. Or slaves. Whatever term you prefer today.[/say]")

		saynn("He hums.")

		saynn("[say=captain]Alright. Okay. You two could be a good lesson for the rest.[/say]")

		saynn("He steps behind his desk and presses some buttons.")

		saynn("Soon, 3 guards step into the office. Wow, he must have kept them outside to have a private chat with you. Their figures push you into the middle of the office.")

		addButton("Continue", "See what happens next", "who_guards")
	if(state == "who_guards"):
		addCharacter("risha")
		addCharacter("nova")
		addCharacter("skar")
		playAnimation(StageScene.Duo, "stand", {npc="captain", pc="risha"})
		saynn("Three guards, Risha, Nova and Skar. The most loyal guards that the captain has. They stand behind you, blocking the only exit.")

		saynn("[say=risha]We're here. What are the orders, cap?[/say]")

		saynn("Risha shrugs when she sees Tavi's gaze.")

		saynn("[say=captain]Right. See these two inmates? I don't wanna get my hands dirty. But I want them.. gone.[/say]")

		saynn("Nova's concerned voice can be heard.")

		saynn("[say=nova]Uhh.. What do you mean?[/say]")

		saynn("The captain frowns.")

		saynn("[say=captain]They know too much. And so, they can not stay alive under any circumstances. Kill them. I don't care how. We will say that it was an accident.[/say]")

		saynn("Everyone is quiet for a few seconds.")

		saynn("[say=risha]You're aware that this is illegal?[/say]")

		saynn("[say=nova]Yeah.. we can't do that.[/say]")

		saynn("The captain's eyes turn mean. Firstly, he looks at Risha.")

		saynn("[say=captain]And you fucking inmates to death is legal? I was letting you do that because I need someone to rely on. But you know well enough that you should have been an inmate yourself already. Do you want that? I can arrange.[/say]")

		saynn("[say=risha]No one actually died though.. They all got saved..[/say]")

		saynn("Then he looks at Nova who also refused.")

		saynn("[say=captain]And you. Don't think I don't know your little secret. You're not an ex-inmate. You're an escaped one. All your papers are forged, fake. Do you wanna be put behind bars too?[/say]")

		saynn("[say=nova]W-wait.. n-no..[/say]")

		saynn("Looks like the captain is having problems controlling his staff, huh. Which makes Tavi smile. But then it is Skar's turn.")

		saynn("[say=captain]Show them how it's done, Skar.[/say]")

		saynn("Skar looks at you.. and at a captain. Seconds pass without him doing anything, just standing. And that makes the captain growl.")

		saynn("[say=captain]And you too? I thought they teach you to follow orders in the army. But maybe you got too much fucking brain damage.[/say]")

		saynn("He clenches his fists and looks at the guards.")

		saynn("[say=captain]I'm giving you one last chance. Obey my order. NOW.[/say]")

		saynn("But they don't do anything. For some reason that makes Tavi giggle softly. She reaches for her collar to scratch her itchy fur behind it.")

		saynn("[say=tavi]Looks like you're losing control, cap.[/say]")

		saynn("His lips tremble, his hands reach for his holster, dropping the projector sphere onto his desk. Tension couldn't get any higher.")

		saynn("[say=captain]Fine.. I will do it myself.[/say]")

		saynn("So much for no killing. Everything starts to happen like it's in slow motion. Is that your life flashing before your eyes? No. That's Tavi.. she throws a vial filled with red drug, a second one, at the captain. At the same time as he slides his energy gun out cowboy style and pulls the trigger..")

		saynn("It all led to this. Your only hope is that it won't hurt too much.")

		addButton("Continue", "See what happens next", "skar_saves_tavi")
	if(state == "skar_saves_tavi"):
		playAnimation(StageScene.Solo, "firepistol", {pc="captain"})
		saynn("The red energy beam is faster than anything physical. But you swear you can see it piercing the air at a speed of light.. directed exactly towards Tavi's chest. Center of mass. Just how they teach it.")

		saynn("And just before Tavi is about to receive her unhealthy dose of rays, a mechanical arm reaches for her shoulder.")

		saynn("A bright flash illuminates the space, blinding everyone. Followed by a sound of glass breaking.")

		saynn("Fear. A stifled painful cry. A gasp.")

		addButton("Tavi?", "Time to see the consequences of your actions", "skar_dies")
	if(state == "skar_dies"):
		removeCharacter("skar")
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("Skar, with a gaping burn mark in his chest, starts dropping fast. With his heart destroyed, his eyes quickly become lifeless..")

		saynn("[say=nova]Skar![/say]")

		saynn("Red fumes envelop the captain, leaving him no time to escape. He was about to fire again when the mist clears.. but something seizes the muscles of his hand.. fear.")

		saynn("You look at Tavi.. And see her standing behind Skar, trying to catch him. But all she can do is soften the landing.")

		saynn("[say=risha]Oh shit.[/say]")

		saynn("Tavi checks his pulse.. And looks at Nova and Risha.")

		saynn("[say=tavi]No pulse. Medical. NOW.[/say]")

		saynn("Everyone snaps out of it after that bark, including you. Time resumes its normal flow. You crouch near him and check if you can do anything. The laser beam has melted his chest armor piece, causing it to fuse with the burned flesh of the gaping wound. You haven't seen many wounds like these.. but you can guess that there is no saving him.")

		saynn("[say=nova]Oh no..[/say]")

		saynn("[say=risha]Let me.[/say]")

		saynn("Still, Risha picks Skar's body up into a fireman's carry. And then, with great struggle, proceeds to pull him out of here.")

		saynn("Leaving.. You, Tavi, Nova.. and the captain.")

		saynn("[say=captain]NOVA![/say]")

		addButton("Continue", "See what happens next", "nova_recks_captain")
	if(state == "nova_recks_captain"):
		playAnimation(StageScene.Duo, "stand", {pc="nova", npc="captain", npcAction="struggle_gag"})
		saynn("All eyes get directed towards the captain.. who is.. still standing.. and looking around. The gun slips out of his hands as he starts tugging on his.. invisible collar.")

		saynn("[say=captain]This can't be real. I'm not here. I'm not.. that. Nova, please, tell me who I am.[/say]")

		saynn("Nova raises a brow.")

		saynn("[say=nova]What do you see?[/say]")

		saynn("The guy keeps turning around and fidgeting a lot, struggling to find a place for himself.")

		saynn("[say=captain]A cell! But that's impossible! There shouldn't be a collar around my neck. Inmate uniform.. All of this.. impossible! Just tell me![/say]")

		saynn("His broken dreams became his nightmares.")

		saynn("Nova looks at you and Tavi. Tavi shrugs. Nova sighs.. and then smiles while seeing the captain struggle.")

		saynn("[say=nova]You know what. Yeah, you are, in fact, wearing a collar. You're in prison after all~.[/say]")

		saynn("[say=captain]What?! No. What did I do? That's impossible..[/say]")

		saynn("Nova was about to approach the guy but Tavi tugs her back. So Nova tortures him from afar.")

		saynn("[say=nova]You know exactly what you did, inmate. And that's not how you address a guard~.[/say]")

		saynn("The husky pulls out her shock remote and pretends to press the button. And yet, it causes the captain to start shaking as an imaginary shock courses through him. An undeniable proof.. that everything he sees is real..")

		saynn("[say=captain]ARGH!..[/say]")

		saynn("[say=nova]I prefer Miss Dawfort~. But we will have a lot of time to practice I think.[/say]")

		saynn("The guy keeps trying to take off his collar. But it doesn't give. So he starts tearing off his uniform, revealing a little flashdrive-like token that he is wearing around his neck. That must be what you need..")

		saynn("[say=tavi]Let me..[/say]")

		saynn("Tavi gets up and starts carefully approaching the captain, her paws reaching for that token.")

		addButton("Continue", "See what happens next", "tavi_doesnt_get_scared")
	if(state == "tavi_doesnt_get_scared"):
		playAnimation(StageScene.Duo, "hurt", {pc="tavi", npc="captain", npcAction="shove"})
		saynn("Tavi gets up real close to the hallucinating captain and gets a grasp on that drive. But then he lashes out at her, holding onto her before exhaling red fumes directly into her face.")

		saynn("[say=captain]It's you! I know that it's you who did this. I won't be suffering alone now.[/say]")

		saynn("Tavi tries to break free but the captain has her held tight. She can't avoid it.. so she gives up and breathes in the fumes. The guy's voice sounds crazy by this point. Both you and Nova get extremely concerned.")

		saynn("[say=captain]What are your biggest fears? HUH?[/say]")

		saynn("Tavi looks back at the captain with her mean eyes.. As mean as they can be.. waiting for the drug to take effect..")

		saynn("Time passes.. but nothing changes. Then.. a little smile appears.. her smile.. Tavi freely breathes in and out, her paw holding onto the token.")

		saynn("[say=captain]Wait.. I get it now.. Right.. Of course..[/say]")

		saynn("[say=tavi]Do you?[/say]")

		saynn("[say=captain]That was.. The only way, huh?.. Breaking.. And it's perfectly executed.. Played us all like fools.. Hah..[/say]")

		saynn("[say=tavi]Did I?[/say]")

		saynn("The captain's speech becomes completely garbled as he starts spewing out nonsense.. Tavi rips the token from his neck.. before he finally falls unconscious.")

		addButton("Continue", "See what happens next", "cap_sleep")
	if(state == "cap_sleep"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("Tavi turns around, the flashdrive is in her paws.")

		saynn("[say=pc]What was he talking about?[/say]")

		saynn("The feline.. shrugs.")

		saynn("[say=tavi]All his fears became real. Who knows what he was paranoid about~. Even if he was right, I don't remember it.[/say]")

		saynn("[say=nova]So.. what happens now?[/say]")

		saynn("Tavi's smile shines bright as she finds a little round symbol on the stick. Same symbol as what your collars have.")

		saynn("[say=tavi]Let's start with this~.[/say]")

		addButton("Collars", "Time to get them off", "remove_collars")
	if(state == "remove_collars"):
		playAnimation(StageScene.Hug, "hug", {npc="tavi"})
		saynn("Tavi walks up to you, her free paw landing on your cheek and making you tilt your head slightly.")

		saynn("[say=tavi]Let me..[/say]")

		saynn("She presses the token against your collar.. And seconds later.. Something mechanical unlocks inside it.")

		saynn("After that, Tavi carefully opens it and takes it off. Oh, the feeling.. You almost moan as you finally are able to scritch your neck..")

		saynn("[say=pc]Freedom..[/say]")

		saynn("[say=tavi]And me?..[/say]")

		saynn("You grab the token and do the same, pressing it against the round symbol on her collar, unlocking it.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("She is shivering as her neck becomes free. She starts scritching it.. until you join and do the same, hugging her in the process. Tavi is purring happily..")

		saynn("Nova walks up to the sleeping captain and carefully cuffs him up.")

		saynn("[say=nova]You two are adorable. Don't wanna ruin the moment..[/say]")

		saynn("[say=tavi]We couldn't have done it without you~.[/say]")

		saynn("Tavi hugs Nova as well.")

		saynn("[say=nova]Too bad he killed Skar.. He deserves to be behind bars. What are you gonna do now anyway? I mean like, to the prison.. Are you gonna send Syndicate here? They will probably destroy BDCC.. But I kinda have to run now anyway.. Considering what he knows.[/say]")

		saynn("Tavi raises an eyebrow.")

		saynn("[say=tavi]Oh yeah.. I think I got a better idea~. Give me his laptop.[/say]")

		addButton("Continue", "See what happens next", "nova_talks_with_integrity")
	if(state == "nova_talks_with_integrity"):
		playAnimation(StageScene.Solo, "stand", {pc="nova"})
		saynn("Less than half an hour later..")

		saynn("[sayMale]Wait. Are you implying that the captain of BDCC has gone rogue? Who even are you?[/sayMale]")

		saynn("Nova is standing in front of the laptop, watching the screen that displays a feed of some higher up. You and Tavi stay out of his sight.")

		saynn("[say=nova]Yes. He killed one of the guards and was about to kill more. The guy went nuts. I'm one of the guards who managed to.. pacify and restrain him.[/say]")

		saynn("[sayMale]What the hell is going on there? Why did he do that?[/sayMale]")

		saynn("[say=nova]I don't know, the power must have finally come to his head.[/say]")

		saynn("[sayMale]Alright, we will send a patrol vessel to check it out. Assuming this is not a joke. Because that would end badly for you.[/sayMale]")

		saynn("[say=nova]You know.. I think you might want to send everyone you can..[/say]")

		saynn("[sayMale]Why so?[/sayMale]")

		saynn("[say=nova]There is some very interesting info on this laptop.. It's related to the failed android research initiative.. Seemingly failed.. I sent you a few files. But there is so much more here.. You better come see it yourself~.[/say]")

		saynn("That's when Nova ends the conversation and closes the laptop. She looks at you two and smiles.")

		saynn("[say=nova]You better start preparing~. They will arrive soon. I will get this asshole to the holding cell.[/say]")

		saynn("Tavi nods and hugs her.")

		addButton("Continue", "See what happens next", "near_hangar")
	if(state == "near_hangar"):
		removeCharacter("nova")
		addCharacter("captain")
		addCharacter("intro_detective")
		aimCameraAndSetLocName("intro_nearcaptain")
		playAnimation(StageScene.Solo, "stand", {pc="captain"})
		tookRahi = getFlag("RahiModule.rahiMile8Happened")
		saynn("Nova didn't lie, AlphaCorp squads began arriving one after one another not that long after. The hangar suddenly became a very busy place with spaceships flying in and out at a rapid pace. All the staff get questioned, offices get searched, computers checked, inmates get put into lockdown.")

		saynn("Luckily, you and Tavi found a good spot to hide in before all that happened.. Behind some crates.. but with a great view of arriving ships. You were waiting for a very specific one.. Time passes.. You almost begin to miss having that collar on.")

		var pcChildAmount = GM.CS.getChildrenAmountOf("pc")
		if (pcChildAmount > 1):
			saynn("You also stole all your kids from the nursery while you still could have.. Yes, all "+str(pcChildAmount)+" of them.. All of them are with you.")

		elif(pcChildAmount == 1):
			saynn("You also stole your kid from the nursery while you still could have.")

		if (tookRahi):
			addCharacter("rahi")
			saynn("Rahi is also with you.. because.. obviously. She deserves to be here after everything you went through together.")

			saynn("[say=rahi]Meow.. Thank you for grabbing me..[/say]")

		saynn("[say=tavi]There! That's the one.[/say]")

		saynn("A big luxurious vessel docks with the station. It's so large that it doesn't even fit into the hangar. It has to extend its docking port and let people in through it.")

		saynn("[say=pc]Are you sure?[/say]")

		saynn("[say=tavi]Yes~[/say]")

		saynn("From that spaceship, 3 people descend. Someone who looks like a.. commander.. wearing an official AlphaCorp uniform.. that is white rather than dark blue. And behind him there are 2 officers. One of them looks very familiar..")

		saynn("Meeting them.. are a few guards. But also the captain.. who is chained up.. and not particularly happy about it.")

		saynn("[say=captain]Uncuff me at once! I will not tolerate such treatment of the powerful person on this station![/say]")

		saynn("The commander cuts him off.")

		saynn("[sayMale]You.. were.. the most powerful person. But not anymore.[/sayMale]")

		saynn("[say=captain]Listen, I didn't do anything wrong. You're making a mistake. I gave you the names of inmates and staff who started this. They're responsible! Uncuff me![/say]")

		saynn("[sayMale]Everyone will be questioned, don't worry. Justice might not happen fast. But it will happen eventually. For you.. it will happen now. Detective? I don't think we should drag this out for long. Let's just get it over with now.[/sayMale]")

		saynn("One of his people.. a wolf.. steps in closer. The same wolf..")

		saynn("[say=intro_detective]Right. Given the provided evidence and the additional evidence that was acquired after the full-station search was concluded.. the Intergalactic Court of Justice has found..[/say]")

		saynn("The captain suddenly starts resisting, thrashing against his chains. But the guards hold him tight.")

		saynn("[say=captain]NO! This isn't a court! You can't do this! There Must Be A Trial! I Demand One! SHUT UP.[/say]")

		saynn("[say=intro_detective]The Intergalactic Court of Justice has found you guilty. Guilty of treason.. And a first degree murder. Your punishment.. indefinite sentence. You will be committed to the department of corrections shortly.[/say]")

		saynn("[sayMale]Yes. Right now in fact. Shall we help with the intake procedure? I think we should before a new captain gets assigned. Someone here has brought a gag by the way?[/sayMale]")

		saynn("Huh. That was.. quite fast. But the captain's.. ex-captain's.. story is only starting here.")

		saynn("[say=captain]You.. you will all pay.[/say]")

		saynn("[sayMale]Ridiculous how one man can be so smart.. and yet so dumb.[/sayMale]")

		saynn("After that, he gets gagged by one of the officers before the whole little crowd leaves the hangar, probably to process the new inmate.")

		saynn("[say=tavi]Now is our time~.[/say]")

		if (tookRahi):
			saynn("[say=rahi]Poor captain.. I kinda feel bad for him.[/say]")

		saynn("Tavi pokes your shoulder and then points at the ship.. the big ship.. It's not even that unreasonably huge for three people.. but its yacht-like outline means it is very clunky to fit anywhere.. meaning there aren't any other ships landing or departing.. giving you plenty of time..")

		addButton("Big ship", "Try to get on it", "big_ship")
	if(state == "big_ship"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		aimCameraAndSetLocName("intro_arrive")
		removeCharacter("captain")
		removeCharacter("intro_detective")
		addCharacter("elena")
		saynn("And so you quietly approach the big vessel, using crates to hide from any possible eyes. The docking port wasn't locked so you just follow it.. until you stumble upon the other end of it.. which is actually locked.")

		saynn("[say=tavi]Elena?[/say]")

		saynn("[say=elena]On it![/say]")

		saynn("Tavi brings the projector sphere to the airlock's panel.. and seconds later it gets unlocked..")

		saynn("[say=elena]Done![/say]")

		saynn("The door opens.. revealing a rich interior. The floor beneath your feet is a mosaic of polished marbles, cool to the touch, with some intricate patterns. You start exploring.")

		saynn("Plush cream leather sofas with sapphire-blue accents are placed in the main room. A single private cabin offers a king-sized bed and a spacious shower area.")

		saynn("[say=tavi]Oh yeah.. Look at that..[/say]")

		saynn("[say=pc]So over the top.[/say]")

		saynn("[say=tavi]Yeah, we will be redecorating all of that.[/say]")

		saynn("You step to the cabin. Tavi sits in the leather pilot chair and holds onto the ship's controls.")

		if (tookRahi):
			saynn("Rahi sits on one of the sofas.. and starts stroking her tail.")

		saynn("[say=tavi]Elena.. Cut this ship from the network and give me the controls. We're finally free~.[/say]")

		saynn("The ship's airlock gets locked again and the docking port gets retracted. Tavi carefully starts maneuvering it away from the station.. away from this whole mess.")

		saynn("[say=elena]With pleasure, Tavi! Want me to put on some classical music?[/say]")

		saynn("[say=tavi]Umm.. Nah. Just order a pizza~. What should they put on it, {pc.name}?[/say]")

		if (tookRahi):
			saynn("[say=rahi]I like tuna..[/say]")

		addButton("Pepperoni", "Say this", "pizza_pep")
		addButton("Mushrooms", "Say this", "pizza_mush")
		addButton("Fish", "Say this", "pizza_fish")
		addButton("Cheese", "Say this", "pizza_cheese")
		addButton("Pineapple", "Say this", "pizza_pine")
		if (tookRahi):
			addButton("One tuna One cheese", "Say this", "pizza_tuna")
	if(state == "pizza_tuna"):
		saynn("[say=pc]I say.. Let's order two. One with tuna. And one with extra cheese.[/say]")

		saynn("[say=rahi]Yay..[/say]")

		saynn("[say=tavi]Spoiling the kitty already~? Fine, two pizzas sounds great.[/say]")

		saynn("Tavi carefully avoids all the little asteroids that litter this space.. Until the ship escapes them completely.")

		saynn("The view is amazing.. It might just look like a big black void with little white dots everywhere.. But now you can actually get to each one of them.. You're finally free.. Free to turn your dreams into reality.")

		saynn("[b]THE END.[/b]")

		saynn("[b]Escape Ending.[/b]")

		addButton("Continue..", "See what happens to everyone..", "start_epilogues")
	if(state == "pizza_pep"):
		saynn("[say=pc]I say.. Pepperoni. I forgot how they taste by now.[/say]")

		saynn("[say=tavi]Solid choice~.[/say]")

		if (tookRahi):
			saynn("[say=rahi]Yeah, kitty doesn't mind..[/say]")

		saynn("Tavi carefully avoids all the little asteroids that litter this space.. Until the ship escapes them completely.")

		saynn("The view is amazing.. It might just look like a big black void with little white dots everywhere.. But now you can actually get to each one of them.. You're finally free.. Free to turn your dreams into reality.")

		saynn("[b]THE END.[/b]")

		saynn("[b]Escape Ending.[/b]")

		addButton("Continue..", "See what happens to everyone..", "start_epilogues")
	if(state == "pizza_mush"):
		saynn("[say=pc]I say.. Mushrooms. I forgot how they taste by now.[/say]")

		saynn("[say=tavi]Couldn't say I would agree with you. But anything is better than what we were eating.[/say]")

		if (tookRahi):
			saynn("[say=rahi]Kitty doesn't mind mushrooms..[/say]")

		saynn("Tavi carefully avoids all the little asteroids that litter this space.. Until the ship escapes them completely.")

		saynn("The view is amazing.. It might just look like a big black void with little white dots everywhere.. But now you can actually get to each one of them.. You're finally free.. Free to turn your dreams into reality.")

		saynn("[b]THE END.[/b]")

		saynn("[b]Escape Ending.[/b]")

		addButton("Continue..", "See what happens to everyone..", "start_epilogues")
	if(state == "pizza_fish"):
		saynn("[say=pc]I say.. Fish. I'd love a seafood pizza right about now.[/say]")

		saynn("[say=tavi]Oh yeah, great choice~.[/say]")

		if (tookRahi):
			saynn("[say=rahi]Kitty likes fish..[/say]")

		saynn("Tavi carefully avoids all the little asteroids that litter this space.. Until the ship escapes them completely.")

		saynn("The view is amazing.. It might just look like a big black void with little white dots everywhere.. But now you can actually get to each one of them.. You're finally free.. Free to turn your dreams into reality.")

		saynn("[b]THE END.[/b]")

		saynn("[b]Escape Ending.[/b]")

		addButton("Continue..", "See what happens to everyone..", "start_epilogues")
	if(state == "pizza_cheese"):
		saynn("[say=pc]I say.. cheese. Extra cheese. The more cheese, the better.[/say]")

		saynn("[say=tavi]Oh my~. Yeah, let's do that.[/say]")

		if (tookRahi):
			saynn("[say=rahi]I love cheese..[/say]")

		saynn("Tavi carefully avoids all the little asteroids that litter this space.. Until the ship escapes them completely.")

		saynn("The view is amazing.. It might just look like a big black void with little white dots everywhere.. But now you can actually get to each one of them.. You're finally free.. Free to turn your dreams into reality.")

		saynn("[b]THE END.[/b]")

		saynn("[b]Escape Ending.[/b]")

		addButton("Continue..", "See what happens to everyone..", "start_epilogues")
	if(state == "pizza_pine"):
		saynn("[say=pc]I say.. pineapple. Ever tried a pizza with pineapple?[/say]")

		saynn("[say=tavi]Oh my, so gross~. Let's fucking do this.[/say]")

		if (tookRahi):
			saynn("[say=rahi]I think I will pass..[/say]")

			saynn("[say=tavi]Aww, kitty. We will buy you a small tuna one. How about that?[/say]")

			saynn("[say=rahi]Yay..[/say]")

		saynn("Tavi carefully avoids all the little asteroids that litter this space.. Until the ship escapes them completely.")

		saynn("The view is amazing.. It might just look like a big black void with little white dots everywhere.. But now you can actually get to each one of them.. You're finally free.. Free to turn your dreams into reality.")

		saynn("[b]THE END.[/b]")

		saynn("[b]Escape Ending.[/b]")

		addButton("Continue..", "See what happens to everyone..", "start_epilogues")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "nova_recks_captain"):
		processTime(2*60)

	if(_action == "tavi_doesnt_get_scared"):
		processTime(3*60)

	if(_action == "cap_sleep"):
		processTime(3*60)

	if(_action == "remove_collars"):
		processTime(3*60)
		getCharacter("tavi").getInventory().removeItemFromSlot(InventorySlot.Neck)
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Neck)

	if(_action == "nova_talks_with_integrity"):
		processTime(10*60)

	if(_action == "near_hangar"):
		processTime(60*60)
		getCharacter("captain").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("captain").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "big_ship"):
		processTime(3*60)
		getCharacter("captain").resetEquipment()

	setState(_action)

func saveData():
	var data = .saveData()

	data["tookRahi"] = tookRahi

	return data

func loadData(data):
	.loadData(data)

	tookRahi = SAVE.loadVar(data, "tookRahi", false)
