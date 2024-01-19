extends SceneBase

var uniqueItemID = ""
var charactersWithPortalPanties = []
var cachedChars = false
var isRepeat = false

var portalCharID = ""
var selectedHole = "" #penis,vagina,anus
var extraText = ""

var secondPortalCharID = ""
var secondSelectedHole = ""

func _init():
	sceneID = "UsePortalPantiesFleshlight"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return portalCharID
	if(_charID == "npc2"):
		return secondPortalCharID

func sayCharacterTable():
	var tableText = "[table=5][cell]ID[/cell][cell]Name[/cell][cell]Penis[/cell][cell]Vagina[/cell][cell]Anus[/cell]"
	var ti = 1
	for character in charactersWithPortalPanties:
		tableText += "[cell]"+str(ti)+"[/cell]"
		tableText += "[cell]"+str(character.getName())+"[/cell]"
		if(character.isWearingChastityCage()):
			tableText += "[cell]Obstructed[/cell]"
		else:
			tableText += "[cell]"+("Yes" if (character.hasPenis() && !character.hasReachablePenis()) else "No")+"[/cell]"
		tableText += "[cell]"+("Yes" if character.hasVagina() else "No")+"[/cell]"
		tableText += "[cell]Yes[/cell]"
		
		ti+=1
	tableText += "[/table]"
	saynn(tableText)

