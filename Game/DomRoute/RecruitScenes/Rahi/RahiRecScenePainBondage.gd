extends RecruitSceneBase

var gentle = false
var mean = false

func _init():
	sceneID = "RahiRecScenePainBondage"

func _run():
	if(state == ""):
		addCharacter("rahi")
		gentle = (c1 == 0)
		mean = (c1 == 2)
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true, leashedBy="pc"}})
		aimCameraAndSetLocName("hideout_breakroom")
		saynn("You will need some things for what you are about to do. You ask Kait and Ans.. and luckily they have it! Perks of having a team.")

		saynn("After that, you enter Rahi's cell and grab her leash before bringing her closer to the middle of the cell.. positioning her under the ceiling hook that was conveniently pre-installed here.")

		saynn("[say=pc]"+str(ch1("Our team only needs brave people. I'm going to test your pain tolerance. Trust me, okay?", "Our team only needs brave people. So I'm gonna test how well you handle pain. Understand?", "Our team has no place for cowards. I'm gonna test how well you handle pain. Understand?"))+"[/say]")

		saynn("Rahi blinks and then swallows audibly.")

		saynn("[say=rahi]She.. she is not sure..[/say]")

		saynn("You increase the grip on the leash.")

		saynn("[say=pc]"+str(ch1("I won't do anything that you can't handle. I will be gentle. Now, let's get those clothes off..", "You will have to trust me, kitty cat. Now, clothes off.", "Too bad, if you're not a painslut yet, you will have to become one. Strip. Everything. Or I'll tear them off myself."))+"[/say]")

		saynn("You watch as her paws begin to unbutton her shirt. She reveals her perky chest to you, her nips catching the slight cold breeze. Her shorts are next, she uses her claws to catch the waistband and tug down on it, revealing her cute little pink flower.")

		saynn("Rahi stands still as you begin to circle her slowly, your digits tracing her waist, her spine, her shoulder.. before reaching towards her chest to pinch a nipple. Rahi gasps, her back arching.")

		saynn("[say=rahi]Ah.. m-meow..[/say]")

		saynn("Next, you reveal one of the things that you've got.. ropes! Lots of ropes.")

		saynn("[say=pc]"+str(ch1("I'm gonna tie you up. I hope that's okay with you.", "I'm gonna tie you up. Stand still for me, kitty.", "I'm gonna tie you up, slut. Don't you dare move."))+"[/say]")

		saynn("Rahi eyes the ropes nervously, her tail curling around her thigh.")

		addButton("Continue", "See what happens next", "bind_rahi")
	if(state == "bind_rahi"):
		playAnimation(StageScene.RopesOralSex, "tease", {pc="rahi", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You begin to tie her up, looping the rope around her waist a few times, making sure it's secured tightly. She squeaks as you pull her arms behind her back, crossing her wrists and tying them together.")

		saynn("The ropes do bite in.. but it doesn't look painful.. only inescapable.")

		saynn("You guide Rahi under the ceiling hook. and throw the free end of the rope over it, catching it on its way down. Then you run it through the waist harness again and through her crotch..")

		saynn("Then, with a few steady pulls, you manage to lift Rahi off the floor, her toes now dangling inches above the concrete, her body swaying gently.")

		saynn("[say=rahi]Ah..![/say]")

		saynn("Her legs are still free.. but you quickly remedy that.. tying the rope around each ankle and finishing at that. Having two points of support makes her go horizontal against the floor.")

		saynn("And so.. Rahi is now fully exposed, suspended and helpless, her pussy and tits on full display. She is testing the ropes.. causing them to dig into her sensitive spots more.")

		saynn("[say=rahi]Mhh.. ah..[/say]")

		saynn("[say=pc]"+str(ch1("There we go. Let me know if this is too much.", "Such a helpless kitty. Let's see if I can do more.", "Such a helpless toy. I'm not done yet."))+"[/say]")

		saynn("There is never enough bondage. Your hand produces a black piece of cloth that you begin to tie around Rahi's eyes, plunging her into darkness.")

		saynn("[say=rahi]N-no.. she can't see..[/say]")

		saynn("[say=pc]"+str(ch1("It's okay. Just feel. Nothing bad will happen.", "Good. Now you'll really feel every touch.", "That's the point. I want you lost."))+"[/say]")

		addButton("Continue", "See what happens next", "apply_gear")
	if(state == "apply_gear"):
		saynn("The ballgag is next. You press the rubber ball between her teeth and tighten the strap behind her head. Any words of her dissolve into muffled noises.")

		saynn("[say=rahi]Mmph..[/say]")

		saynn("Her drool already begins to collect at the corners of her lips, trailing down. Blind and gagged, she is ready.")

		saynn("And so now the real test comes. You produce two nipple clamps, connected by a little, short chain. You let the blind kitty feel them, dragging their rubber tips across her curves, homing in on her nips.")

		saynn("Her left nipple is first. You open the clamp and slide it onto the sensitive spot. Rahi's whole body jolts, a muffled cry escaping the gag. The right nipple follows soon.. making her arch her back, swaying in the air.")

		saynn("[say=rahi]Hnnngh..![/say]")

		saynn("You let her be like that for a bit. Rahi's muffled noises begin to die down as she gets used to the pinching. She is still breathing faster though, her stiff nips constantly under pressure.")

		saynn("The chain dangles between her breasts.. gives you an idea. You grab a few small weights.. about half a pound in weight in total.. and attach them onto the center of the chain.")

		saynn("Immediately, the clamps tug downward, pulling on Rahi's nipples, forcing a muffled moan out of her. You can see her toes curling, her tail shivering stiffly.")

		saynn("[say=pc]"+str(ch1("It's not so bad, try to get used to the feeling.", "Those are just beginner weights. You'll get used to them.", "Cry all you want. Your tits look beautiful like this."))+"[/say]")

		saynn("Next, you crouch behind her, sneaking your hands between her legs and spreading them more, revealing her pussy that has gotten quite slick despite all the fear. You produce another clamp with a little weight on it and carefully attach it to her clit. The object starts tugging on her bean, making the kitty squirm and try to close her thighs around it.")

		saynn("[say=rahi]Nngh.. hhh..[/say]")

		saynn("Two smaller clamps and attach one to each of her inner labias. Rahi jolts.. making every clamp tug on her sensitive bits all at once, creating a cascade of sensations that rocks through her, making the feline squirm and moan harder.")

		saynn("You step back and admire your work.")

		saynn("[say=pc]"+str(ch1("Perfect. Please, try to endure it. As long as you can.", "Perfect. Try to endure it. As long as you can.", "Look at you. Getting off from pain."))+"[/say]")

		saynn("Then you raise your hand.. and deliver a firm spank to her suspended rear. The impact makes her swing slightly.. and the weights on her nipples bounce, tugging harder.")

		saynn("[say=rahi]MMMPHh-!..[/say]")

		saynn("Another spank.. causes a similar reaction. Rahi sways more, her whole body writhing, ropes digging into her, weights pulling on her bits..")

		saynn("You keep going, smacking that rear until it receives a nice red glow to it. Rahi's pussy grows wetter, a thin bead of her arousal starts hanging from her folds.")

		saynn("[say=rahi]Mhhh!.. hh-h..[/say]")

		saynn("After a few more spanks, Rahi starts shaking her head, her moans turning into whimpers. She had enough it seems. Her nips lost their pinkness, instead looking red-ish.. just like her pussy folds.")

		addButton("Untie", "Enough fun for now", "untie_rahi")
	if(state == "untie_rahi"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="rahi", npcBodyState={naked=true, hard=true}})
		saynn("You reach up and take off the weights first.. which makes Rahi gasp in relief. Then you remove the nipple clamps one by one and rub the blood back into her bruised nipples. The clit and pussy fold clamps come off too as Rahi shudders and whines more.")

		saynn("You lower her gently to the floor, then untie her wrists and ankles. The ropes have left some marks on her. Finally, you unbuckle the ballgag and remove the blindfold.")

		saynn("Rahi blinks in the light.. lonely tears streaking down her face. Her whole body is still shivering ever so slightly.")

		saynn("[say=rahi]S.she.. hh.. t-that was.. p-pain..[/say]")

		saynn("You hold her close.")

		saynn("[say=pc]"+str(ch1("Sorry, kitty. I had to test your endurance.", "You did pretty good, kitty. Very good.", "You will get used to the pain eventually. You just need more practice."))+"[/say]")

		saynn("You rub her spots.. while she rests in your hands.")

		saynn("[say=rahi]That.. was too much.. the whole thing..[/say]")

		saynn("Looks like she is not a fan of this.")

		saynn("You cuddle Rahi for a while longer.. before leaving her be, stepping out of the cell to see what Kait thinks.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "bind_rahi"):
		processTime(5*60)
		putOn("rahi", "blindfold")
		putOn("rahi", "ropeharness")

	if(_action == "apply_gear"):
		processTime(3*60)
		putOn("rahi", "ballgag")

	if(_action == "untie_rahi"):
		processTime(3*60)
		putOff("rahi", "blindfold")
		putOff("rahi", "ballgag")
		putOff("rahi", "ropeharness")

	setState(_action)

func saveData():
	var data = .saveData()

	data["gentle"] = gentle
	data["mean"] = mean

	return data

func loadData(data):
	.loadData(data)

	gentle = SAVE.loadVar(data, "gentle", false)
	mean = SAVE.loadVar(data, "mean", false)
