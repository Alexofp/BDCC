extends RecruitSceneBase

func _init():
	sceneID = "FerriRecScenePetplaySadism"

func _reactInit():
	putOn("ferri", "inmatewristcuffs")
	putOn("ferri", "basketmuzzle")

func _run():
	if(state == ""):
		addCharacter("ferri", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcBodyState={naked=true}})
		saynn("You need a particular thing and Kait offers to quickly make a make-shift version of it. Seems good enough.")

		saynn("Then.. you open the cell's door and step inside, holding a new fancy multi-tailed whip in your hand. It was made out of many braided wires, twisted together at the handle, each tip ending with a small knot. It's fairly big for cat o' nine tails whips.. almost a meter long.")

		saynn("Ferri looks up at you, her wrists still cuffed, her face still muzzled. Her cyan eyes narrow.")

		saynn("[say=ferri]Took you long enough, meanie. Came to let me go finally?[/say]")

		saynn("You hold up the whip.")

		saynn("[say=pc]"+str(ch1("No. I came to train you.", "No, slut. I came to break you.", "No, you stupid bitch. I came to make you my pet."))+"[/say]")

		saynn("Her tail slams against the floor, her big fangs click against the basket of the muzzle.")

		saynn("[say=ferri]Mew.. you wish. I'm not some slave you can just..[/say]")

		saynn("You approach and crack the whip against the wall, not that far away from Ferri's thigh. She flinches when you do that.")

		saynn("[say=pc]"+str(ch1("Kneel. Now.", "On your knees, whore.", "Kneel before I stripe that pretty blue fur red."))+"[/say]")

		saynn("[say=ferri]Make me![/say]")

		addButton("Continue", "See what happens next", "grab_leash")
	if(state == "grab_leash"):
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcAction="hurt", npcBodyState={naked=true, leashedBy="pc"}})
		saynn("You grab her leash and yank, pulling her away from the wall.. while your hand delivers a strike! Ferri yelps as the whip comes down across her bare ass.")

		saynn("[say=ferri]Eep![/say]")

		saynn("Her whole body tenses, a few small lines appear on her butt.")

		saynn("[say=pc]"+str(ch1("I said kneel. Not hard.", "Kneel, bitch. Or the next one's on your tits.", "You're going to learn. One whip strike at a time."))+"[/say]")

		addButton("Continue", "See what happens next", "ferri_kneels")
	if(state == "ferri_kneels"):
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcAction="kneel", npcBodyState={naked=true, leashedBy="pc"}})
		saynn("Ferri glares at you.. but her knees begin to bend. Slowly, she lowers herself down to the cold floor before you, her cuffed hands still pressing against her back.")

		saynn("[say=ferri]..mow.. fine.[/say]")

		saynn("[say=pc]"+str(ch1("Good. Now hold still.", "That's better. Stay.", "Look at you. Already learning your place."))+"[/say]")

		saynn("You crouch and unlock her wrist cuffs, letting her arms fall to her sides while the metal clatters to the floor.")

		saynn("[say=ferri]Mew?..[/say]")

		saynn("[say=pc]"+str(ch1("Get on all fours. Like a puppy.", "Get on all fours. You're going to be my slutty pup.", "Get on all fours, you worthless."))+"[/say]")

		saynn("Ferri rubs her wrists, her tail curling around her hip.")

		saynn("[say=ferri]And if I don't?[/say]")

		saynn("You answer with another strike. This one lands across her back. She yelps and pushes her chest forward.")

		saynn("[say=pc]"+str(ch1("Then I keep hitting you until you do.", "Then you get the whip until you can't stand. Your choice.", "Then you bleed. Simple."))+"[/say]")

		saynn("Ferri's ears flatten..")

		addButton("Continue", "See what happens next..", "ferri_allfours")
	if(state == "ferri_allfours"):
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcAction="allfours", npcBodyState={naked=true, leashedBy="pc"}})
		saynn("She plants her palms on the floor and slowly gets on all fours, her breasts hanging down now, swaying as she positions herself a little better.")

		saynn("[say=ferri]Mrow.. happy now?[/say]")

		saynn("Her tone isn't nice enough so you give her butt another smack with the whip, the many knots digging themselves into her fur and leaving lots of marks on her soft cheeks.")

		saynn("[say=ferri]Huff..[/say]")

		saynn("[say=pc]"+str(ch1("I'll be happy when you're a drooling mess. Crawl behind me, pup.", "Crawl behind me, slut.", "I'll be happy when you're nothing but a drooling mess. Crawl."))+"[/say]")

		saynn("You tug on the leash.. and watch as she follows, one step at a time. You walk her in a slow circle around the cell, her tail lagging behind her.")

		saynn("You decide to give her another strike on her butt, really making it sting.")

		saynn("[say=ferri]Hff! I did as told.. Meanie..[/say]")

		saynn("Another whip strike happens again, Ferri's butt getting quite red. She squirms and arches her back, struggling to contain the pain.")

		saynn("[say=ferri]Eep.. huff-f..[/say]")

		saynn("You walk around the cell some more with her, from one side to another. That's when Ferri decides to say something.")

		saynn("[say=ferri]You hit like a kitten, you know..[/say]")

		saynn("[say=pc]Kitten, huh. We can get you a kitten.[/say]")

		saynn("You step out of the cell, Ferri on a leash. Kait is standing near.")

		addButton("Kait", "Let Kait do some stuff with Ferri", "let_kait")
	if(state == "let_kait"):
		addCharacter("kait")
		playAnimation(StageScene.Spanking, "fast", {pc="kait", npc="ferri", npcBodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("hideout_near_break_room")
		saynn("[say=kait]Aww, what a cute puppy! Is she broken yet?[/say]")

		saynn("[say=pc]Not yet. She said I hit like a kitten.[/say]")

		saynn("[say=kait]Hah! Let me try.[/say]")

		saynn("Kait sits behind Ferri and gropes that fluff butt of hers.")

		saynn("[say=ferri]Mew..[/say]")

		saynn("Suddenly.. Three quick strikes in a row against her rump. Ferri squeaks, her front paws slipping a bit. Her tail moves out of the way, giving you and Kait a clear view of her wet cyan pussy.")

		saynn("[say=ferri]Mnn.. you can do harder than that.. mew..[/say]")

		saynn("[say=kait]Aww, adorable.[/say]")

		saynn("She fetches the whip from you and uses that instead, whipping the dracat's ass again and again, each one making Ferri moan into the basket muzzle.")

		saynn("[say=kait]Better?[/say]")

		saynn("[say=ferri]..yes.. mew..[/say]")

		saynn("While Kait is hitting Ferri's rear, you crouch beside her and smack her tits instead, sending them to jiggle beneath her.")

		saynn("[say=ferri]Eep.. nyah..[/say]")

		saynn("Poor dracat is getting double-teamed.. but she doesn't seem to mind. Her slit is dripping onto the floor, her butt fully exposed, just like her breasts.")

		saynn("[say=pc]"+str(ch1("Look at you. Begging for it with your whole body.", "You're getting really horny from this, aren't you, slut?", "Dumb puppy. Your cunt is dripping."))+"[/say]")

		saynn("[say=ferri]Don't stare so much.. ah.. meanies..[/say]")

		saynn("[say=kait]I will stare as long as I want to~.[/say]")

		saynn("You fetch the whip back from Kait and deliver more hits all over her body.. her back receives a few fancy red stripes.. just like her tits and thighs.")

		saynn("[say=ferri]I will bite chu all.. nyaa-ah..[/say]")

		saynn("Her pussy receives a soft impact as well, the many knots of the braided wires stinging the sensitive bits. Ferri's hips back as she lets out a whine.")

		saynn("[say=ferri]Nhh.. m-mew..[/say]")

		saynn("She flops onto the floor.")

		saynn("[say=kait]Aw, I think you broke the poor puppy.[/say]")

		saynn("[say=ferri]Woof..[/say]")

		saynn("[say=pc]"+str(ch1("I think she enjoyed it.", "That bitch deserved it.", "Good. This animal deserves it."))+"[/say]")

		saynn("Kait gives Ferri some pats on her head.. before you take her back into the cell.")

		addButton("Continue", "See what happens next", "ferri_back_cuffed")
	if(state == "ferri_back_cuffed"):
		removeCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcBodyState={naked=true}})
		saynn("You get Ferri back into the cell and put the cuffs back onto her paws, just for safety. Her chest is still rising and falling, her eyes looking a little spaced out.")

		saynn("[say=ferri]Mean.. mew..[/say]")

		saynn("You give her butt one last smack with the whip.")

		saynn("[say=ferri]Eeep..[/say]")

		saynn("[say=pc]"+str(ch1("Good puppy.", "Sweet little slut.", "Worthless stupid whore."))+"[/say]")

		if (success):
			saynn("She purrs.")

		else:
			saynn("She huffs.")

		saynn("You step out.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ferri_kneels"):
		putOff("ferri", "inmatewristcuffs")

	if(_action == "ferri_back_cuffed"):
		putOn("ferri", "inmatewristcuffs")

	setState(_action)
