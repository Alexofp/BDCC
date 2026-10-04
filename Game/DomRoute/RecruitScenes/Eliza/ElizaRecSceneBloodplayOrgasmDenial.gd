extends RecruitSceneBase

func _init():
	sceneID = "ElizaRecSceneBloodplayOrgasmDenial"

func _reactInit():
	getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
	putOn("eliza", "LatexStraitjacket")
	putOn("eliza", "oldcollar")

func _run():
	if(state == ""):
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You prepare everything on a little tray. You don't have anything sharp so a piece of broken glass will do, sharp and cleaned. The rest came from Eliza, bandages, a bottle of antiseptic, as well as the meds that she had on herself.")

		saynn("Then you enter the cell. Eliza Quinn stands still, her collar leashed to the pipe above. She can't sit. She can't move much.")

		saynn("Her tits are out. Her eyes are angry.")

		saynn("[say=eliza]A piece of glass? So barbaric. Could have at least stolen a scalpel.[/say]")

		saynn("[say=pc]"+str(ch1("...", "That's all I need to make you regret everything.", "Someone like you doesn't deserve more."))+"[/say]")

		addButton("Continue", "See what happens next", "shard_neck")
	if(state == "shard_neck"):
		playAnimation(StageScene.GropeBehind, "neck", {pc="eliza", npc="pc"})
		saynn("You pick up the glass shard and get behind the feline, your hand brings the sharp edge close to her naked chest.. touching her fur but not much more.")

		saynn("[say=eliza]You think I'm scared of a little cut?[/say]")

		saynn("[say=pc]"+str(ch1("...", "You should be.", "You will be."))+"[/say]")

		saynn("[say=eliza]You're not gonna kill me.[/say]")

		saynn("She is right on that one actually. You will just try to make her feel as miserable as possible.")

		saynn("The glass shard hovers just above her left nipple. One quick, precise flick later.. and you cut a shallow line across her breast. A thin, red trail appears soon after. Eliza's breath hitches slightly.. but otherwise.. She takes it well. Her eyes watch the lonely drops of blood appearing from the little cut.")

		saynn("[say=eliza]It looks kinda hot..[/say]")

		saynn("Who are you to deny her the pleasure then? You press the sharp edge against the same breast.. and make another cut, perpendicular to the first, leaving another bleeding shallow wound. Eliza flinches and bites her lip, a shaky noise of pain gets trapped in her closed maw.")

		saynn("Her nips get visibly stiffer..")

		saynn("[say=pc]"+str(ch1("...", "This is just the start.", "Cry for me, you worthless thing."))+"[/say]")

		saynn("Next, you bring the glass to her right breast.. and press the pointy tip directly against her nipple. Gradually, you put more force into it, making the make-shift weapon dig into her sensitive nub.. all the while it gets even stiffer.")

		saynn("This makes the feline start hissing from pain. The sharp edge draws blood.. directly from her perky nipple.")

		saynn("Lonely drips of her red nectar make their journey down the curve of her tits.. and then start hitting the cold floor. Plap, plap..")

		saynn("[say=pc]"+str(ch1("...", "You're bleeding, slut.", "What a mess you are."))+"[/say]")

		saynn("[say=eliza]I've had it worse in bedroom.. Is that all you got?[/say]")

		saynn("What a brave tongue she got. You could leave more cuts on her tits.. but you got a better idea.")

		addButton("Continue", "See what happens next", "belt_off")
	if(state == "belt_off"):
		playAnimation(StageScene.GropeBehind, "rub", {pc="eliza", npc="pc"})
		saynn("You insert the key inside her bulky chastity belt and turn it, unlocking the device. Carefully, you reveal her crotch. The fur down there has gotten a little scruffy after being pushed down by the metal.. but the main reveal is obviously her cute little slit.. that has gotten quite wet by now.")

		saynn("[say=eliza]Don't look at me like that..[/say]")

		saynn("[say=pc]"+str(ch1("...", "You're a slut for pain, Eliza.", "You're dripping. Pathetic."))+"[/say]")

		saynn("Her thighs try to close instinctively but you place the glass piece right in between them, causing her to yelp. Mutilating her private parts would give her a great lesson.. but you'd rather keep that pussy in one piece. So instead, you leave a swift shallow cut on her inner thigh.. while your free hand lands on her slit, two digits sliding along the wet petals. She shudders.")

		saynn("[say=eliza]Ah..[/say]")

		saynn("You push one finger inside her. She is hot and tight. Her inner walls clench around you. Then you add a second finger. Slowly, you start to move them in and out.")

		saynn("[say=eliza]Mhh..[/say]")

		saynn("Each time she gets too comfortable with it, you flick the glass piece against her thigh again, creating more and more little thin bleeding lines.")

		saynn("[say=eliza]Fuck~..[/say]")

		saynn("[say=pc]"+str(ch1("...", "Such a needy whore.", "Such a weird fucking slut."))+"[/say]")

		saynn("You keep pumping your fingers, faster now. The cuts on her breasts still bleed slowly, sending little drops of red nectar off of her nips.")

		saynn("She is getting close. You can feel it. Her whole body is tense, her eyes are squeezed shut.")

		saynn("And that's when you stop.. and pull your fingers out.")

		saynn("[say=eliza]Mhh-.. Ha..h.. trying to deny me.. cute..[/say]")

		saynn("[say=pc]"+str(ch1("...", "You think you deserve to cum? No. Only if you submit.", "You don't get what you want. Ever. Convince me that you're gonna serve me well, slave."))+"[/say]")

		saynn("You expect her to beg.. but she doesn't seem to be doing that.")

		saynn("[say=eliza]Problem is.. I expected it. I love getting denied~. This is so fucking hot..[/say]")

		saynn("Her tension doesn't go away.. she chuckles softly.. and then it happens.")

		addButton("Continue", "See what happens next", "eliza_cums")
	if(state == "eliza_cums"):
		playAnimation(StageScene.GropeBehind, "orgasm", {pc="eliza", npc="pc"})
		saynn("You're not touching her at all.. and yet.. her whole body tenses.. again and again. She keeps her eyes shut.. moaning softly..")

		saynn("[say=eliza]Ah.. ahh.. yes.. yess~..[/say]")

		saynn("Eliza arches her back, her whole body shudders. A long, cute moan escapes her as she cums.. her pussy visible clenches around nothing.. while her many wounds continue dripping blood.")

		saynn("[say=eliza]Ohh.. I feel so light-headed~.[/say]")

		saynn("What a bitch.")

		saynn("You clean her wounds and bandage them up.. before locking the chastity belt around her waist again.")

		saynn("Then you grab the tray of things and step out.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