func _run():
	showFightUI = false
	if(!cachedChars):
		charactersWithPortalPanties = getNpcsWithPortalPanties()
		cachedChars = true
	
	if(state == ""):
		playAnimation(StageScene.SexPortal, "tease", {onlyRight=true})
		
		saynn("You activate the fleshlight and look at the little screen that it has.")
		
		saynn("Scanning.. Scanning done. Found "+str(charactersWithPortalPanties.size())+" "+("entities" if charactersWithPortalPanties.size()!=1 else "entity")+" who are currently wearing portal panties in the entire galaxy.")
		
		addButton("Cancel", "You changed your mind", "endthescene")
		
		if(charactersWithPortalPanties.size() > 0):
			sayCharacterTable()
			
			saynn("Who do you want to connect to?")
			for character in charactersWithPortalPanties:
				if(character == null):
					continue
				addButton(str(character.getName()), "Connect to this person's portal panties", "connect_to", [character])
		else:
			saynn("Aw. The thing is kinda useless if there is no one wearing portal panties.")

	if(state == "connected"):
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		if(connectedChar != null):
			saynn("Connected to "+connectedChar.getName()+"'s portal panties.")
		
		saynn("Which portal do you want to open through the fleshlight?")
		
		addButton("Back", "Never mind", "disconnectPortal")
		if(connectedChar.hasPenis() && !connectedChar.hasReachablePenis() && !connectedChar.isWearingChastityCage()):
			addButton("Penis", "Show their dick", "openhole", ["penis"])
		if(connectedChar.hasVagina()):
			addButton("Vagina", "Show their pussy", "openhole", ["vagina"])
		addButton("Anus", "Show their anus", "openhole", ["anus"])

	if(state == "choose_vagina"):
		isRepeat = false
		extraText = ""
		playAnimation(StageScene.SexPortalOral, "tease", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)

		if(isPCPortal()):
			saynn("The fleshlight opens, revealing.. your {pc.vaginaStretch} pussy. Wow, you can see every detail of your own slit in great detail.")
		else:
			saynn("The fleshlight opens, revealing.. someone's {npc.vaginaStretch} {pussy}.")

		saynn("What do you want to do with it?")
		
		addButton("Close", "Close the portal", "disconnectPortal")
		addButtonWithChecks("Lick it!", "Lick the pussy", "vagina_lick", [], [[ButtonChecks.NotOralBlocked]])
		if(GM.pc.hasEffect(StatusEffect.HasCumInsideMouth)):
			addButtonWithChecks("Spit inside", "Spit whatever your have in your mouth into that pussy", "vagina_lick_spit", [], [[ButtonChecks.NotOralBlocked], [ButtonChecks.ContentEnabled, ContentType.CumStealing]])
		
	if(state == "vagina_lick"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalOral, ("lick" if connectedChar.getArousal() <= 0.7 else "lickfast"), {onlyRight=isPCPortal(), npc=portalCharID, npcBodyState={}})
		
		if(!isRepeat):
			if(isPCPortal()):
				saynn(RNG.pick([
					"You carefully press your lips against the sweet folds of that pussy.. and instantly feel them between your legs. Such a strange sensation.. and yet, the idea of licking yourself makes you wet in seconds..",
					"You trace your tongue along the sensitive folds.. and feel the sensation echo between your legs. A cute moan escapes you as your slit becomes wet instantly. Feeling your warm breath on your pussy is so strange..",
				]))
			else:
				saynn(RNG.pick([
					"You carefully press your lips against the sweet hot folds of that {npc.pussyStretch} pussy.. and feel it twitch a bit in response. And that makes you eager to lick it more, tasting the wetness.",
					"You trace the tip of your tongue along the sensitive folds.. and feel them becoming wet. So you lick more.",
				]))
		else:	
			if(isPCPortal()):
				saynn(RNG.pick([
					"You lick your own {pussy}, tasting your juices and watching it clench.",
					"You thrust your tongue between the folds and tongue-fuck your pussy, forcing moans out of yourself.",
					"The taste of your wet drippy {pussy} is so good that you can’t stop licking it.",
					"You focus on the clit for a bit, rubbing it with your tongue left and right. Makes you squirm so much..",
					"You prod the pussy entrance a few times and then lap up at your inner walls, panting softly while doing so.",
				]))
			else:
				saynn(RNG.pick([
					"You lick that {pussy} good, tasting the juices and watching it clench.",
					"You thrust your tongue between the {npc.pussyStretch} folds and tongue-fuck that pussy for a bit, making the wet inner walls clench.",
					"Licking that wet drippy {pussy} is so fun that you can’t stop doing it.",
					"You focus on the clit for a bit, rubbing it with your tongue left and right. The whole {pussy} pulses while you do that.",
					"You prod the pussy entrance a few times and then lap up at the inner walls while warmly breathing onto the wet folds.",
				]))
		
		if(extraText != ""):
			saynn(extraText)
			extraText = ""
		
		if(connectedChar.getArousal() >= 1.0):
			saynn("That pussy is about to cum!")
			
			addButton("Swallow!", "Swallow everything", "vagina_lick_swallow")
		else:
			addButton("Lick more", "Really lick it", "vagina_lick")
		
		isRepeat = true
	
	if(state == "vagina_lick_swallow"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalOral, "lick", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		
		if(isPCPortal()):
			saynn(RNG.pick([
				"Your own tongue pushes you past the edge, a wave of pleasure courses through you, making you moan and squirm while your {pussy} clenches and releases a fountain of juices. Swallowing your own girlcum.. so good..",
				"You arch your back and moan passionately while your pussy pulsates and releases a strong current of transparent fluids directly into your mouth. You can’t stop squirming while licking yourself clean..",
			]))
		else:
			saynn(RNG.pick([
				"You feel that pussy clenching and pulsing.. while you keep licking and rubbing it. And soon enough, it releases a fountain of juices that you are quick to lap up.",
				"Suddenly, the {pussy} starts pulsing hard.. before squirting all over your face and tongue, the transparent fluids going down your throat.",
			]))
		
		addButton("Continue", "See what happens next", "choose_vagina")

	if(state == "vagina_lick_spit"):
		playAnimation(StageScene.SexPortalOral, "lick", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		
		if(isPCPortal()):
			saynn(RNG.pick([
				"You press your lips against your own {pussy}.. and then spit "+(extraText)+" into it. So kinky..",
			]))
		else:
			saynn(RNG.pick([
				"You press your lips against your that {pussy}.. and then spit "+(extraText)+" into it.",
			]))
		addButton("Continue", "See what happens next", "choose_vagina")








	if(state == "choose_anus"):
		isRepeat = false
		extraText = ""
		playAnimation(StageScene.SexPortalOral, "tease", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)

		if(isPCPortal()):
			saynn("The fleshlight opens, revealing.. your {pc.analStretch} {asshole}. Wow, you can see every detail of your own star in great detail.")
		else:
			saynn("The fleshlight opens, revealing.. someone's {npc.analStretch} {asshole}.")

		saynn("What do you want to do with it?")
		
		addButton("Close", "Close the portal", "disconnectPortal")
		addButtonWithChecks("Lick it!", "Lick the tailhole", "anus_lick", [], [[ButtonChecks.NotOralBlocked]])
		if(GM.pc.hasEffect(StatusEffect.HasCumInsideMouth)):
			addButtonWithChecks("Spit inside", "Spit whatever your have in your mouth into that ass", "anus_lick_spit", [], [[ButtonChecks.NotOralBlocked], [ButtonChecks.ContentEnabled, ContentType.CumStealing]])
		
	if(state == "anus_lick"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalOral, ("lick" if connectedChar.getArousal() <= 0.7 else "lickfast"), {onlyRight=isPCPortal(), npc=portalCharID, npcBodyState={}})
		
		if(!isRepeat):
			if(isPCPortal()):
				saynn(RNG.pick([
					"You carefully press your lips against the clenched star.. and instantly feel them on your tailhole. Such a strange sensation.. and yet, the idea of rimming yourself makes you quite horny..",
					"You trace your tongue along the sensitive clenched pucker.. and feel the sensation echo inside you. A cute moan escapes you. Feeling your warm breath on your tailhole is so strange..",
				]))
			else:
				saynn(RNG.pick([
					"You carefully press your lips against the clenched {npc.analStretch} star.. and feel it twitch a bit in response. And that makes you eager to lick it more.",
					"You trace the tip of your tongue around the sensitive star.. and feel it react by clenching. So you start to lick more.",
				]))
		else:	
			if(isPCPortal()):
				saynn(RNG.pick([
					"You lick your own {asshole}, tasting it and watching how it clenches.",
					"You thrust your tongue into your {asshole} and tongue-fuck yourself, making yourself moan.",
					"The taste of your {pc.analStretch} {asshole} is so good that you can’t stop rimming it.",
					"You rim yourself thoroughly. Doing that makes you squirm so much..",
					"You prod the star a few times and then lap up at your inner walls, panting softly while doing so.",
				]))
			else:
				saynn(RNG.pick([
					"You lick that {asshole} good, tasting it  and watching how it clenches.",
					"You thrust your tongue into that {npc.analStretch} star and tongue-fuck it for a bit, making the wet inner walls clench.",
					"Rimming that clenching {asshole} is so fun that you can’t stop doing it.",
					"You rim that {asshole} thoroughly. It pulses while you do that.",
					"You prod that star a few times and then lap up at the inner walls while warmly breathing onto the sensitive flesh.",
				]))
		
		if(extraText != ""):
			saynn(extraText)
			extraText = ""
		
		if(connectedChar.getArousal() >= 1.0):
			saynn("That ass is about to cum!")
			
			addButton("Orgasm", "See what happens next", "anus_lick_swallow")
		else:
			addButton("Lick more", "Really lick it", "anus_lick")
		
		isRepeat = true
	
	if(state == "anus_lick_swallow"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalOral, "lick", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		
		if(isPCPortal()):
			saynn(RNG.pick([
				"Your own tongue pushes you past the edge, a wave of pleasure courses through you, making you moan and squirm while your {asshole} clenches a lot. Feels so good..",
				"You arch your back and moan passionately while your {asshole} pulsates and clenches tight. You can’t stop squirming while licking yourself clean..",
			]))
		else:
			saynn(RNG.pick([
				"You feel that {asshole} clenching and pulsing.. while you keep licking and rubbing it. ",
				"Suddenly, the {asshole} starts pulsing hard, the orgasm making it clench a lot.",
			]))
		
		addButton("Continue", "See what happens next", "choose_anus")

	if(state == "anus_lick_spit"):
		playAnimation(StageScene.SexPortalOral, "lick", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		
		if(isPCPortal()):
			saynn(RNG.pick([
				"You press your lips against your own {asshole}.. and then spit "+(extraText)+" into it. So kinky..",
			]))
		else:
			saynn(RNG.pick([
				"You press your lips against your that {asshole}.. and then spit "+(extraText)+" into it.",
			]))
		addButton("Continue", "See what happens next", "choose_anus")









	if(state == "choose_penis"):
		isRepeat = false
		extraText = ""
		playAnimation(StageScene.SexPortalOral, "hold", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		if(isPCPortal()):
			saynn("The fleshlight opens, revealing.. your {pc.penis}. Wow, you can see every detail of your member.")
		else:
			saynn("The fleshlight opens, revealing.. someone's {npc.penis}.")
		
		saynn("What do you want to do with it?")
		
		addButton("Close", "Close the portal", "disconnectPortal")
		if(!connectedChar.isReadyToPenetrate()):
			addButton("Make it hard", "Prepare that dick for more", "penis_make_hard")
		else:
			addButtonWithChecks("Suck it!", "Suck this dick", "penis_suck", [], [[ButtonChecks.NotOralBlocked]])
			
			if(GM.pc.getInventory().getUniqueAmountOf("PortalPantiesFleshlight") >= 2):
				addButton("Proxy fuck", "Make that cock fuck someone else's hole through the other fleshlight.", "penis_proxyfuck_choose")
			else:
				addDisabledButton("Proxy fuck", "You need 2 fleshlights to do this")
			
	if(state == "penis_make_hard"):
		playAnimation(StageScene.SexPortalOral, "hold", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		
		if(isPCPortal()):
			saynn("You wrap your free hand around that cock.. and start stroking it.")
			
			saynn("Yep, you're masturbating.. but it's still so weird to see your own dick getting hard before your eyes.")
			
			saynn("A few soft moans escape from you. There is a drop of precum shining on the tip of your member. Should be good enough..")
		else:
			saynn("You wrap your free hand around that cock.. and start stroking it.")
			
			saynn("Whoever that dick belongs to is probably quite confused. And yet, soon enough, their cock begins to get hard.")
			
			saynn("There is a drop of precum shining on the tip of your member. Should be good enough..")
			
		addButton("Continue", "See what happens next", "choose_penis")

	if(state == "penis_suck"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalOral, ("suck" if connectedChar.getArousal() <= 0.7 else "suckfast"), {onlyRight=isPCPortal(), npc=portalCharID, npcBodyState={hard=true}})
		
		if(!isRepeat):
			if(isPCPortal()):
				saynn(RNG.pick([
					"You wrap your lips around the tip of that tasty cock.. and immediately feel them around your cock. Feels so strange.. and yet.. so nice.",
					"You give that cock a lick.. and immediately feel it yourself. So strange.. You let the tip of your own member inside and start sucking on it.",
				]))
			else:
				saynn(RNG.pick([
					"You wrap your lips around the tip of that tasty cock.. and feel it throbbing slightly in your mouth. Huh, this only makes you want to suck it more.",
					"You give that cock a lick and watch it twitch a bit. So interesting. You let the tip of that member inside and start sucking on it.",
				]))
		else:	
			if(isPCPortal()):
				saynn(RNG.pick([
					"You suck your own {cock} through the portal panties!",
					"You keep sucking, you know exactly how to make yourself feel good..",
					"You drag your tongue over that {cock} and shiver from the sensations.",
					"The taste isn’t that bad, you could get used to sucking your own {cock} all day..",
					"You blow yourself, meeting the motions of your hand with your head.",
				]))
			else:
				saynn(RNG.pick([
					"You suck that {npc.penis} through the portal panties!",
					"You keep sucking on that {cock}, feeling it twitch inside your mouth.",
					"You drag your tongue over that {cock} and give the tip a few smooches.. before continuing to suck it thoroughly.",
					"Hard to tell if they like it.. but the taste of {npc.his} pre in your mouth suggests that they do.",
					"You blow that {cock}, meeting the motions of your hand with your head.",
				]))
		
		if(connectedChar.getArousal() >= 1.0):
			saynn("That cock is about to cum!")
			
			addButton("Swallow!", "Swallow that load", "penis_suck_swallow")
		else:
			addButton("Suck more", "Really suck that cock", "penis_suck")
		
		isRepeat = true
	
	if(state == "penis_suck_swallow"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalOral, "hold", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={}})
		
		if(isPCPortal()):
			saynn(RNG.pick([
				"You produce muffled grunts and moans while your own {pc.penis} is throbbing inside your mouth, shooting {pc.cum} deep down your throat.. so good..",
				"You shove your own {cock} as deep as your {pc.throatStretch} throat allows and squirm while it's throbbing and stuffing your belly full of your own seed.",
			]))
		else:
			saynn(RNG.pick([
				"You feel that {npc.penis} throb inside your mouth.. before shooting strings of thick {npc.cum} deep down your throat..",
				"You shove that {npc.penis} as deep as your {pc.throatStretch} throat allows and just sit still, letting it throb inside and stuff your belly full of thick warm seed.",
			]))
		
		addButton("Continue", "See what happens next", "choose_penis")
	
	if(state == "penis_proxyfuck_choose"):
		saynn("Who do you want to fuck with the cock that you're holding.")
		addButton("Back", "You changed your mind", "choose_penis")
		
		sayCharacterTable()
		
		for character in charactersWithPortalPanties:
			if(character == null):
				continue
			addButton(str(character.getName()), "Proxy-fuck this person!", "penis_proxyfuck_secondchoose", [character])

	if(state == "penis_proxyfuck_choose_hole"):
		if(secondPortalCharID == "pc" && portalCharID == "pc"):
			playAnimation(StageScene.SexPortalProxy, "tease", {onlyRight=true})
		else:
			playAnimation(StageScene.SexPortalProxy, "tease", {onlyRight=(secondPortalCharID=="pc"), npc=secondPortalCharID, npc2=portalCharID})
		
		var connectedChar = GlobalRegistry.getCharacter(secondPortalCharID)
		if(connectedChar != null):
			saynn("Second flehslight is connected to "+connectedChar.getName()+"'s portal panties.")
		
		saynn("Which portal do you want to open through the fleshlight?")
		
		addButton("Back", "Never mind", "disconnectPortal")
		if(connectedChar.hasVagina()):
			addButton("Vagina", "Use the cock to fuck their pussy", "penis_proxyfuck_vagina", ["vagina"])
		addButton("Anus", "Use the cock to fuck their anus", "penis_proxyfuck_anus", ["anus"])

func calcArousalBasedOnKink(_theKink):
	var connectedChar = GlobalRegistry.getCharacter(portalCharID)
	return (0.1 + connectedChar.getLustLevel()*0.1)

func _react(_action: String, _args):
	if(_action == "endthescene"):
		GM.pc.setArousal(0.0)
		endScene()
		return
	
	if(_action == "penis_proxyfuck_secondchoose"):
		var character = _args[0]
		secondPortalCharID = character.getID()
		if(!character.isPlayer()):
			addCharacter(portalCharID)
		setState("penis_proxyfuck_choose_hole")
		return
	
	if(_action == "anus_lick_swallow"):
		#GM.pc.cummedInMouthBy(portalCharID, FluidSource.Vagina, RNG.randf_range(0.3,0.5))
		#GM.pc.cummedOnBy(portalCharID, FluidSource.Vagina, RNG.randf_range(0.1,0.4))
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.orgasmFrom(portalCharID)
		connectedChar.setArousal(0.0)
	
	if(_action == "anus_lick_spit"):
		extraText = GM.pc.getBodypartContentsStringList(BodypartSlot.Head)
		GM.pc.bodypartTransferFluidsTo(BodypartSlot.Head, portalCharID, BodypartSlot.Anus, 0.2, 20.0)
	
	if(_action == "anus_lick"):
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(Fetish.OralSexReceiving))
		
		if(connectedChar.hasEffect(StatusEffect.HasCumInsideAnus) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(20)):
				if(connectedChar.bodypartTransferFluidsTo(BodypartSlot.Anus, "pc", BodypartSlot.Head, 0.1, 20.0)):
					extraText = RNG.pick([ 
						Util.capitalizeFirstLetter(connectedChar.getBodypartContentsStringList(BodypartSlot.Vagina))+" lands on your tongue, leaking out of {npc.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["asshole", "tailhole"])+".",
					])
	
	if(_action == "vagina_lick_swallow"):
		GM.pc.cummedInMouthBy(portalCharID, FluidSource.Vagina, RNG.randf_range(0.3,0.5))
		GM.pc.cummedOnBy(portalCharID, FluidSource.Vagina, RNG.randf_range(0.1,0.4))
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.orgasmFrom(portalCharID)
		connectedChar.setArousal(0.0)
	
	if(_action == "vagina_lick_spit"):
		extraText = GM.pc.getBodypartContentsStringList(BodypartSlot.Head)
		GM.pc.bodypartTransferFluidsTo(BodypartSlot.Head, portalCharID, BodypartSlot.Vagina, 0.2, 20.0)
	
	if(_action == "vagina_lick"):
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(Fetish.OralSexReceiving))
		
		if(connectedChar.hasEffect(StatusEffect.HasCumInsideVagina) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(20)):
				if(connectedChar.bodypartTransferFluidsTo(BodypartSlot.Vagina, "pc", BodypartSlot.Head, 0.1, 20.0)):
					extraText = RNG.pick([ 
						Util.capitalizeFirstLetter(connectedChar.getBodypartContentsStringList(BodypartSlot.Vagina))+" lands on your tongue, leaking out of {npc.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+".",
					])
	
	if(_action == "penis_suck_swallow"):
		GM.pc.gotThroatFuckedBy(portalCharID)
		GM.pc.cummedInMouthBy(portalCharID)
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.orgasmFrom(portalCharID)
		connectedChar.setArousal(0.0)
	
	if(_action == "penis_suck"):
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(Fetish.OralSexReceiving))

	if(_action == "penis_make_hard"):
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		while(!connectedChar.isReadyToPenetrate()):
			connectedChar.addLust(5)
			if(connectedChar.getLustLevel() >= 1.0):
				break

	if(_action == "disconnectPortal"):
		if(portalCharID != ""):
			var connectedChar = GlobalRegistry.getCharacter(portalCharID)
			if(connectedChar != null):
				connectedChar.setArousal(0.0)
			if(portalCharID != "pc"):
				removeCharacter(portalCharID)
			if(secondPortalCharID != "pc"):
				removeCharacter(secondPortalCharID)
			secondPortalCharID = ""
			portalCharID = ""
		setState("")
		return

	if(_action == "connect_to"):
		var character = _args[0]
		portalCharID = character.getID()
		if(!character.isPlayer()):
			addCharacter(portalCharID)
			#GM.main.updateCharacterUntilNow(portalCharID)
		setState("connected")
		return

	if(_action == "openhole"):
		selectedHole = _args[0]
		setState("choose_"+selectedHole)
		return

	setState(_action)

func isPCPortal():
	return portalCharID == "pc"

func getNpcsWithPortalPanties():
	var result = []
	
	if(GM.pc.isWearingPortalPanties()):
		result.append(GM.pc)
	
	var staticChars = GM.main.getCharacters()
	for charID in staticChars:
		var character:Character = staticChars[charID]
		if(character.isWearingPortalPanties()):
			character.updateNonBattleEffects()
			result.append(character)
	
	var dynamicChars = GM.main.getDynamicCharacters()
	for charID in dynamicChars:
		var character:Character = dynamicChars[charID]
		if(character.isWearingPortalPanties()):
			character.updateNonBattleEffects()
			result.append(character)
	
	return result

func saveData():
	var data = .saveData()

	data["uniqueItemID"] = uniqueItemID
	data["portalCharID"] = portalCharID
	data["selectedHole"] = selectedHole
	data["extraText"] = extraText
	data["secondPortalCharID"] = secondPortalCharID
	data["secondSelectedHole"] = secondSelectedHole

	return data

func loadData(data):
	.loadData(data)

	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
	portalCharID = SAVE.loadVar(data, "portalCharID", "pc")
	selectedHole = SAVE.loadVar(data, "selectedHole", "")
	extraText = SAVE.loadVar(data, "extraText", "")
	secondPortalCharID = SAVE.loadVar(data, "secondPortalCharID", "pc")
	secondSelectedHole = SAVE.loadVar(data, "secondSelectedHole", "")
	
