extends SceneBase

func _init():
	sceneID = "DomM4s3SaveKait"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("medical_near_pccell")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You approach the row of locked padded rooms.")

		saynn("[say=avy]Might be it.[/say]")

		saynn("You take your time and look into the small window slit of each one..")

		addButton("Continue", "See what happens next", "kait_reveal")
	if(state == "kait_reveal"):
		addCharacter("kait")
		aimCameraAndSetLocName("medical_paddedcell_player")
		playAnimation(StageScene.SexStart, "start", {pc="pc", npc="kait"})
		saynn("There she is! There is Kait.")

		saynn("The giant metal door is locked.. but you just press the nurse's badge against the access panel.")

		saynn("The door begins to unlock, enough to step inside. And so you do.")

		saynn("Inside.. a tiny room.. barely enough for a single person. All walls are padded with soft material. Kait is sitting in the center of it. She is wearing a straitjacket.. made out of latex.. Around her waist is a bulky chastity belt.")

		saynn("When she notices you, her eyes lazily look up at you.")

		saynn("[say=kait]..meow.. meow-w~..[/say]")

		saynn("Avy growls.")

		saynn("[say=avy]Fucking hell, what did that bitch do to you.[/say]")

		saynn("[say=kait]Meow-w-w~. You're pretty-y.[/say]")

		saynn("Her eyes are half-closed, pupils wide and unfocused. She blinks slowly, a cute little smile spreading across her muzzle.")

		saynn("[say=pc]She sedated her. We gotta get her out of here.[/say]")

		saynn("[say=avy]Well.. fucking grab the cat then. We can deal with that fucking nerd bitch some other time.[/say]")

		saynn("You reach down and begin lifting Kait up. She nuzzles you and purrs as you do that.")

		saynn("[say=kait]Warm~.[/say]")

		saynn("The moment you lift the snow leopard.. the heavy metal door closes shut! The loud clang echoes through the corridors.")

		saynn("You're trapped inside! Only Avy is left outside. You can see her through the slit.")

		saynn("[say=avy]What the..[/say]")

		saynn("[say=pc]The badge?[/say]")

		saynn("Avy tries.. but the panel flashes red.")

		saynn("[say=avy]It's not fucking working.[/say]")

		saynn("[say=kait]Meow meow.. stuck.. hehe..[/say]")

		saynn("This is not good.")

		saynn("[say=eliza]Not opening, huh~?[/say]")

		saynn("It's her voice..")

		addButton("Continue", "See what happens next", "avy_eliza_intro")
	if(state == "avy_eliza_intro"):
		addCharacter("eliza")
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance()})
		aimCameraAndSetLocName("medical_near_pccell")
		saynn("You can only watch through the small slit of the door.. but you see enough.")

		saynn("Eliza Quinn, in the flesh, standing near the entrance of the mental ward wing.")

		saynn("Avy stops trying to press the badge against the panel.. and faces her.")

		saynn("[say=avy]You. Absolute. Bitch.[/say]")

		saynn("[say=eliza]Gonna be honest, I was hoping to trap both of you. But that's okay, I can deal with one.[/say]")

		saynn("Avy raises her fists, her hind paws are placed at her shoulder width.")

		saynn("[say=avy]You think you're so smart, huh? Your stupid plan didn't work. Hope you like pain, you're about to experience all of it.[/say]")

		saynn("Eliza is holding some kind of syringe.")

		saynn("[say=eliza]Maybe I do like pain~.[/say]")

		saynn("They're about to fight. And all you can do is watch.")

		saynn("[say=kait]Avy is cute-e~..[/say]")

		addButton("Watch", "See what Avy will do next", "watch_start")
	if(state == "watch_start"):
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["punch", 0, 0, CombatAnimPlayer.ST_DODGING, ""]})
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["kick", 0, 0, CombatAnimPlayer.ST_KNOCKEDDOWN, ""]})
		saynn("The foxy does the first move. She lunges forward, going for a superman punch, her fist swinging towards Eliza's head. The feline manages to pull away in time, the punch grazing her shoulder instead of shattering her jaw.")

		saynn("[say=eliza]Nice try.[/say]")

		saynn("[say=avy]You better start begging, bitch.[/say]")

		saynn("Avy doesn't stop, she commits to a follow up, a heavy hook that Eliza avoids.. but then the last kick catches her.")

		saynn("Eliza gasps and collapses, her ribs certainly didn't like any of it.")

		saynn("[say=avy]Not so smug now, are you?[/say]")

		saynn("The feline coughs, clutching her side. But then she looks up at Avy and smiles.")

		saynn("[say=eliza]Gh.. You hit hard, I will give you that.[/say]")

		saynn("Seeing the smug expression, Avy charges again, trying to deliver another kick..")

		addButton("Continue", "See what happens next", "eliza_throws_something")
	if(state == "eliza_throws_something"):
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["throw", 1, CombatAnimPlayer.ST_KNOCKEDDOWN, 0, ""]})
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), statusUpdate=[0, 0]})
		saynn("But before Avy has a chance to attack Eliza, the doctor throws a vial at her feet. The vial shatters.. releasing a cloud of pink mist. Avy barrels through it, coughing.")

		saynn("[say=avy]Ugh.. again with this shit..[/say]")

		saynn("Avy's stops, her shorts are visibly bulging now.. more than usual. While the foxy is busy flailing the smoke away, the feline has a chance to get up.")

		saynn("[say=avy]You're only making it worse for yourself later, whore.[/say]")

		saynn("[say=eliza]I know exactly what I'm doing~.[/say]")

		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["shove",0,0,0, ""]})
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["WeaponSyringe",0,0,0, ""]})
		saynn("Avy lurches forward and manages to catch the feline before slamming her back against the wall, pinning to it. Eliza winces while Avy already starts trying to undress the doctor, to get rid of her skirt and labcoat.")

		saynn("That's when Eliza jabs a syringe into Avy's thigh.")

		saynn("[say=avy]Agh.. you bitch![/say]")

		saynn("Avy throws Eliza across the room.. but she manages to land it, her feline agility helping her stay on her hind paws.")

		saynn("Avy's hind paws though.. are under a bit more stress now. Whatever that drug was, it made Avy slower and weaker.")

		saynn("[say=eliza]You look tired, patient. I have just the room for you~.[/say]")

		saynn("[say=avy]SHUT UP![/say]")

		saynn("Avy charges again.. but this time Eliza is prepared. She sidesteps the slow attack and jabs another syringe into Avy's shoulder. Then another into her arm.. she certainly came prepared.")

		saynn("[say=avy]FUCK![/say]")

		saynn("[say=kait]..fuck~..[/say]")

		saynn("Avy growls hard, swatting Eliza away.. but the damage seems to be done.")

		addButton("Continue", "See what happens next", "avy_got_rekt")
	if(state == "avy_got_rekt"):
		playAnimation(StageScene.Duo, "defeat", {npc="eliza", pc="avy", bodyState={leashedBy="eliza"}})
		saynn("Unable to continue fighting, Avy hits the floor.")

		saynn("[say=avy]I hate YOU.[/say]")

		saynn("Eliza chuckles. She puts all her syringes away.. and then approaches the foxy.. before clicking a leash to her collar, finding little resistance.")

		saynn("[say=avy]Can't.. move..[/say]")

		saynn("[say=eliza]You earned yourself a good timeout in the soft room, patient~.[/say]")

		saynn("She looks at you through the window slit.")

		saynn("[say=eliza]A different room I guess. Come here~.[/say]")

		saynn("Eliza invites Avy to follow.. but the foxy refuses to get up.. or move.. anything.")

		saynn("[say=eliza]Really? Do you need a bigger incentive?[/say]")

		saynn("She produces another syringe with her free paw, holding it dangerously close to Avy's neck.")

		saynn("[say=avy]I'm not moving an inch.. fuck you..[/say]")

		saynn("[say=eliza]Ugh. Fine.[/say]")

		saynn("Eliza puts the syringe away and just starts pulling on the leash hard, literally dragging the poor foxy across the floor, choking her a bit in the process.")

		saynn("[say=eliza]You've beaten up all of my nurses.. ugh.. lazy girl.. so now I have to do everything myself, grr.[/say]")

		saynn("And so they get out of your.. extremely limited.. vision cone. Eliza is probably shoving Avy into the other padded room, about to close it.")

		saynn("The hope is dying fast.")

		saynn("Eliza and her tricks, she just about managed to come out as winner after everything.. she even managed to avoid having to fight you completely too.")

		saynn("What a bitch.")

		saynn("It seems.. all is lost now.")

		saynn("You're locked in a padded room. Avy is sharing your faith. And Kait is still acting silly in your hands. Ans.. isn't even aware of all of this.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_reveal"):
		getCharacter("kait").getInventory().clearSlot(InventorySlot.Body)
		putOn("kait", "LatexStraitjacket")

	if(_action == "watch_start"):
		processTime(3*60)

	setState(_action)
