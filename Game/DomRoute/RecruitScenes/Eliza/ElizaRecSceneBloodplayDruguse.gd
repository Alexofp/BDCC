extends RecruitSceneBase

func _init():
	sceneID = "ElizaRecSceneBloodplayDruguse"

func _reactInit():
	getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
	putOn("eliza", "LatexStraitjacket")
	putOn("eliza", "oldcollar")

func _run():
	if(state == ""):
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You prepare everything that you need on a little tray.. a selection of drugs that you took from Eliza's pockets.. some syringes and bandages.. and a glass shard, extremely sharp and dangerous, carefully cleaned..")

		saynn("Then.. you enter the cell. Eliza Quinn is standing still, her collar leashed to the pipe above her, preventing her from most things. She can't even sit on a chair that's here.")

		saynn("Her tits are still out.. and her eyes are still really angry.")

		saynn("[say=pc]"+str(ch1("...", "I'm gonna enjoy breaking you, slut.", "Hey, worthless. Look what I brought."))+"[/say]")

		saynn("You leave the tray on a chair. Eliza sees the contents.. but doesn't say anything. Sure. She can play that game.")

		saynn("Your hand starts hovering over all the different filled vials. Eliza knows them just by their color alone.. but luckily.. She also labeled them.")

		saynn("After some deliberation, you decide to try the special kind of painkiller.. The one that can apparently turn pain.. into pleasure. Seems useful.")

		saynn("You fill the syringe.. approach the doctor.. and inject the drug into her neck. She flinches a bit as the weird substance enters her bloodstream.")

		saynn("[say=eliza]Gonna spank me now?[/say]")

		saynn("[say=pc]"+str(ch1("...", "Something much worse.", "Something much worse."))+"[/say]")

		saynn("You reach for the glass shard..")

		addButton("Continue", "See what happens next", "shard_neck")
	if(state == "shard_neck"):
		playAnimation(StageScene.GropeBehind, "neck", {pc="eliza", npc="pc"})
		saynn("You pick up the shard and get behind the feline, your hand pressing the sharp edge against her throat, just above her collar. The weapon does dig into her skin.. any wrong motion could end really badly. You feel Eliza's heartbeat.. steady.")

		saynn("[say=pc]"+str(ch1("...", "One slash can end your stupid life.", "One slash can end your little, useless life."))+"[/say]")

		saynn("[say=eliza]Do it. I've seen death already.[/say]")

		saynn("Can't tell if she is bluffing.. but she doesn't seem scared indeed.")

		saynn("[say=pc]"+str(ch1("..hm..", "Maybe later. I want to take my time with you.", "You don't get to tell me what to do. You lost your crown."))+"[/say]")

		saynn("You move the glass down.. stopping just above her left nipple. Then, with a quick, precise flick, you cut a shallow line across her breast. A thin, red line appears soon after, overflowing with blood. Eliza's breath hitches as you do it.. but she doesn't cry out. She just watches the blood well up, coloring her pastel fur red.")

		saynn("Her nips get visibly stiffer.")

		saynn("[say=eliza]Mh.. the drug is certainly working. Go me..[/say]")

		saynn("[say=pc]"+str(ch1("...", "Keep talking. It just makes me want to cut deeper.", "Enjoy it while you can still feel."))+"[/say]")

		saynn("You press the sharp edge against her breast.. and make another cut, perpendicular to the first, applying just enough pressure to pierce the skin.. spawning another bleeding. Eliza bits her lip, a soft, shaky moan vibrating in her throat.")

		saynn("[say=pc]"+str(ch1("...", "You like it, huh? Slut.", "What a pathetic whore."))+"[/say]")

		saynn("Next, you bring the glass shard to her right breast.. and press the pointy tip directly against her hard nipple. Gradually, you put more force into it, making the make-shift weapon dig into her sensitive nub.")

		saynn("[say=eliza]Mhh.. hh-..[/say]")

		saynn("Soon, you draw blood.. directly from the perky nipple. Eliza arches her back slightly, still trying to keep her mouth closed.")

		saynn("Lonely drips of her red nectar start hitting the cold floor. Plap, plap..")

		addButton("Continue", "See what happens next", "thigh_cuts")
	if(state == "thigh_cuts"):
		playAnimation(StageScene.GropeBehind, "rub", {pc="eliza", npc="pc"})
		saynn("You move the little piece lower.. letting the sharp tip trace the lines where her fur meets with her chastity belt.")

		saynn("Suddenly, you make a cut on the sensitive skin of her inner thigh.. a quick surgical slice that made hips twitch involuntarily. Before the blood has a chance to appear, you slice again.. and again.. Three slices for each of her thighs.")

		saynn("Even though she is now bleeding profusely.. She is also wet.. extremely wet.. behind the belt.")

		saynn("[say=eliza]Ah.. f-fuck..[/say]")

		saynn("She gasps from each cut, her breathing becoming much faster and shallower.")

		saynn("[say=pc]"+str(ch1("...", "You're just a slut for pain, huh.", "You like that? You like being cut like a piece of meat? I can keep going."))+"[/say]")

		saynn("Her heart is beating harder against her ribs. A little puddle of her blood starts collecting beneath her, all the little streams painting her fur with many beautiful strokes of scarlet red.")

		saynn("Eliza's legs.. begin to shiver.. visibly. Either she is getting weaker.. or she is getting scared. Maybe both.")

		addButton("Continue", "See what happens next", "back_to_throat")
	if(state == "back_to_throat"):
		playAnimation(StageScene.GropeBehind, "neck", {pc="eliza", npc="pc"})
		saynn("Suddenly, you bring the glass back up to her throat. This time, you press harder, really testing how much her skin can take.")

		saynn("[say=eliza]..h-hey..[/say]")

		saynn("A little more pressure.. and the sharp shard starts leaving a thin line of red fire across her neck. Eliza gasps, her lips stay parted, warm air escaping her. Her eyes go wide.")

		saynn("[say=pc]"+str(ch1("...", "Ready to die for real?", "Is this what you wanted from your stupid life? To die like a pig?"))+"[/say]")

		saynn("There is no way out for her. Tears start running down from her eyes, her mask seemingly cracking. Her body gets weaker and weaker from all the bloodloss.. while her heart is beating harder.")

		saynn("[say=eliza]I.. n-no.. wait.. I d-don't want.. to die..[/say]")

		saynn("[say=pc]"+str(ch1("...", "Really? It's gonna be hard to convince me to stop.", "So?"))+"[/say]")

		saynn("[say=eliza]I.. I give up.. Please.. I will do whatever the fuck that you want..[/say]")

		saynn("She is crying, poor kitty.")

		saynn("[say=eliza]I see.. d-darkness.. I'm gonna p-pass out..[/say]")

		saynn("You don't actually want to kill her. But she does deserve it after what she has done to Kait.")

		addButton("Continue", "See what happens next", "eliza_after_all")
	if(state == "eliza_after_all"):
		playAnimation(StageScene.Beg, "beg", {pc="eliza", npc="pc"})
		saynn("You drop the glass and begin treating her wounds. You clean and bandage the cuts on her neck, her breasts, her thighs.")

		saynn("Eliza shows you which of her drugs are best against bloodloss.. and you so you inject her with that.. It's some kind of blood-volume expander and a coagulant.")

		saynn("Her breathing steadies.")

		saynn("[say=pc]Kneel.[/say]")

		saynn("And so.. she does.. in front of you. Her green eyes avoid your gaze.")

		saynn("Good.")

		saynn("With that, you grab the tray.. and step out. You will have to clean the cell.. but that can be done later.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
