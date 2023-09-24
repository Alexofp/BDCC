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

		elif (pcChildAmount == 1):
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
	if(state == "start_epilogues"):
		playAnimation(StageScene.Solo, "stand", {pc="captainInmate"})
		saynn("And so.. the two brave inmates found a way to escape from one of the most secure prisons in the entire galaxy while revealing a full truth about the man who created it.")

		saynn("Mr. Wright, driven by his selfish goals, lost everything and became the inmate of his own prison. His creation, BDCC, got changed forever, receiving a new captain who immediately started reforming it into something better.")

		saynn("And yet.. its occupants weren't happy about that. The careful balance of power thinly spread across all inmates and staff got disturbed, leading to more and more riots. New restrictions and regulations were introduced, cementing the idea that the guards and other staff members must always be above the inmates. It made sense on paper for that to be the case..")

		saynn("Turns out.. even the staff members were supporting the idea of.. occasional power exchange. And Mr. Wright was taking full advantage of that, slowly making a name for himself..")

		addButton("Nova", "See what happens to Nova", "ep_nova")
	if(state == "ep_nova"):
		playAnimation(StageScene.Solo, "stand", {pc="nova"})
		saynn("After the captain's accusations, Nova got questioned. The legitimacy of her past parole was put under thorough check.")

		saynn("And yet, nothing incriminating was found. All the records in the BDCC's database were fully clean and authentic. They say that Nova never had any jail time to begin with.")

		saynn("More than that, there were records claiming that Nova had a few uncompleted salary payments stuck in the system. Accounting to exactly.. one million three hundred thousand and sixty nine credits.. a lot of records.")

		saynn("After receiving that money, Nova finally decided to quit her work at BDCC and do something else with her life. She bought a personal space biodome in one of the popular galaxies and created her own little farm called Dawfort Creamery..")

		addButton("Risha", "See what happens to Risha", "ep_risha")
	if(state == "ep_risha"):
		playAnimation(StageScene.Solo, "stand", {pc="risha"})
		saynn("Luckily, the captain decided not to share his and Risha's little agreement. He used it to try and blackmail her.. but at the same time he knew that imprisoning Risha would only lead to more.. interactions with her.. unpleasant ones probably.")

		saynn("And so Risha stayed as a guard at BDCC. The captain and rules have changed.. but her horniness didn't. She was only getting more eager now that any breeding was banned and punishable.")

		saynn("Some say that she was the sole reason for mandatory chastity belt practice.. But that initiative was eventually canceled as it only led to decreased productivity and increased depression levels between staff and inmates..")

		saynn("But Risha was happy. Even if she was losing sometimes, that was just making the moments when she gets to have fun that much more enjoyable.")

		addButton("Skar", "See what happened to Skar..", "ep_skar")
	if(state == "ep_skar"):
		playAnimation(StageScene.Sleeping, "idle", {pc="skar", bodyState={naked=true}})
		saynn("Medical.. A few minutes after the trigger was pulled.")

		saynn("A few surgeons are frantically trying to remove the metal that got fuzed with his flesh.. but that proves to be hard. They have to basically cut parts of his burned flesh out and quickly replace it with some synthetic alternative.")

		saynn("At the same time, another surgeon is replacing the remains of his heart with a prosthetic one before trying to get it running.")

		saynn("Alex, the engineer, is watching the process behind the reinforced glass. Eliza is standing near.")

		saynn("[say=alexrynard]Think they will save him?[/say]")

		saynn("[say=eliza]His body? Easily. Everything but the head can be replaced. But it doesn't matter if his brain is too damaged.[/say]")

		saynn("Skar's prosthetic heart receives a powerful shock through it from a defibrillator.. And then another one.. And another.")

		saynn("[say=alexrynard]So I guess.. that's a no.[/say]")

		saynn("[say=eliza]Every second without oxygen.. some memory within you dies. It could be what you ate for breakfast.. or your favorite color.. or your first awkward kiss.. or it could be the information about how to make your body breathe..[/say]")

		saynn("The doctors keep shocking Skar's new heart.. and yet nothing changes. Some begin to give up already.")

		saynn("[say=alexrynard]That's so.. unfair.[/say]")

		saynn("[say=eliza]Who are we without our memories? Just husks. Skeletons with muscles and various tissues.[/say]")

		saynn("Alex starts scratching his chin after Eliza mentions skeletons. The last surgeon stops trying to save Skar..")

		saynn("[say=eliza]Everything ends eventually. At least he didn't suffer.[/say]")

		saynn("[say=alexrynard]Wait.. I have an idea. We gotta try it.[/say]")

		saynn("[say=eliza]Hm?[/say]")

		saynn("[say=alexrynard]Trust me. Keep him there. I will be right back.[/say]")

		addButton("Continue", "See what happens next", "skar_gets_saved")
	if(state == "skar_gets_saved"):
		playAnimation(StageScene.Sleeping, "idle", {pc="sentinelx", bodyState={naked=true}})
		saynn("Alex returns with plenty of weird prototypes.. and a metal skeleton of a dead android. He rushes into the operating room and starts setting everything up. Eliza walks in, looking quite concerned.")

		saynn("[say=eliza]What are you?..[/say]")

		saynn("[say=alexrynard]Put this on his head.[/say]")

		saynn("Alex gives Eliza some kind.. rough contraption.. that looks like some headphones.. but with way more wires and various electrodes.")

		saynn("[say=eliza]I think you're about to do something very illegal.[/say]")

		saynn("[say=alexrynard]Yeah. I'm about to cheat death.[/say]")

		saynn("[say=eliza]Umm.. how?[/say]")

		saynn("Alex swiftly attaches some wires to the dead android's ports. And then pulls out his datapad before quickly coding something.")

		saynn("[say=alexrynard]In your hands is an old mindtester that was turned into a mindsaver. But now I'm turning it into a mindprogrammer.[/say]")

		saynn("[say=eliza]What?[/say]")

		saynn("[say=alexrynard]Just put it on his head.[/say]")

		saynn("Eliza obeys, carefully placing the weird contraption on the Skar's head before attaching all the electrodes to his skin.")

		saynn("[say=alexrynard]This android has a copy of Skar's mind. It's an old copy.. but I'm coding it to only transfer bits that went necrotic in his real brain.[/say]")

		saynn("[say=eliza]He might not remember everything then.[/say]")

		saynn("[say=alexrynard]Mhm. Worth a try, right?[/say]")

		saynn("Alex quickly finishes programming and presses a button that starts some program.. That causes the contraption on Skar's head to start humming and send various little impulses to his brain.. in a very specific order.")

		saynn("[say=alexrynard]The prototype provides enough electric impulses to jump-start a regeneration in his brain. But get ready to hit his heart again when the process reaches 100%.[/say]")

		saynn("Alex shows Eliza his datapad that has some kind of progress bar on it. Eliza nods and grabs a defibrillator.")

		saynn("[say=eliza]Got it.[/say]")

		saynn("The process is slow.. but steady. It gets scary when the progress bar gets stuck at around 80%.. but eventually it progresses further..")

		saynn("85.. 87.. 90.. 93.. 96.. 99.. 99.. 99.. 100!")

		addButton("Hit it", "Try to save Skar", "skar_wakesup")
	if(state == "skar_wakesup"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="skar", bodyState={naked=true}})
		saynn("A powerful shock goes through Skar's lifeless body.. followed by a loud gasp!")

		saynn("[say=skar]HHHhh..[/say]")

		saynn("The whole room is silent.")

		saynn("Alex and Eliza are watching Skar's mechanical heart start beating.. his lungs working. Skar opens his eyes.")

		saynn("[say=eliza]Are you.. okay?[/say]")

		saynn("Skar.. slowly shakes off the silly contraption off his head.. before sitting up.")

		saynn("He looks around.. watches the surprised faces of Alex and Eliza.. then he looks down at his chest cavity.. which now has more metal than real flesh..")

		saynn("[say=skar]Fuck..[/say]")

		addButton("Continue", "See what happens next", "skar_epilogue")
	if(state == "skar_epilogue"):
		playAnimation(StageScene.Solo, "stand", {pc="skar"})
		saynn("And so, Skar, gets a second chance at life.")

		saynn("He tried to change. He really did. He quit BDCC. Moved to some quiet planet. Found a job as a librarian.")

		saynn("Then.. One day a beautiful lady walks into his library.. Lady that he would start a family with.. Lady that would later make him a bunch of little cute pups.")

		saynn("But.. he was missing something. He always was. And so eventually, he dropped everything.. And returned back to the frontlines.. As a soldier. To serve and fight not for his future.. but for the future of others.")

		addButton("Alex Rynard", "See what happens with him", "ep_alex")
	if(state == "ep_alex"):
		playAnimation(StageScene.Solo, "stand", {pc="alexrynard"})
		saynn("After the captain's ban of androids gets lifted, Alex immediately restarts all of the canceled or stopped projects. At first he had some problems with the law after saving Skar's life.. but soon AlphaCorp decides to drop any charges and instead offers him pretty much unlimited resources.")

		saynn("Working with the machines.. He was happy. Alex was finally working on the projects of his life. And soon he saw results..")

		saynn("Androids.. Mind-preservation.. Bluespace-powered portals.. the guy made several breakthroughs.")

		saynn("His tech was powering the latest killing machines that were helping on the battlefield.. helping to preserve the lives of real soldiers.")

		saynn("Sadly, he never received any credit for anything that he created. It all belonged.. to AlphaCorp. But every accidental death that was caused by his androids and unfinished prototypes.. it put a huge burden on him.")

		saynn("He was trying to create a perfect reality.. but only found himself becoming more broken..")

		addButton("Eliza", "See what happens to Eliza", "ep_eliza")
	if(state == "ep_eliza"):
		playAnimation(StageScene.Solo, "stand", {pc="eliza"})
		saynn("Eliza, seeing no love from her mother, kept delving deeper and deeper into science.. searching for a perfect drug that would solve all her problems.. but never finding one.")

		saynn("After the captain became one of the inmates.. nothing really changed for her. At first.. She just kept experimenting.. even if the range of tests got limited by quite a bit. Eventually, AlphaCorp decided to cancel any experiments that involve test subjects.. And that made Eliza protest.")

		saynn("But.. Finding no support.. She had to quit.")

		saynn("After BDCC, Eliza's mother reached out to her and invited her to work in her lab again.. And so she agreed.. eventually throwing out any great ideas out of her head and becoming an obedient harmless daughter that her mother always wanted her to be.")

		if (tookRahi):
			addButton("Rahi", "See what happened with Rahi", "ep_rahi")
		else:
			addButton("Jaxon", "See what happened with Jaxon", "ep_jaxon")
	if(state == "ep_rahi"):
		playAnimation(StageScene.Duo, ["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {pc="rahi", npc="rahiRabi"})
		saynn("Just as you agreed upon, you and Rahi paid her home planet, Ahdomai, a visit. To tie up the loose ends..")

		saynn("Finding her brother wasn't too hard. Pretty much every junkie in the world knew him.")

		saynn("It's snowing.. just like that day. Rahi breathes in the cold air.. and slowly exhales.")

		saynn("As her brother turns around the corner, Rahi aims a gun at him.")

		saynn("[say=rahi]Missed me, little brother?[/say]")

		saynn("His eyes go big. He tries back away.. but that's when he walks into your chest.. You yoink a gun that he has behind his belt and then shove him back.")

		saynn("[say=rahiRabi]Rahi? I thought you..[/say]")

		saynn("[say=rahi]Went away for good? Nah. You got me into a whole lotta trouble. But I pulled through. No thanks to you.[/say]")

		saynn("[say=rahiRabi]Listen.. You share part of the blame too for what happened. But we can fix everything.[/say]")

		saynn("As Rahi starts slowly stepping towards her brother, Rabi starts reaching for his gun.. the gun that's not there.")

		saynn("[say=rahi]And how are you planning to do that.. my little brother..[/say]")

		saynn("As Rahi cocks her revolver, Rabi suddenly drops to his knees and raises his paws.")

		saynn("[say=rahiRabi]W-we.. l-listen.. j-just.. don't d-do it..[/say]")

		saynn("Rahi walks up to Rabi real close.. and then puts a gun up against his head..")

		saynn("[say=rahi]You can start with simple things. Use your words~.[/say]")

		saynn("He goes through his pockets.. and finds a credit chip. He presents it to Rahi.")

		saynn("[say=rahiRabi]T-this.. fifty key creds.. fifty thousand.. Five times more than we failed to rob.. Is that gonna be e-enough?[/say]")

		saynn("Rahi shows her fangs.. and then grabs Rabi by his clothes.. She leans down closer and closer.. keeping an eye contact.. Her paw squeezing that revolver real tight, pulling attention from what the other one is doing..")

		saynn("Rabi starts sobbing.")

		saynn("[say=rahi]You know.. I was just looking for a simple.. sorry.[/say]")

		saynn("[say=rahiRabi]Y-yes! I'm sorry! I really am. I'm sorry that it happened.[/say]")

		saynn("Rahi's expression softens. She pulls the gun away from her brother's head..")

		saynn("[say=rahi]Thanks. Keep these creds to yourself. I'm more than wealthy now.[/say]")

		saynn("Rabi nods many times.")

		saynn("[say=rahiRabi]Okay.. okay.. Sorry..[/say]")

		saynn("[say=rahi]Take care, brother~.[/say]")

		saynn("Rahi smiles and stands up before walking past him and towards you.")

		saynn("[say=rahi]Let's go~.[/say]")

		saynn("[say=rahiRabi]..fucking bitch..[/say]")

		saynn("Rahi pretends she didn't hear it as you two walk away.")

		saynn("[say=pc]We're not really that wealthy though. Could've used those 50k.[/say]")

		saynn("Rahi giggles as opens her pocket.. revealing that it's stuffed full of similar chips.. At least twenty of them.")

		saynn("[say=rahi]Yes, we're wealthy now~.[/say]")

		saynn("And so now you can afford all of the tuna for Rahi.. thanks to her brother.")

		addButton("Jaxon", "See what happened with Jaxon", "ep_jaxon")
	if(state == "ep_jaxon"):
		if (!getFlag("TaviModule.TaviKilledJaxon")):
			playAnimation(StageScene.Solo, "stand", {pc="jaxontau"})
			saynn("Jaxon returned to his family.. family who was very happy to see him alive after what happened to the Exodus research space station.")

			saynn("But Jaxon wasn't happy. He kept trying to track Tavi down, seeking revenge for his brother. Or at least.. some kind of conclusion. Something.. rather than nothing..")

			saynn("After years of pointless searching.. He finally gave up.. That day is when he saw a new email in his inbox. He opened it..")

			saynn("[say=tavi]Hey. It's Tavi. I don't really know how to write these.. so I will just say.. I'm sorry. I can't say anything good about your brother.. But I won't say anything bad either. I know, this will probably get you angry.. but it pains me too.. not being able to express what I feel. It's a curse. I think I should be grateful. But how can a monster be grateful? Somehow you left me alive. I won't forget that. But you should try to forget me. Try to live.. Not asking you to give up. Just.. live.. You will have to carry your scars.. Just like me.[/say]")

			saynn("Jaxon sighs.. and deletes it.")

		else:
			playAnimation(StageScene.Solo, "stand", {pc="tavi"})
			saynn("Jaxon's wife, Jill, felt destroyed when she found out what happened to him. She decided not to tell the kids and instead only carried the full grief herself.")

			saynn("She knew that it's a dangerous job.. But he convinced her.. Because of the credits that it would bring.. credits that would give their kids a chance at a good future.")

			saynn("Sadly the credits that she was now earning alone weren't enough. Years were passing.. She did her best to pay for her kids' education.. But she was in the negatives all the time.")

			saynn("Luckily, one day, she saw some random bill came in.. Bill that, for some reason, had a negative number on it. They were billed for -123456 credits. Jill thought it was some kind of error. But the credits were actually there, on her account.")

			saynn("It was enough for everything.. almost everything.")

		addButton("You", "What happens to you..", "ep_you")
	if(state == "ep_you"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("And you.. You and Tavi became bounty hunters. Forever criminals. But always acting fair. Your own personal codex is simple.. searching for any injustices in the world.. and fixing them. One by one. Always using the right tool for the right job."+str(" And Rahi is here with you too, always keeping you on track and offering her abilities. Meow." if tookRahi else "")+"")

		saynn("Eventually, you track down every single person who was responsible for creating Tavi and her alikes.")

		saynn("Did you kill them? No. The ones who stopped their research were left alone. Ones who didn't.. got their friendly reminders. Ones who ignored them.. saw Tavi in person. Seeing your product effortlessly stepping into your personal apartment.. changes your perspective quite quickly.")

		saynn("Tavi knows she can't stop it. Dedicating the rest of her life to this constant battle.. It's not worth it. Not while you are there with her..")

		addButton("Continue", "See what happens next", "ep_end")
	if(state == "ep_end"):
		playAnimation(StageScene.Duo, "sit", {npc="tavi"})
		saynn("You sit on the sofa, eating a slice of pizza."+str(" Rahi does the same.. purring while doing so." if tookRahi else "")+" All the while your ship is flying through the vast nothingness. It's.. cool.")

		saynn("Tavi looks at you and smiles.")

		saynn("[say=tavi]What are you thinking about?[/say]")

		saynn("[say=pc]Stuff.[/say]")

		saynn("[say=tavi]So many possibilities, right? I think we should get some clothes.. better furniture.. better equipment.[/say]")

		saynn("[say=pc]Yeah, you do that. I think I wanna rest.. At least for a little bit.[/say]")

		saynn("She chuckles and scritches you under the chin.")

		saynn("[say=tavi]Food made you sleepy~? Sure, dream away. I will get us where we need to be.[/say]")

		saynn("You nod and continue consuming pizza. Your eyes slowly begin to close.. You lie down.."+str(" And let Rahi cuddle up to you" if tookRahi else "")+"")

		saynn("You close your eyes.. And begin dreaming.")

		saynn("- - - - - - - - - - -")

		saynn("Thank you for completing BDCC.")

		saynn("I hope you liked it <3")

		saynn("You can close the game if you want. Or you can press the button and return back to the prison.")

		addButton("Dream", "Broken dreams are still dreams. Heh.", "do_dream")

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

	if(_action == "ep_rahi"):
		getCharacter("rahi").getInventory().clearEquippedItems()
		getCharacter("rahi").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("LeatherJacket"))

	if(_action == "ep_jaxon"):
		getCharacter("rahi").resetEquipment()

	if(_action == "do_dream"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatecollar"))
		getCharacter("tavi").resetEquipment()
		GM.pc.setLocation(GM.pc.getCellLocation())
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["tookRahi"] = tookRahi

	return data

func loadData(data):
	.loadData(data)

	tookRahi = SAVE.loadVar(data, "tookRahi", false)
