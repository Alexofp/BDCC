extends SceneBase

func _init():
	sceneID = "Eliza4MomScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("[say=eliza]Really?![/say]")

		saynn("Your casual stride through the lobby is abruptly interrupted by a raised voice.. Eliza's voice.")

		addButton("Take a look", "See what's up", "mom_intro")
	if(state == "mom_intro"):
		addCharacter("elizaMom")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="eliza", npc="elizaMom"})
		aimCameraAndSetLocName("med_lobbymain")
		saynn("Eliza's feline ears twitch, her tail wagging behind her as she leans against one of the walls behind the counter, staring wide-eyed at the woman across from her. You only heard a single word so far.. but it's enough to raise the tension high.")

		saynn("[say=elizaMom]I'm starting to think that this was a mistake.[/say]")

		saynn("A slightly raspy voice, a streaks of dignified silver in her fur and hair, official clothes.. the woman near Eliza is radiating sheer levels of authority that makes even the nurses try to stay away. Near her are two guards.. ones that you don't recognize.")

		saynn("[say=eliza]But Mom![/say]")

		saynn("Oh.. some things click into place now. Now that you know it, the woman does remind you of Eliza quite a bit.. just with more.. experience behind her back.")

		saynn("[say=elizaMom]I didn't send you here to make drugs, sweetie. Lightly speaking.[/say]")

		saynn("There is no venom in her voice.. but there is no warmth either. Her sharp eyes scan the lobby, gaze lingering on the cluttered workspace behind the counter.. a laptop, all sorts of lab notes that all look like they have scribbles of a mad person on them, some kind of tools.. and also a mug of coffee with the words 'Best Mom' written on the side.")

		saynn("Eliza stiffens.")

		saynn("[say=eliza]That's not.. I mean.. I'm not just making drugs. I'm a chemist, I'm studying them. That's what I wanna do! Why can't you be like dad?[/say]")

		saynn("[say=elizaMom]Your father is a fool, bless his reckless heart. He would throw money at your projects without a second thought.. and then watch it all go up in flames. Like our laboratory.[/say]")

		saynn("[say=eliza]At least he cares more about me rather than some lab..[/say]")

		saynn("The older feline exhales sharply, her clawed digits pinching the bridge of her nose.")

		saynn("[say=elizaMom]You're saying I don't care about you? Maybe I found a bigger fool then.[/say]")

		saynn("That sounded harsh, Eliza's lips trembling slightly.")

		saynn("[say=elizaMom]You almost died, Eliza. If anything happened to you.. what reason would I have?[/say]")

		saynn("Eliza pulls her gaze away.. and just stands, with her arms crossed. That argument strikes deep.")

		saynn("[say=elizaMom]Science isn't a game. It's dangerous. But it's also boring, which makes it even worse for young minds like yours.[/say]")

		saynn("[say=eliza]I'm not a young girl anymore, mom.. You can't kill my love for science..[/say]")

		saynn("Eliza exhales through her nose, tail flicking irritably.")

		saynn("[say=elizaMom]I know I can't. But I can stop it from killing you.[/say]")

		saynn("The older feline's gaze softens.. if only slightly.")

		saynn("[say=elizaMom]So you're going to do as I say.[/say]")

		saynn("The older woman furrows her brows when noticing the mug on the counter. Eliza quickly snatches it up and starts sipping coffee out of it, her grip strong.")

		saynn("[say=eliza]Is that why you came here, to lecture me in person.. That's the first time I see you in a while..[/say]")

		saynn("[say=elizaMom]I had some business with the captain. Thought I might as well see how you are doing.[/say]")

		saynn("Her gaze sweeps across the workplace again.")

		saynn("[say=elizaMom]But now I'm thinking about taking you with me. Especially now, when this prison seems to be having this.. drug.. problem.[/say]")

		saynn("Eliza's eyes brighten up, her feline ears perk.")

		saynn("[say=eliza]Oh? You mean.. you want me to join you in the big lab?[/say]")

		saynn("You can hear the unspoken excitement.. Dreams and hopes fill the whole room.. but not for long.")

		saynn("[say=elizaMom]What? No. Sweetheart, we just talked about it. Your science days are over, I will find you a different workplace.. One.. that's not so..[/say]")

		saynn("Her lip curls slightly as she gestures vaguely around the room, swiftly skipping any faces.")

		saynn("[say=elizaMom]Dirty. Full of unknown substances.[/say]")

		saynn("Dirty? What is she talking about? Compared to the cellblock, this lobby is sterile.. pristine. She maybe has a point with the drug problem though..")

		saynn("[say=eliza]But mom! We've been making a lot of progress researching these substances! Look.[/say]")

		saynn("She hastily opens her laptop.. scrolling through files before showing something to her mom.")

		saynn("[say=eliza]See? We've been slowly filling up this database. This prison is turning out to be an invaluable source of unique.. science discoveries. I can tell you about each one, they all seem to possess some kind of transformative properties.. isn't that cool?[/say]")

		saynn("The older female scans the screen.. her expression unreadable.")

		saynn("[say=elizaMom]Yeah.. You remind me about how dangerous we really are..[/say]")

		saynn("[say=eliza]But I love doing it. I wanna keep doing it. You should see what shitty equipment we have here.. but we're making it work! We're doing science! Any other job would.. I don't know..[/say]")

		saynn("she exhales softly.")

		saynn("[say=eliza]Any other job would make me feel miserable.[/say]")

		saynn("For a long moment, there is silence. Her raw passion is making you feel something fuzzy inside. And you're probably not alone in this. Eliza's mother studies her daughter's eyes.")

		saynn("[say=elizaMom]Don't make out to be some kind of villain, dear. I'm trying to protect you.. because you need to be protected. And I really don't want you to be anywhere close to this prison while this drug problem is happening.[/say]")

		saynn("[say=eliza]I'm not young and dumb anymore, mom. We can solve this problem. Do you trust me?[/say]")

		saynn("Her mother sighs and lowers her gaze.")

		saynn("[say=elizaMom]I feel like I'm making a mistake again. But fine. I have one condition. If you fail.. or put yourself into danger again.. you're gonna do what I say from that point on, got it? No more chemistry, I will find something safe for you to do.[/say]")

		saynn("[say=eliza]I'm gonna make you proud![/say]")

		saynn("Looks like a good talk is all they needed.")

		saynn("Eliza's mother puts on a small, polite smile.")

		saynn("[say=elizaMom]We will see about that.[/say]")

		saynn("She pauses.")

		saynn("[say=elizaMom]Hm. I do have a question for you, sweetheart.[/say]")

		saynn("[say=eliza]Yes?[/say]")

		saynn("[say=elizaMom]You kept saying.. we.. You're not working alone?[/say]")

		saynn("Eliza blinks.. and then grins, her ears perking up as she hastily scans the room.")

		saynn("Her eyes find you.")

		saynn("[say=eliza]Oh! There you are! Come here![/say]")

		saynn("You inhale. Time to introduce yourself..")

		addButton("Introduction", "See what Eliza's mother thinks about you", "intro_you")
	if(state == "intro_you"):
		playAnimation(StageScene.Duo, "stand", {npc="elizaMom"})
		saynn("As you step closer, you can feel it.. the weight of a sharp, scrutinizing gaze pinning you in place. The older feline's eyes are dissecting every inch with a silent, clinical judgment. It's the kind of look that makes you instinctively stand up straighter.. as if that can somehow erase the fact that you're wearing a collar.")

		saynn("[say=eliza]This is {pc.name}, my assistant.[/say]")

		saynn("There is a brief, heavy silence.. but you can practically hear the unspoken 'Ew' lingering in the air.")

		saynn("[say=eliza]And this is my mom, Scarlet Quinn![/say]")

		saynn("You clear your throat.. trying to sound as polite.. and non-criminal.. as possible.")

		saynn("[say=pc]Uh. Pleased to meet you, Miss Quinn.[/say]")

		saynn("[say=elizaMom]Mrs. Quinn.[/say]")

		saynn("Right.. You blink. Not the best start.")

		saynn("[say=pc]My bad.[/say]")

		saynn("Scarlet turns her head back to her daughter.")

		saynn("[say=elizaMom]Can't help but notice.. you're working with an inmate.[/say]")

		saynn("There is no subtlety in her tone.. just pure, unfiltered distaste. Eliza, unfazed, simple grins and shrugs.")

		saynn("[say=eliza]Yeah? {pc.He} {pc.has} been a huge help![/say]")

		saynn("Scarlet's gaze flicks toward your collar.")

		saynn("[say=elizaMom]They have a shock collar around their neck.[/say]")

		saynn("Her voice is laced with something between disgust and disbelief.")

		saynn("[say=eliza]Yeah, inmates have those here. Super handy~.[/say]")

		saynn("Scarlet exhales through her nose.")

		saynn("[say=elizaMom]I begin.. to regret my decision, yet again.[/say]")

		saynn("Eliza rolls her eyes.")

		saynn("[say=eliza]Mo-o-om.[/say]")

		saynn("[say=elizaMom]How can you.. lower yourself.. to their level. I gotta get you out of here, back into civilization, away from.. this..[/say]")

		saynn("[say=eliza]Nope! Too late! You already agreed to let me stay.[/say]")

		saynn("She puts on a triumphant grin.")

		saynn("[say=elizaMom]Khm..[/say]")

		saynn("[say=eliza]But if you wanna offer me a position in our big lab.. I might even say yes~.[/say]")

		saynn("There is a hidden note of hope in her voice. Scarlet only gives her a look.")

		saynn("[say=elizaMom]Fine, stay. I'm a woman of my word. I advise you to be careful. Especially.. yeah.[/say]")

		saynn("Her eyes flick toward you. She makes it painfully obvious. Eliza huffs.")

		saynn("[say=eliza]I won't blow up this lab, I promise![/say]")

		saynn("Scarlet's jaw tightens.")

		saynn("[say=elizaMom]That's not the only thing I'm worrying about. Remember who you are.[/say]")

		saynn("The air is thick with unspoken weight.")

		saynn("[say=elizaMom]Now, if you excuse me, I gotta exchange a few words with the captain.[/say]")

		saynn("[say=eliza]Be well, mom~![/say]")

		saynn("[say=elizaMom]No need to sing goodbyes yet.[/say]")

		saynn("And just like that, Scarlet Quinn steps out from behind the counter.. and enters the elevator. Following her.. are her guards.")

		addButton("Continue", "See what happens next", "after_mom")
	if(state == "after_mom"):
		removeCharacter("elizaMom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You watch the elevator doors close behind Scarlet Quinn, the last flick of her tail vanishing from sight. But the air still feels heavy with her presence.")

		saynn("[say=pc]Your mother doesn't like me much.[/say]")

		saynn("Eliza lets out a small snicker, leaning against the counter with an amused flick of her ear.")

		saynn("[say=eliza]Well, to be fair, you're nothing but dirty criminal scum in her eyes.[/say]")

		saynn("So rude.")

		saynn("[say=pc]Wow. Thanks.[/say]")

		saynn("[say=eliza]Hey, I'm just saying it like it is! I felt exactly the same way when I first got here.[/say]")

		saynn("[say=pc]But that changed?[/say]")

		saynn("Eliza pauses, tilting her head and thinking for some time.")

		saynn("[say=eliza]Maybe.[/say]")

		saynn("There is a flicker of something unreadable in her eyes.. but it fades quickly.")

		saynn("[say=eliza]Besides, my mom doesn't realize that inmates make for great test subjects~.[/say]")

		saynn("Right.. Of course.")

		saynn("[say=eliza]She might warm up to you if she sees how helpful you are~.[/say]")

		saynn("[say=pc]Somehow I doubt it. We're on different levels.. or whatever she said.[/say]")

		saynn("Eliza lets out a chuckle, her tail swaying behind her.")

		saynn("[say=eliza]Well.. there are ways to get down to the same level~..[/say]")

		saynn("She shoots you a playful grin.")

		saynn("[say=eliza]Climbing up![/say]")

		saynn("A small pause..")

		saynn("[say=eliza]Or kneeling down~.[/say]")

		saynn("You roll your eyes as she laughs at her own joke.")

		saynn("[say=eliza]Either way, keep it up~. Don't forget that it might be easier to find the undiscovered drugs in the drug den.[/say]")

		saynn("You nod. She taps a claw lightly against your chest.. before pulling away.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "mom_intro"):
		processTime(3*60)

	if(_action == "intro_you"):
		processTime(5*60)

	if(_action == "after_mom"):
		processTime(5*60)

	setState(_action)
