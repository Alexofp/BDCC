extends SceneBase

var branded = false
var pierced = false

func _init():
	sceneID = "rahiMilestone8Scene"

func _reactInit():
	var isWedding = getFlag("RahiModule.rahiMile7Proposed", false)
	if(isWedding):
		setState("wedding")
	else:
		setState("branding")

func _run():
	if(state == ""):
		saynn("you shouldn't see this")

	if(state == "wedding"):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand"})
		addCharacter("eliza")
		saynn("You were about to give your kitty her task for today when you were suddenly interrupted by Eliza walking in on you.")

		saynn("[say=eliza]It's time.[/say]")

		saynn("Rahi looks at the doctor. Then she looks at you. Kitty is fidgeting nervously on her bed.")

		saynn("[say=pc]Well.. what should we do?[/say]")

		saynn("Eliza starts pushing you out of the cell.")

		saynn("[say=eliza]Go waste some time, we need to prepare.[/say]")

		saynn("Rahi's big kitty eyes track you leaving until Eliza blocks the sight with herself.")

		saynn("[say=eliza]Alright, let's begin..[/say]")

		saynn("With nothing better to do.. Might as well give them some time.")

		addButton("Go idle", "Spend some time", "go_near_stocks")
	if(state == "go_near_stocks"):
		removeCharacter("eliza")
		removeCharacter("rahi")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("main_bench2")
		saynn("You step out into the main hall and sit on one of the benches. The one that Rahi uses sometimes.")

		saynn("The air is filled with excitement. You can't help but to feel slightly nervous too.")

		saynn("Minutes pass, each one getting dragged on for a while by all the thoughts in your head.")

		saynn("Your eyes spot a few staff members and inmates heading towards the yard area. Huh. Someone's approaching.")

		saynn("[say=captain]Today is a big day, isn't it, inmate. How do you feel?[/say]")

		addButton("Continue", "See what happens next", "captain_steps_in")
	if(state == "captain_steps_in"):
		addCharacter("captain")
		addCharacter("risha")
		playAnimation(StageScene.Duo, "sit", {npc="captain", npcAction="stand"})
		saynn("It's the captain! Guarded by one of his personal pets.")

		saynn("[say=captain]Even though all of you have taken a wrong turn somewhere in your life, who am I to say no when two souls decide to be together. Love is one of the strongest feelings after all. It creates bonds tougher than any chains.[/say]")

		saynn("The captain offers you a kind smile. The guard stares at you intently but doesn't say anything.")

		saynn("[say=pc]Why are you here?[/say]")

		saynn("He chuckles.")

		saynn("[say=captain]Who do you think is gonna be the officiant? When doctor Quinn asked me, I knew I couldn't pass up such a rare opportunity.[/say]")

		saynn("His authoritative hand lands on your shoulder.")

		saynn("[say=captain]Let's go, inmate. I think everyone's gathering around already.[/say]")

		saynn("[say=pc]Everyone?[/say]")

		saynn("He taps on your back, inviting to follow.")

		saynn("[say=captain]Not the whole station of course but I think we will have at least a little crowd.[/say]")

		addButton("Follow", "See where he brings you", "pc_arrives_waterfall")
	if(state == "pc_arrives_waterfall"):
		playAnimation(StageScene.Duo, "stand", {npc="captain", npcAction="stand"})
		aimCameraAndSetLocName("yard_waterfall")
		addCharacter("avy")
		saynn("You follow the captain to the very familiar area. The waterfall. This time it is looking slightly more.. festive. A few colorful balloons help set the mood.")

		saynn("There are at least a dozen people around already, mostly just random observers. Captain brings you out into the main spot and stands near. Risha finds someone in the crowd and joins them.")

		saynn("[say=captain]It's not a chapel but.. It's something, isn't it? I think it's nice here.[/say]")

		saynn("So many memories attached with this place. Hard to believe that this is happening.")

		saynn("The captain directs his attention to people around.")

		saynn("[say=captain]Thank you all for being here today. The ritual will begin soon.[/say]")

		saynn("You hold onto the second ring that Eliza gave you.")

		saynn("Oh, there she is by the way.")

		addButton("Continue", "See what happens next", "rahi_eliza_walk_in")
	if(state == "rahi_eliza_walk_in"):
		addCharacter("rahi")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("Eliza slowly enters the scene. Behind her is Rahi that she is holding hands with. And wow, Rahi seems to be wearing a fancy transparent veil. Brown kitty notices the little crowd around and blushes deeply.")

		saynn("Eliza brings Rahi close to you and joins the observers.")

		saynn("As you make eye contact with her, kitty tilts her head down, her paws grab her fluffy tail and nervously stroke it. The captain smiles before clearing his throat.")

		saynn("[say=captain]Inmates and staff, thank you all for coming today to share this wonderful occasion with us.[/say]")

		saynn("You look around. Your spot a few familiar faces. Eliza claps her hands softly. Risha and Avy standing near, discussing something. Everyone else is kinda of a blur.")

		saynn("[say=captain]Today we are here together to unite the lives of two inmates, inmate number 12406 and inmate number {pc.inmateNumber}, in marriage.[/say]")

		saynn("The captain takes a short pause.")

		saynn("[say=captain]They have faced many challenges, but their love has endured, and today they will make their commitment to each other official.[/say]")

		saynn("Rahi's eyes already become watery, she brushes her tail more.")

		saynn("The captain reaches his open palm towards you slightly.")

		saynn("[say=captain]Do you {pc.name}, take this woman to be your lawfully wedded wife, to live together in harmony, to love her, comfort her, in good times and not so good times, to have and to hold, from this day forward, as long as you both shall live?[/say]")

		addButton("I do", "Commit to it", "say_i_do")
		addDisabledButton("I don't", "That would break kitty's heart")
	if(state == "say_i_do"):
		saynn("[say=pc]I do.[/say]")

		saynn("Your answer was snappy and bold. Rahi stops playing with her tail and slowly raises her gaze, looking at you now.")

		saynn("The captain reaches his palm towards the kitty now.")

		saynn("[say=captain]Do you Rahi, take this inmate to be your lawfully wedded "+str("wife" if GM.pc.getGender() == Gender.Female else "husband")+", to live together in harmony, to love {pc.him}, comfort {pc.him}, in good times and not so good times, to have and to hold, from this day forward, as long as you both shall live?[/say]")

		saynn("She inhales air audibly, taking her time.")

		saynn("[say=rahi]I do..[/say]")

		saynn("After her answer, her expression quickly changes to smiling, tears of happiness stream down her cheeks.")

		saynn("[say=captain]Rahi and {pc.name} have chosen rings to exchange with each other as a symbol of their unending love. As you place the ring on Rahi's finger, please repeat after me. With this ring, I pledge you my love now and forever.[/say]")

		saynn("You begin putting on the ring on Rahi's fourth digit on her left paw that shivers ever so slightly.")

		saynn("[say=pc]With this ring, I pledge you my love now and forever.[/say]")

		saynn("Captain looks at Rahi.")

		saynn("[say=captain]As you place the ring on {pc.name}'s finger, please repeat after me. With this ring, I pledge you my love now and forever.[/say]")

		saynn("You reach your left hand out. Rahi slowly slides the ring onto your fourth digit. It's a simple one but the memories that it holds.. That's what makes it the most valuable object in the world.")

		saynn("[say=rahi]With this ring, I.. pledge you my love now and forever.[/say]")

		saynn("After putting the rings on each other's fingers, you continue to hold hands. Rahi looks you into the eyes.")

		saynn("[say=captain]By the authority vested in me by AlphaCorp, I now pronounce you "+str("wife" if GM.pc.getGender() == Gender.Female else "husband")+" and wife. You may kiss.[/say]")

		addButton("Kiss", "Might as well..", "do_kiss")
	if(state == "do_kiss"):
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		saynn("You carefully lift Rahi's veil and kiss her. She wraps her paws around you and extends it, actively kissing you back.")

		saynn("Everyone in the crowd begins to clap their hands. Everyone.. expect Avy and Risha. One of them has her arms crossed and another rolls her eyes. Who cares about them though when you are embracing Rahi. She melts from the long kiss, her legs shake slightly. But you support her nicely.")

		saynn("Feels nice to be married..")

		addButton("Continue", "See what happens next", "continue_hug")
	if(state == "continue_hug"):
		saynn("You continue to hug and kiss each other. Minutes feel like seconds when Rahi is near.")

		saynn("After the ceremony is over, inmates and staff begin to slowly disperse.")

		saynn("[say=rahi]It won't get any better than this..[/say]")

		saynn("You chuckle softly.")

		saynn("[say=pc]What makes you think that?[/say]")

		saynn("[say=rahi]Because this feels too good..[/say]")

		saynn("Rahi nuzzles your cheeks. The captain nods and leaves his spot to have a chat with Eliza.")

		saynn("[say=rahi]You can continue to give me tasks.. I like doing them.. and failing at them is fun too..[/say]")

		saynn("[say=pc]Sure, Rahi. The ceremony is over.. Let's go cuddle.[/say]")

		saynn("Rahi nods and holds onto your arm while you two proceed to leave. While walking past Avy and Risha you can't help but to hear their exchange. Risha asks first.")

		saynn("[say=risha]Think it will last?[/say]")

		saynn("Avy reponds.")

		saynn("[say=avy]It will. For a bit. I bet the slut will realize the mistake and marry my dick instead. Just give it time.[/say]")

		saynn("[say=risha]Why wait though?[/say]")

		saynn("Avy raises her brow.")

		saynn("That's when you leave..")

		addButton("Continue", "See what happens next", "cuddle_in_cell_after_wedding")
	if(state == "cuddle_in_cell_after_wedding"):
		removeCharacter("captain")
		removeCharacter("risha")
		removeCharacter("avy")
		removeCharacter("eliza")
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		playAnimation(StageScene.Cuddling, "idle", {npc="rahi"})
		saynn("You two spend some time together in Rahi's cell, cuddling and staring at your new rings.")

		saynn("[say=rahi]Thank you.. for everything..[/say]")

		saynn("You land a little kiss on Rahi's cheek.")

		saynn("[say=pc]You should stop saying that, kitty. This isn't over. The opposite in fact. This is a new page. For both of us.[/say]")

		saynn("She nods and just rests in your hands.")

		saynn("Time passes. Feels so good..")

		saynn("[say=rahi]If we ever get out of here.. will you help me with something?.. Something very important.[/say]")

		saynn("Her voice.. She is hopeful.")

		saynn("[say=pc]What would that be, kitty?[/say]")

		saynn("[say=rahi]It's about my brother's fate.[/say]")

		saynn("Her tone changes during that sentence.. becoming.. rather intimidating.")

		saynn("You spend the rest of your free time discussing it.")

		saynn("(( This is where Rahi's content ends. Thank you for playing :3 ))")
		addButton("Continue", "See what happens next", "resetequipandend")
	if(state == "branding"):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand"})
		addCharacter("eliza")
		saynn("You were about to approach your kitty to give her today's task when doctor Quinn suddenly steps into the room.")

		saynn("[say=eliza]Everything is ready.[/say]")

		saynn("Rahi looks at both of you with big kitty eyes.")

		saynn("[say=rahi]What is?..[/say]")

		saynn("You reach your hands out to Rahi's hair and brush it.")

		saynn("[say=pc]It's time to make your status official. Understand me, kitty?[/say]")

		saynn("You put your hand on her chin and make her look at you. Rahi nods subtly. Your hand slides down to her collar and tugs on it, inviting the feline to get up off of her bed.")

		addButton("Follow Eliza", "See where she brings you", "follow_eliza_to_sins_room")
	if(state == "follow_eliza_to_sins_room"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		aimCameraAndSetLocName("medical_confessionary")
		saynn("You and Rahi follow the doctor to the medical wing. She uses her badge to open the staff-only doors and invites you into a dimly-lit room. A room where Eliza told you about Rahi's now solved problems. A room where everything began.")

		saynn("[say=eliza]Inmates usually don't claim each other. Well, no, they do actually. They leave scars.[/say]")

		saynn("Eliza goes ahead and grabs a small long box before placing it on the table and opening. Inside are a few tools and what looks to be a metal rod with a special tip, a branding iron. Kitty holds onto your arm.")

		saynn("[say=eliza]But scars.. are so.. animalistic. And we're not animals, are we?[/say]")

		saynn("Eliza puts on some latex gloves and grabs the branding iron. She also grabs one of the tools which seems to be a blow torch.")

		saynn("[say=eliza]I find branding to be much more.. hot.. literally. No one can mistake a branded slave. But..[/say]")

		saynn("She puts the tools back and grabs another one. This one seems to be a piercing gun.")

		saynn("[say=eliza]If that's too much for you, this would be a better choice. Ears, nose, nipples, clit.. I prefer the last one of course. And that's what I suggest to you. That ring I gave you would be the perfect piercing.[/say]")

		saynn("[say=rahi]Ring?..[/say]")

		saynn("Rahi tilts her head slightly. You turn towards her and grab her by the ponytail.")

		saynn("[say=pc]Yes, a ring. Two of them in fact. Wedding rings. But.. Why would I marry my slave? I much prefer to use it to claim you. Do you have something against that, kitty?[/say]")

		saynn("Your kitty lowers her head. Her posture is incredibly submissive while her eyes.. have a little spark in them.")

		saynn("[say=rahi]Your slave doesn't have anything against that, {rahiMaster}.. I'd love to be claimed.. by you..[/say]")

		addButton("Undress her", "Prepare kitty for the ceremony", "do_undress_kitty")
	if(state == "do_undress_kitty"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="pc", pc="rahi", bodyState={naked=true}})
		saynn("You unbutton kitty's shirt and take it off her, exposing the nice bouncy breasts with pink perky nipples"+str(" that seem to be leaking breastmilk the more you touch them" if getCharacter("rahi").canBeMilked() else "")+". Rahi stands completely still and breathes warmly.")

		saynn("After exposing her chest, you move on to her shorts, pulling them down and revealing your slave's tight pink pussy. The cryopod treatment that your kitty went through healed any and all little bruises and other signs of abuse, Rahi's body looks pristine, beautiful.")

		saynn("[say=pc]Time to make you helpless.[/say]")

		saynn("You position the kitty under one of the meta hooks that are attached to the ceiling. You grab some tight cuffs and put them on Rahi's wrists before chaining them together and hooking her up, making it so she can barely touch the floor with her toes. You can't help but to be reminded of your first heist.")

		saynn("Rahi wiggles slightly, all her private bits are on display. Eliza is just standing nearby, making sure everything is going smoothly.")

		saynn("You bring the little table with the tools closer and look at them. The tip of the branding iron says \"Property of {pc.name}\" in a fancy cursive font. There are no painkillers provided. But the more you think about it.. Good slaves must endure the pain to show their devotion.")

		saynn("Still, maybe less is better? Or maybe you should do both, brand your kitty and put a piercing on her clit.")

		addButton("Just branding", "Only use the branding iron on Rahi", "only_branding")
		addButton("Just piercing", "Only use the piercing tool on Rahi's clit", "only_piercing")
		addButton("Both", "Use the both tools on Rahi", "branding_and_piercing")
	if(state == "do_brand"):
		saynn("Well, no point in pushing away the inevitable. You grab the cold branding iron and begin heating its tip up with the blowtorch. Rahi gulps audibly while watching the process.")

		saynn("[say=pc]Scared?[/say]")

		saynn("[say=rahi]A little bit.. will it hurt?..[/say]")

		saynn("You nod. The branding iron is already glowing red. It's so hot that even the handle is now hard to hold. Rahi's heart is pounding when you turn off the torch and approach the kitty, looking for a good spot.")

		saynn("[say=pc]I'm gonna brand your crotch. Above the pussy. When anyone sees it, they will know who you belong to. Right, kitty?[/say]")

		saynn("The heat emanating from the branding iron makes kitty wiggle and try to avoid it.")

		saynn("[say=rahi]Y-yes.. {rahiMaster}.. She.. I mean.. I.. belong to you..[/say]")

		saynn("Rahi lets out a [b]loud cry[/b] when you press the red-hot branding iron against her crotch. The smell of burning flesh and fur quickly fills the air. Poor kitty is arching her back and shakes a lot but the restraints help to keep her steady. Eliza winces while you hold the iron in place for at least several seconds.")

		saynn("The pain is intense, Rahi keeps hissing and making noises of pain as the branding iron burns the many letters into her skin. She could feel the mark being etched into her flesh, a permanent reminder of her ownership by you.")

		saynn("After that, you slowly pull the iron away, revealing.. the results. \"Property of {pc.name}\" is now forever engraved into Rahi's crotch. It looks.. neat.")

		saynn("Kitty is panting heavily.")

		saynn("[say=rahi]Is it d-done?..[/say]")

		saynn("[say=pc]It is.[/say]")

		saynn("[say=rahi]I'm now.. a branded slave.. Ah..[/say]")

		if (pierced):
			saynn("You put the iron away and reach for the piercing tool instead.")

			saynn("[say=pc]But we're not done yet..[/say]")

			saynn("Kitty sees your intentions and lowers her head, staring at the floor.")

			saynn("[say=rahi]Of c-course..[/say]")

			addButton("Continue", "See what happens next", "do_pierce")
		else:
			saynn("You put the iron away and carefully hug the kitty.")

			saynn("[say=pc]That's it, kitty.. This will be a reminder of your spot in life.[/say]")

			saynn("[say=rahi]It's a good s-spot..[/say]")

			addButton("Continue", "See what happens next", "branding_aftercare")
	if(state == "do_pierce"):
		if (branded):
			saynn("You wait for the kitty to calm down after the branding iron treatment. Then you grab the piercing gun and approach her.")

		else:
			saynn("You decide not to brand your kitty. But piercing her clit.. that sounds like something that you wanna do. You grab the piercing gun and approach her.")

		saynn("The piercing tool looks like.. a pistol of sorts. It has a handle and a trigger but the barrel is replaced with a sharp needle.")

		if (branded):
			saynn("[say=rahi]This will hurt too, right?..[/say]")

			saynn("[say=pc]It will. But less.[/say]")

			saynn("[say=rahi]Good..[/say]")

		else:
			saynn("[say=rahi]It will hurt.. right?..[/say]")

			saynn("[say=pc]Yes. But not that much.[/say]")

		saynn("You carefully move the tool to Rahi's crotch and press it against her sensitive bean. You can feel her shivering.. and then taking a deep breath.. her whole body tensing up.")

		saynn("You press on the trigger. Rahi felt a sharp pinch, and then a burning sensation as the needle went through her flesh. She gasps in pain and shuts her watery eyes, trying to focus on enduring the uncomfortable sensations.")

		saynn("At least that was quick. Your kitty now has a little hole in her clit.")

		saynn("[say=rahi]T-that's it?..[/say]")

		saynn("[say=pc]Almost.[/say]")

		saynn("You produce the little box with the rings. You only need one so you take one. It's just a plain metal ring. But it has the words 'To remember. Forever and always.' inscribed on it. Pretty fitting.")

		saynn("Kitty hisses slightly while you put the little ring through the new hole. Eliza walks up to you and offers you a little tag. It's a metal circle with a little hole on top. It says \"{pc.name}'s Property\". Sounds about right.")

		saynn("[say=pc]Thanks, you're very thoughtful, doctor.[/say]")

		saynn("Eliza chuckles while you attach the tag to Rahi's clit piercing. It dangles a little bit while you play with it. Cute and sexy.")

		saynn("[say=eliza]That's why I'm here. I like what you did.[/say]")

		saynn("Rahi finally opens her eyes. She looks down at her pierced clit.. and smiles.")

		saynn("[say=rahi]I like it a lot.. Still hurts a bit..[/say]")

		saynn("[say=pc]But now you are forever mine, kitty.[/say]")

		addButton("Continue", "See what happens next", "branding_aftercare")
	if(state == "branding_aftercare"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true}})
		saynn("You uncuff the kitty and help not to fall. Eliza puts all the tools away and waits near the exit.")

		saynn("[say=eliza]I suggest.. not to touch down there.. for at least an hour. That includes clothes.[/say]")

		saynn("[say=rahi]But..[/say]")

		saynn("You grab Rahi's uniform and store it. And instead, you produce a leash.")

		saynn("[say=pc]Sure. Kitty is fine with being naked, right?[/say]")

		saynn("[say=rahi]Yes, {rahiMaster}..[/say]")

		saynn("Rahi lets you put her on a leash.")

		saynn("[say=eliza]Have fun.[/say]")

		addButton("Parade Rahi", "Walk the naked Rahi through the station", "parade_rahi")
	if(state == "parade_rahi"):
		removeCharacter("eliza")
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("You hold Rahi's leash as you leave the medical wing and step into the elevator. Every nurse is staring at your claimed kitty which makes her blush.")

		saynn("As you step out into the main hall of the prison, Rahi begins putting some strain on the leash. But a few tugs and she continues to follow like a good kitty.")

		saynn("[say=pc]You're my kitty, I wanna show you.[/say]")

		saynn("[say=rahi]And I'm proud to be your kitty.. This is just a little embarrassing..[/say]")

		saynn("Inmates and staff stare at you two. Some of their stares are hungry.")

		saynn("You walk your kitty past Risha and Avy and capture their attention. Your ears pick up on their chatter.")

		addButton("Continue", "See what happens next", "listen_on_avy_risha_during_parade")
	if(state == "listen_on_avy_risha_during_parade"):
		addCharacter("risha")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {pc="avy", npc="risha"})
		saynn("Risha taps on Avy's shoulder.")

		if (branded):
			saynn("[say=risha]Look who's got turned into a slave. Branded and everything.[/say]")

		else:
			saynn("[say=risha]Look who's got turned into a slave. Cute clit piercing.[/say]")

		saynn("Avy hums and crosses her arms.")

		saynn("[say=avy]Huh. I bet the slut will realize the mistake soon and beg to be enslaved to my dick instead.[/say]")

		saynn("[say=risha]Why wait though?[/say]")

		saynn("Avy raises her brow.")

		saynn("That's when you leave.")

		addButton("Continue", "See what happens next", "cuddle_in_cell_after_branding")
	if(state == "cuddle_in_cell_after_branding"):
		removeCharacter("risha")
		removeCharacter("avy")
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		playAnimation(StageScene.Cuddling, "idle", {npc="rahi", npcBodyState={naked=true}})
		saynn("You two spend some time together in Rahi's cell, cuddling on the bed after the ritual.")

		saynn("[say=rahi]Thank you.. for showing me my place.. Teaching me.. Training me..[/say]")

		saynn("You land a little kiss on Rahi's cheek.")

		saynn("[say=pc]And I will continue doing that.[/say]")

		saynn("She nods and just rests in your hands.")

		saynn("Time passes. Feels nice.. Kitty decides to ask a random question.")

		saynn("[say=rahi]If we ever get out of here.. will you help me with something?.. Something very important.[/say]")

		saynn("Her voice.. She is hopeful.")

		saynn("[say=pc]What would that be, kitty?[/say]")

		saynn("[say=rahi]It's about my brother's fate.[/say]")

		saynn("Her tone changes during that sentence.. becoming.. rather intimidating.")

		saynn("You spend the rest of your free time discussing it.")

		saynn("(( This is where Rahi's content ends. Thank you for playing :3 ))")
		addButton("Continue", "See what happens next", "resetequipandend")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_near_stocks"):
		processTime(10*60)

	if(_action == "captain_steps_in"):
		processTime(3*60)

	if(_action == "pc_arrives_waterfall"):
		processTime(3*60)

	if(_action == "rahi_eliza_walk_in"):
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("WeddingVeil"))
		getCharacter("rahi").afterTakingAShower()

	if(_action == "say_i_do"):
		GM.pc.getInventory().forceEquipStoreOther(GlobalRegistry.createItem("RingRahi"))

	if(_action == "continue_hug"):
		processTime(5*60)

	if(_action == "cuddle_in_cell_after_wedding"):
		processTime(60*60)
		addExperienceToPlayer(500)
		setFlag("RahiModule.rahiMile8Happened", true)
		addMessage("Task completed")

	if(_action == "resetequipandend"):
		getCharacter("rahi").resetEquipment()
		endScene()
		return

	if(_action == "follow_eliza_to_sins_room"):
		processTime(10*60)

	if(_action == "only_branding"):
		branded = true
		setFlag("RahiModule.rahiMile8Branded", true)
		setFlag("RahiModule.rahiMile8Pierced", false)
		setState("do_brand")
		return

	if(_action == "only_piercing"):
		pierced = true
		setFlag("RahiModule.rahiMile8Branded", false)
		setFlag("RahiModule.rahiMile8Pierced", true)
		setState("do_pierce")
		return

	if(_action == "branding_and_piercing"):
		branded = true
		pierced = true
		setFlag("RahiModule.rahiMile8Branded", true)
		setFlag("RahiModule.rahiMile8Pierced", true)
		setState("do_brand")
		return

	if(_action == "cuddle_in_cell_after_branding"):
		processTime(60*60)
		addExperienceToPlayer(500)
		setFlag("RahiModule.rahiMile8Happened", true)
		addMessage("Task completed")
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("RingRahi"))
		addMessage("You kept the second ring")

	setState(_action)

func saveData():
	var data = .saveData()

	data["branded"] = branded
	data["pierced"] = pierced

	return data

func loadData(data):
	.loadData(data)

	branded = SAVE.loadVar(data, "branded", false)
	pierced = SAVE.loadVar(data, "pierced", false)

func getDevCommentary():
	return "I'm sorry I can't really add dev commentaries to each scene. I'm writing this literally hours before the next release x3. But hopefully you liked Rahi's content. I sure did enjoy writing it. I really enjoy when I get to explore one of my characters. That is, when I have a good direction for them x3. Tavi and Rahi clicked for me. Other characters are yet to do that.\n\nWill there be more content dedicated solely to Rahi? Probably not. I already took 2 updates writing what I have. Rahi probably has more sex scenes than the rest of the game combined right now x3. But that's what passion does to you I guess. What is passion anyway..\n\nA happy ending no matter what ending you choose. Why not, I think the little brown kitty deserves it. Is her story truly over though? ^^"

func hasDevCommentary():
	return true
