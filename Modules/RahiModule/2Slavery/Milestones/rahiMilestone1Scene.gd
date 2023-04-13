extends SceneBase

func _init():
	sceneID = "rahiMilestone1Scene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("Rahi is sitting on her bed when you step into her cell. When she sees you, she quickly fidgets and gets up.")

		saynn("[say=rahi]Hello..[/say]")

		saynn("[say=pc]Hello who?[/say]")

		saynn("[say=rahi]Hello.. {pc.name}?..[/say]")

		saynn("You sigh and gesture to come closer.")

		saynn("[say=pc]We will need to work on that. Would you kneel for me?[/say]")

		saynn("Rahi tilts her head down and sways to the sides a bit, deliberating.")

		saynn("[say=rahi]What will you do if she doesn't?..[/say]")

		saynn("It seems like kitty is feeling playful. Or bratty.")

		addButton("Nothing", "But Rahi will get a reward if she does", "say_nothing")
		addButton("Punishment", "Rahi will get punished if she doesn't", "say_punishment")
	if(state == "say_nothing"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel"})
		saynn("[say=pc]Nothing will happen if you don't. But if you do, you will be rewarded like a good girl. You wanna be a good girl, do you?[/say]")

		saynn("Rahi listens to your words carefully, her cheeks become red slightly.")

		saynn("[say=rahi]She wants to, yes..[/say]")

		saynn("[say=pc]So?[/say]")

		saynn("She sways idly for a bit longer before finally committing to it and slowly lowering herself to her knees before you. Kitty catches your kind glance and looks away instantly, her blush is becoming more pronounced.")

		saynn("[say=pc]Such a good girl. You've been a good girl so far, I think I need to reward you with something better.[/say]")

		saynn("An idea comes into your mind while your digits brush over the girl's lips on the way to scritching her under the chin.")

		saynn("[say=pc]Tell me, is there a way for me to get some.. toys.. for you. I might have some somewhere but.. you know.. They're all used. A fresh set of them, only for you, would be nice to have~.[/say]")

		saynn("Rahi nuzzles your hand but then begins to think about your words.")

		saynn("[say=rahi]You can maybe buy them.. from the guy in the.. wait.. She knows where you can get all of them.. for free![/say]")

		saynn("[say=pc]Is that so, kitty? Tell me.[/say]")

		saynn("Kitty bounces eagerly.")

		saynn("[say=rahi]From that bad doctor! She has an entire case of toys, probably more than one.[/say]")

		saynn("She purrs while you continue to scritch her under the chin and behind the ears.")

		saynn("[say=pc]And how are we gonna get them? I doubt that she is selling them.[/say]")

		saynn("[say=rahi]Can always just.. steal.. She is good at that..[/say]")

		saynn("Stealing is bad. But considering what this doctor wanted Rahi to go through.. It's probably worth it.")

		saynn("[say=rahi]You distract her while she.. steals her badge and steals the toys..[/say]")

		saynn("[say=pc]Alright, sounds like a plan. Let's go pay doctor Quinn a visit.[/say]")

		addButton("Continue", "See what happens next", "go_to_eliza")
	if(state == "say_punishment"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel"})
		saynn("[say=pc]If you don't I will just force you to. And then you will get punished. Slaves must obey without asking questions.[/say]")

		saynn("You were about to reach your hand out towards Rahi but she quickly changed her mind and quickly lowered herself to her knees before you. Her submissive gaze directed down at your feet, paws resting on her lap.")

		saynn("[say=rahi]She is sorry.. You're right, slaves like this kitty must learn to obey or be abused until they do..[/say]")

		saynn("Huh, the kitty got that enthusiasm, you gotta give her that. Or maybe she is just scared of you. As your hand grabs her ponytail, the metal hairpin that holds it together pokes your palm. But you ignore the discomfort and pull on Rahi's hair, making her look up at you.")

		saynn("[say=pc]And I think I need better ways of punishing you. A good whip goes a long way in making someone more eager to listen.[/say]")

		saynn("Kitty bares her fangs and teeth but only because your grip is bringing her pain. She clearly tries not to hiss at you.")

		saynn("[say=rahi]A-actually.. S-she might know where to get a good one..[/say]")

		saynn("You lean closer to her, still holding her ponytail.")

		saynn("[say=pc]Is that so? Go on, I'm curious.[/say]")

		saynn("[say=rahi]T-the.. the doctor.. she has entire cases of.. toys.. and whips.. and everything..[/say]")

		saynn("You raise a brow and finally let go of that ponytail, letting kitty calm down.")

		saynn("[say=pc]I doubt that she would sell them. And beating her up for one.. Might end badly.[/say]")

		saynn("[say=rahi]Kitty can.. steal one.. You just need to distract the doctor enough for her to steal the badge..[/say]")

		saynn("[say=pc]Seems.. like a plan. I appreciate your eagerness to get your butt whipped.[/say]")

		saynn("Kitty is blushing and avoids eye contact.")

		saynn("Time to go pay doctor Quinn a visit.")

		addButton("Continue", "See what happens next", "go_to_eliza")
	if(state == "go_to_eliza"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="sit"})
		removeCharacter("rahi")
		addCharacter("eliza")
		aimCameraAndSetLocName("med_lobbymain")
		addCharacter("rahi")
		saynn("You and Rahi step out of the cell and head to the elevator that would take you to the medical wing.")

		saynn("While you ride the elevator, the feline stuffs herself into one of the corners and nods to you. The doors open, revealing the medical lobby.")

		saynn("Doctor Quinn is sitting behind the counter, the usual. As you approach her, the doors behind you close automatically. Hm.")

		saynn("[say=eliza]Quinn here. What can I do for you today?[/say]")

		saynn("[say=pc]Well, I just wanted-..[/say]")

		saynn("She was focused on reading something from her datapad when she heard your voice.")

		saynn("[say=eliza]How is Rahi doing? You two seem to be getting along pretty well?[/say]")

		saynn("[say=pc]Yeah, you could say that.[/say]")

		saynn("You look down and realize that Rahi is on all fours near you, hiding from the doctor and pretending that she is looking for something.")

		saynn("[say=eliza]Uh huh.[/say]")

		saynn("[say=pc]Kitty is doing better for sure. Didn't drink anything bad so far.[/say]")

		saynn("[say=eliza]So she doesn't need any help from me anymore, right? Rahi doesn't binge alcohol now and even got over her fear of water? Aren't you one.. nice person.[/say]")

		saynn("The way she said the last few words.. Doctor Quinn is leaning closer to you.. You gotta distract her before she spots Rahi.")

		addButton("Kiss her", "Might as well. This will confuse Eliza for sure", "kiss_eliza")
		addButton("Ask for something", "Play it safe and just ask for something that she might have", "ask_for_something_eliza")
	if(state == "kiss_eliza"):
		saynn("Instead of just standing there and letting the doctor spot the kitty, you lean forward too and leave a quick kiss on the girl's cheek. That certainly was unexpected for her, Eliza raises a brow.")

		saynn("That wasn't enough for Rahi though so you lean forward again before putting your hand on the doctor's chin and letting your lips collide in a beautiful long passionate kiss. Eliza blinks many times but then closes her eyes and commits too, kissing you back. That's when you notice in the corner of your eyesight Rahi quickly leaping over the counter and getting behind the doctor. There was no noise, the feline used her agility to soften up the landing.")

		saynn("You finally break the kiss, leaving Eliza hanging there, her eyes opening up and tracking your mouth.")

		saynn("[say=pc]That was a.. a thank you.[/say]")

		saynn("[say=eliza]Is that so..[/say]")

		saynn("She offers you an intimate smile. Rahi uses the silence that emerges after to start reaching for the doctor's badge. Doctor's lab coat is unbuttoned which means the badge is closer to her side but it's still quite a risky move. It seems Rahi knows what she is doing though, her paw softly lands on the girl's hip and travels up it.")

		saynn("[say=eliza]Would you want to.. continue this in.. a more secluded place?[/say]")

		saynn("Rahi manages to expertly stay out of sight while her feline paw gets a hold of that badge and tries to take it off. All the while the doctor's eyes are glued to yours, forcing a direct eye contact.")

		saynn("[say=pc]Maybe. Maybe some other time. I have something I need to do-[/say]")

		saynn("She cuts you off and grabs you by the chin this time.")

		saynn("[say=eliza]Oh, I insist. It could turn into a great threesome.[/say]")

		saynn("Huh? What does she.. Suddenly you hear your kitty yelping from under the counter, Eliza is still staring at you but her paw has stabbed some kind of injector into Rahi's shoulder. Without even giving you enough time to react, she fetches another one and stabs you too. Almost instantly, your muscles begin to seize up. Eliza puts on a mean expression and gets up off her chair while you two are slumping down to the floor.")

		saynn("[say=eliza]You really think that I'm that stupid?[/say]")

		saynn("Eliza sighs audibly before directing a few nurses towards you and Rahi. They drag you off somewhere.")

		saynn("[say=eliza]You ended my early-shift coffee break. You two are gonna pay for that.[/say]")

		saynn("Your eyes begin to close on their own, you suddenly feel so drowsy..")

		addButton("Continue", "See what happens next", "eliza_ties_up_pc")
	if(state == "ask_for_something_eliza"):
		saynn("[say=pc]Hey. I wanted to ask if you have something..[/say]")

		saynn("You lean against the counter, causing Eliza to stop advancing towards you and instead tilt her head slightly.")

		saynn("[say=pc]Something..[/say]")

		saynn("You try to come up with something. Anything. Right, the coffee mug.")

		saynn("[say=pc]Stronger than.. coffee?.. Know what I mean?[/say]")

		saynn("Eliza raises a brow.")

		saynn("[say=eliza]You're asking for drugs? Everything that's allowed for the inmates is being sold in the vendomat behind you.[/say]")

		saynn("[say=pc]No, I mean like.. Fun ones? Something against depression.[/say]")

		saynn("Eliza nods a few times before grabbing her datapad and pulling some kind of list.")

		saynn("[say=eliza]This is everything that can be legally synthesized at the prison grounds.[/say]")

		saynn("You lean heavily towards Eliza, invading her personal space so you can look at the datapad, blocking the view for the doctor almost completely. That's when you notice in the corner of your eyesight Rahi quickly leaping over the counter and getting behind the doctor. There was no noise, the feline used her agility to soften up the landing.")

		saynn("[say=pc]Hmm.. interesting. And fascinating. But I have no idea what I'm looking at..[/say]")

		saynn("Eliza gently shoves you back and just turns the datapad towards you.")

		saynn("[say=eliza]This is a list of antidepressants. Do you need one or not?[/say]")

		saynn("You begin to stare at the list for a long time. Rahi uses the silence that emerges to start reaching for the doctor's badge. Doctor's lab coat is unbuttoned which means the badge is closer to her side but it's still quite a risky move. It seems Rahi knows what she is doing though, her paw softly lands on the girl's hip and travels up it.")

		saynn("[say=pc]I don't think any of these are gonna work for me. Like I said, I wanted something.. stronger. Oh well.[/say]")

		saynn("Rahi manages to expertly stay out of sight while her feline paw gets a hold of that badge and tries to take it off. All the while the doctor's eyes are glued to yours, forcing a direct eye contact.")

		saynn("[say=eliza]Okay. Sure. Maybe your friend needs something then?[/say]")

		saynn("Huh? What does she.. Suddenly you hear your kitty yelping from under the counter, Eliza is still staring at you but her paw has stabbed some kind of injector into Rahi's shoulder. Without even giving you enough time to react, she fetches another one and stabs you too. Almost instantly, your muscles begin to seize up. Eliza puts on a mean expression and gets up off her chair while you two are slumping down to the floor.")

		saynn("[say=eliza]You really think that I'm that stupid?[/say]")

		saynn("Eliza sighs audibly before directing a few nurses towards you and Rahi. They drag you off somewhere.")

		saynn("[say=eliza]You ended my early-shift coffee break. You two are gonna pay for that.[/say]")

		saynn("Your eyes begin to close on their own, you suddenly feel so drowsy..")

		addButton("Continue", "See what happens next", "eliza_ties_up_pc")
	if(state == "eliza_ties_up_pc"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza"})
		aimCameraAndSetLocName("medical_confessionary")
		saynn("Some time passes. Probably. You're not sure because you were out during that time.")

		saynn("As you open your eyes, you see.. the dimly-lit room. Same one that Eliza used to interview you about Rahi. But this time you're not sitting on a comfy sofa. Instead, your hands are chained to the ceiling from which you are hanging. Rahi is in the same tricky position near you. And Eliza is sitting in one of the comfy chairs.")

		saynn("[say=eliza]I know, I know. I look evil right now. But try to be in my shoes for once.[/say]")

		saynn("[say=pc]What are you gonna do?[/say]")

		saynn("Eliza stands up and approaches you, her feline paw grabbing your chin and shaking it.")

		saynn("[say=eliza]Shush. You wanted to steal drugs for Rahi, didn't you? Replace one addiction with another. Do you understand that you're killing her? You can't do that forever, you gotta figure out why she is like this. You gotta work her problems out. And if you can't, I will do it myself.[/say]")

		saynn("Rahi suddenly begins to struggle against her restraints.")

		saynn("[say=rahi]She is fine! {pc.name} is helping her, okay?! Let us go![/say]")

		addButton("Continue", "See what happens next", "eliza_pokes_rahi")
	if(state == "eliza_pokes_rahi"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", pc="rahi", bodyState={naked=true}})
		saynn("Eliza directs her attention at your kitty. She approaches the girl, her eyes scanning the brown feline.")

		saynn("[say=eliza]Is that so?[/say]")

		saynn("Doctor's paws reach out towards Rahi's shirt and begin to unbutton it, revealing the fur underneath.. her belly that still has that scar on it and her round perky breasts too.")

		saynn("[say=eliza]If you're fine.. then I guess you won't have a problem with letting me heal that scar in a cryopod for a bit.[/say]")

		saynn("Poor kitty begins to breathe faster, her eyes show panic. While Eliza tilts her head slightly.")

		saynn("[say=eliza]Unless.. unless you two have been lying to me. And there was a different reason behind you being in water that day. And making that loud scream.[/say]")

		saynn("She smiles at you both.")

		saynn("[say=eliza]But that can't be right.. Right? Of course it's not. I will go grab another coffee cup and tell nurses to prepare the cryopod.[/say]")

		saynn("The feline gives you both a strict look before leaving the room.")

		addButton("Continue", "See what happens next", "rahi_escapes")
	if(state == "rahi_escapes"):
		removeCharacter("eliza")
		playAnimation(StageScene.HangingSolo, "idle", {pc="rahi", bodyState={naked=true}})
		saynn("Now that you're alone with Rahi, there is not much that you can do. You try to tug on the chains but the cuffs that they're attached to seem to be extremely tight. You only hurt yourself by trying to struggle out of them.")

		saynn("[say=pc]Argh. I think we're stuck here.[/say]")

		saynn("You turn your head towards naked Rahi.")

		saynn("[say=pc]You think you can handle the cryo treatment?[/say]")

		saynn("She tilts her head down.")

		saynn("[say=rahi]No..[/say]")

		saynn("About a minute passes, you're running out of time. And the cuffs are still sitting as tight as they were.")

		saynn("[say=rahi]Wait.. She knows what to do.[/say]")

		saynn("Rahi's paws are high above her head. She tries to pull herself up using the chains but she is not the strongest kitty, she struggles with that a lot.")

		saynn("[say=rahi]Come onn-n..[/say]")

		saynn("She switches tactics. Her hind paws barely reach the floor but that's enough for her to start jumping up and down, trying to reach higher and higher. You don't quite understand what she is trying to do but it's quite fascinating to watch her boobs bouncing, you can't lie.")

		saynn("Eventually she manages to jump high enough to yoink the metal hairpin that was hiding in her hair and holding her ponytail.")

		saynn("[say=rahi]Yes![/say]")

		saynn("Rahi quickly begins to bend the thing into some strange shape before inserting it into the keyhole of her cuffs and beginning to shake it around in there until something latches. Then she just turns her makeshift lockpick, causing the cuff to unlock and fall off the girl's wrist! She does that to the second one, freeing herself completely before unlocking your wrists as well.")

		saynn("Rahi buttons up her uniform and looks around.")

		addButton("Continue", "See what happens next", "rahi_finds_crate")
	if(state == "rahi_finds_crate"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("Rahi points at the sofa that has some kind of crate resting on it.")

		saynn("[say=rahi]That must be it![/say]")

		saynn("This crate has a handy handle that allows you to carry it quite easily. But for now you decide to just open it and see what's inside. And wow, you haven't seen that many sextoys since the last time you were in the lilac block.")

		saynn("There are multiple layers to it, so many sections. Each one has different kinds of toys or.. equipment. Whips, gags, harnesses, dildoes, strapons, tubes with lube and cumlube, blindfolds, nipple clamps, ropes, chains, cuffs, buttplugs, vibrators, literally everything you could have hoped for, in one neat box. Both you and Rahi are quite surprised.")

		saynn("[say=pc]Let's get out of here. Quinn is gonna be here any minute.[/say]")

		saynn("In fact, there she is, opening the door and stepping inside, yawning.")

		saynn("[say=rahi]LOOK OUT![/say]")

		saynn("The loud kitty confuses the doctor enough for you two to dash past her out into the medical corridor and then towards the exit.")

		saynn("Eliza only sighs and rolls her eyes while you are long gone.")

		addButton("Continue", "See what happens next", "explore_toys")
	if(state == "explore_toys"):
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		saynn("You and Rahi get back to her cell, both are panting. And it seems like Eliza doesn't feel like pursuing you for whatever reason. So it's a success!")

		saynn("You place the crate of toys onto the floor and open it. Rahi slowly catches her breath and begins to purr.")

		saynn("[say=rahi]That was fun..[/say]")

		saynn("You pat the kitty on the head.")

		saynn("[say=pc]It was. Hm. I should test one of the items here on you. Let's see.[/say]")

		addButton("Ring-gag", "Make Rahi wear a head harness with the ringgag", "test_ringgag")
		addButton("Vibrator", "Make Rahi wear a vibrator on her pussy for a bit", "test_vibrator")
	if(state == "test_ringgag"):
		saynn("You grab the head harness that has a metal ring connected to it and approach Rahi.")

		saynn("[say=pc]Stand still like a good slave.[/say]")

		saynn("Rahi almost wanted to complain but then decided against it, seeing how many more restraints are in that crate.")

		saynn("Instead, she opens her mouth for you, letting you slide the ring in before closing her maw around it. All the while you proceed to wrap the leather straps around her head and tighten them up, making that ringgag sit nice and neatly.")

		saynn("Almost immediately Rahi begins to drool. Not being able to close her mouth means she is forced to. And as she realizes it, a slight blush appears on her cheeks.")

		saynn("[say=rahi]This is embarrassing..[/say]")

		saynn("She can't speak clearly, the noises all come out garbled. You decide to play with her a bit more and slide a few digits into her maw, resting them on her rough tongue.")

		saynn("[say=pc]Lick.[/say]")

		saynn("Kitty huffs and blushes harder but then proceeds to drag her feline tongue over your digits, covering them in her saliva and letting you feel how sandpaper-y her tongue feels.")

		saynn("[say=pc]Good little slave. This is not a punishment, this is just me playing with you. But you must obey no matter what. Even if I decide to punish you for seemingly no reason.[/say]")

		saynn("Rahi nods softly and keeps licking your digits until you decide that it's enough. Then you pull them out and dry against the feline's cheek.")

		addButton("Continue", "That was fun", "resetequipandend")
	if(state == "test_vibrator"):
		saynn("You find a little pink vibrator in the shape of an egg. It has a pink remote that goes with it. Rahi blushes just seeing it.")

		saynn("[say=pc]Stand still for me, cutie. Let me reward you.[/say]")

		saynn("You approach the feline and pull her shorts away slightly before slipping your hand under them and finding Rahi's small pleasure bean. You tape the toy in such a way that it rubs directly against it.")

		saynn("Time for the fun part, you reach for the little slider on the remote and raise it slightly. The toy in Rahi's shorts engages and begins to buzz ever so audibly. But the feline reacts instantly, closing her legs and producing a soft moan.")

		saynn("[say=rahi]H-hey.. {rahiMaster}..[/say]")

		saynn("[say=pc]Enjoy it.[/say]")

		saynn("You move the slider higher, making the toy buzz louder. Blushy kitty looks at you with lusty eyes while her maw starts to produce more muffled noises of enjoyment. Her paws reach for her shorts but they don't dare to pull the toy off, not while you're watching her.")

		saynn("[say=pc]You don't like it, kitty?[/say]")

		saynn("[say=rahi]She likes.. too much.. ah..[/say]")

		saynn("She lowers her head and starts to pant, the cloth around her crotch area gets slightly wet. The scent of a horny feline starts to fill the cell.")

		saynn("[say=pc]Well, that's enough for now~.[/say]")

		saynn("You turn down the power of that toy and reach into the girl's shorts to take it out.")

		saynn("[say=pc]Ohh, you're quite needy down there. Did I leave you unsatisfied~?[/say]")

		saynn("Rahi huffs and pouts at you, little moans keep escaping from her.")

		saynn("[say=rahi]Yes.. you did..[/say]")

		saynn("[say=pc]Well, be a good girl for me and maybe you will get to cum next time?[/say]")

		saynn("She nods softly.")

		addButton("Continue", "That was fun", "resetequipandend")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_to_eliza"):
		processTime(10*60)

	if(_action == "eliza_ties_up_pc"):
		processTime(10*60)

	if(_action == "rahi_escapes"):
		processTime(20*60)

	if(_action == "explore_toys"):
		processTime(5*60)

	if(_action == "test_ringgag"):
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ringgag"))

	if(_action == "resetequipandend"):
		getCharacter("rahi").resetEquipment()
		endScene()
		return

	setState(_action)
