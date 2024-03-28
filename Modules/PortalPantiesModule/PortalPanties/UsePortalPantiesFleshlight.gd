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

func charCanUsePenis(character):
	if(character.isWearingPortalPanties()):
		return (character.hasPenis() && !character.isWearingChastityCage() && !character.hasReachablePenis())
	if(character.isWearingInvisiblePortalPanties()):
		return character.hasPenis() && !character.isWearingChastityCage() && character.getPortalSexHoleAvailable(BodypartSlot.Penis)
	return false

func charCanUseVagina(character):
	if(character.isWearingPortalPanties()):
		return (character.hasVagina())
	if(character.isWearingInvisiblePortalPanties()):
		return character.hasVagina() && character.getPortalSexHoleAvailable(BodypartSlot.Vagina)
	return false

func charCanUseAnus(character):
	if(character.isWearingPortalPanties()):
		return (character.hasAnus())
	if(character.isWearingInvisiblePortalPanties()):
		return character.hasAnus() && character.getPortalSexHoleAvailable(BodypartSlot.Anus)
	return false

func sayCharacterTable():
	var tableText = "[table=5][cell]ID[/cell][cell]Name[/cell][cell]Penis[/cell][cell]Vagina[/cell][cell]Anus[/cell]"
	var ti = 1
	for character in charactersWithPortalPanties:
		tableText += "[cell]"+str(ti)+"[/cell]"
		tableText += "[cell]"+str(character.getName())+"[/cell]"
		if(character.isWearingChastityCage()):
			tableText += "[cell]Obstructed[/cell]"
		else:
			tableText += "[cell]"+("Yes" if charCanUsePenis(character) else "No")+"[/cell]"
		tableText += "[cell]"+("Yes" if charCanUseVagina(character) else "No")+"[/cell]"
		tableText += "[cell]"+("Yes" if charCanUseAnus(character) else "No")+"[/cell]"
		
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
		if(charCanUsePenis(connectedChar)):
			addButton("Penis", "Show their dick", "openhole", ["penis"])
		if(charCanUseVagina(connectedChar)):
			addButton("Vagina", "Show their pussy", "openhole", ["vagina"])
		if(charCanUseAnus(connectedChar)):
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
		else:
			addDisabledButton("Spit inside", "You don't have anything in your mouth")
		addButtonWithChecks("Fuck it!", "Use your cock to fuck this hole", "vagina_fuck", [], [[ButtonChecks.HasReachablePenis]])
		
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
		else:
			addDisabledButton("Spit inside", "You don't have anything in your mouth")
		addButtonWithChecks("Fuck it!", "Use your cock to fuck this hole", "anus_fuck", [], [[ButtonChecks.HasReachablePenis]])
		
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
			
			addButtonWithChecks("Ride it", "Position that fleshlight on the floor and ride it!", "penis_ride_choose", [], [[ButtonChecks.HasReachableVaginaOrAnus]])
			addButtonWithChecks("Masturbate with", "Masturbate using this cock", "penis_masturbate_choose", [], [[ButtonChecks.HasReachableVaginaOrAnus]])
			
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

	if(state == "penis_masturbate_choose"):
		showFightUI = true
		
		playAnimation(StageScene.SexPortalMasturbation, "tease", {npc=portalCharID, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("Where do you want to put this cock?")
		
		addButtonWithChecks("Pussy", "Fuck your pussy with that cock", "penis_masturbate_vagina", [], [[ButtonChecks.HasReachableVagina]])
		addButtonWithChecks("Ass", "Fuck your ass with that cock", "penis_masturbate_anus", [], [[ButtonChecks.HasReachableAnus]])
		addButton("Back", "Never mind", "choose_penis")



	if(state == "penis_masturbate_vagina"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		if(!isRepeat):
			playAnimation(StageScene.SexPortalMasturbation, ("inside"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}})
			
			saynn(RNG.pick([
				"You bring the fleshlight to your butt and then align it with your {pc.vaginaStretch} pussy.. Seeing how it twitches and drips pre when brushing against your sensitive bits only makes you want to put it in faster.. A moan escapes your lips as the tip spreads your petals and slides inside.",
				"You feel so needy that you don’t waste any time and shove that {npc.penis} down your pussy! A cute moan escapes your lips as you feel it spreading your slick inner walls and dripping precum inside..",
			]))
		else:
			playAnimation(StageScene.SexPortalMasturbation, ("sex" if connectedChar.getArousal() <= 0.7 else "fast"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}})
			
			saynn(RNG.pick([
				"You use that {penis} like a dildo, shoving it in and out of your needy {pussy}.",
				"You keep your butt stuck out as you stuff your {pussy} with that hard piece of meat, your inner walls squeezing it tight!",
				"You keep fucking your wet {pussy} with that cock, your other hand covering up your moans.",
				"They are probably squirming as much as you, their {penis} is twitching inside your pussy as you masturbate with it!",
				"You use that {penis} for your pleasure, sliding it inside your {pussy} like it’s some kind of sextoy.",
			]))
		
		if(extraText != ""):
			saynn(extraText)
			extraText = ""
		
		if(connectedChar.getArousal() >= 1.0):
			saynn("That cock is about to cum!")
			
			addButton("Inside!", "Make it cum inside you", "penis_masturbate_vagina_inside")
		else:
			addButton("Ride more", "It feels so good!", "penis_masturbate_vagina")
		
		isRepeat = true

	if(state == "penis_masturbate_vagina_inside"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalMasturbation, ("inside"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}, npcBodyState={hard=true}})
			
		saynn(RNG.pick([
			"You let out some soft moans as that {penis} starts throbbing inside you before releasing its load directly into your awaiting womb! Your legs are shaking as your pussy is milking that shaft for everything that it has.",
			"You keep shoving that cock in and out.. until it suddenly starts pumping your {pussy} full of its seed! So much that some of it is already leaking out. Your legs are shaky, your lips let out a few cute moans..",
		]))
		
		addButton("Continue", "See what happens next", "choose_penis")


	if(state == "penis_masturbate_anus"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		if(!isRepeat):
			playAnimation(StageScene.SexPortalMasturbation, ("inside"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}})
			
			saynn(RNG.pick([
				"You bring the fleshlight to your butt and then align it with your {pc.analStretch} {asshole}.. Seeing how it twitches and drips pre when brushing against your sensitive bits only makes you want to put it in faster.. A moan escapes your lips as the tip spreads your star and slides inside.",
				"You feel so needy that you don’t waste any time and shove that {npc.penis} down your ass! A cute moan escapes your lips as you feel it spreading your warm inner walls and dripping precum inside..",
			]))
		else:
			playAnimation(StageScene.SexPortalMasturbation, ("sex" if connectedChar.getArousal() <= 0.7 else "fast"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}})
			
			saynn(RNG.pick([
				"You use that {penis} like a dildo, shoving it in and out of your needy {asshole}.",
				"You keep your butt stuck out as you stuff your {asshole} with that hard piece of meat, your inner walls squeezing it tight!",
				"You keep fucking your {ass} with that cock, your other hand covering up your moans.",
				"They are probably squirming as much as you, their {penis} is twitching inside your tailhole as you masturbate with it!",
				"You use that {penis} for your pleasure, sliding it inside your {ass} like it’s some kind of sextoy.",
			]))
		
		if(extraText != ""):
			saynn(extraText)
			extraText = ""
		
		if(connectedChar.getArousal() >= 1.0):
			saynn("That cock is about to cum!")
			
			addButton("Inside!", "Make it cum inside you", "penis_masturbate_anus_inside")
		else:
			addButton("Ride more", "It feels so good!", "penis_masturbate_anus")
		
		isRepeat = true

	if(state == "penis_masturbate_anus_inside"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalMasturbation, ("inside"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}, npcBodyState={hard=true}})
			
		saynn(RNG.pick([
			"You let out some soft moans as that {penis} starts throbbing inside before releasing its load directly into your ass! Your legs are shaking as your {asshole} is milking that shaft for everything that it has.",
			"You keep shoving that cock in and out.. until it suddenly starts pumping your {ass} full of its seed! So much that some of it is already leaking out. Your legs are shaky, your lips let out a few cute moans..",
		]))
		
		addButton("Continue", "See what happens next", "choose_penis")



	if(state == "penis_ride_choose"):
		showFightUI = true
		
		playAnimation(StageScene.SexPortalRide, "tease", {npc=portalCharID, bodyState={exposedCrotch=true, hard=true}})
		
		saynn("How do you want to ride it?")
		
		addButtonWithChecks("Pussy", "Ride their cock with your pussy", "penis_ride_vagina", [], [[ButtonChecks.HasReachableVagina]])
		addButtonWithChecks("Ass", "Ride their cock with your ass", "penis_ride_anus", [], [[ButtonChecks.HasReachableAnus]])
		addButton("Back", "Never mind", "choose_penis")

	if(state == "penis_ride_vagina"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		if(!isRepeat):
			playAnimation(StageScene.SexPortalRide, ("inside"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}})
			
			saynn(RNG.pick([
				"You place the fleshlight with someone’s {npc.penis} on the floor and then position yourself above it. One of your hands guides it down your {pc.vaginaStretch} {pussy} while you slowly lower yourself onto it. A little cute noise leaves your lips as you feel it spreading your petals and sliding inside your wet love tunnel.. Time to ride it..",
				"You place the fleshlight with someone’s {npc.penis} on the floor and then position yourself above it. Your {pc.vaginaStretch} {pussy} is already quite wet as you lower yourself onto that shaft, its tip spreading your petal and sliding inside, brushing against your inner walls and forcing a little moan out of you.. Time to ride it..",
			]))
		else:
			playAnimation(StageScene.SexPortalRide, ("sex" if connectedChar.getArousal() <= 0.7 else "fast"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}})
			
			saynn(RNG.pick([
				"You ride that hard {penis}, raising your body before bringing yourself down onto it, your {pussy} getting all tight when you’re getting most of it inside.",
				"Your {pc.breasts} bounce a bit while you ride that {npc.penis}. It’s so.. warm and slick.. better than any toy.",
				"You can feel their {npc.penis} twitching inside you.. so you ride it harder. You’re not planning to stop until you milk those balls dry.",
				"That {penis} is hitting your g-spot so well, more and more moans escape from you as you ride it.",
				"They’re probably quite confused about why their {penis} is suddenly getting squeezed by your pussy.. good.. Your drippy pussy is coating it with your juices while you ride it.",
				"You are riding that {penis} like it's just a dildo, an object to pleasure yourself with.. But it’s so much better than any dildo.",
			]))
		
		if(extraText != ""):
			saynn(extraText)
			extraText = ""
		
		if(connectedChar.getArousal() >= 1.0):
			saynn("That cock is about to cum!")
			
			addButton("Inside!", "Make it cum inside you", "penis_ride_vagina_inside")
		else:
			addButton("Ride more", "It feels so good!", "penis_ride_vagina")
		
		isRepeat = true

	if(state == "penis_ride_vagina_inside"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalRide, ("inside"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}, npcBodyState={hard=true}})
			
		saynn(RNG.pick([
			"Their {npc.penis} is throbbing and pulsing inside you.. While you just keep riding it. And soon enough, you feel your {pussy} flooded with waves of sticky {npc.cum}, your womb getting stuffed full. Good..",
			"You were so busy riding that {npc.penis} that you didn’t even notice when it began pulsing and cumming inside your {pussy}! Waves after waves of sticky hot seed are filling you up.. while you moan and squirm on top of it.",
		]))
		
		addButton("Continue", "See what happens next", "choose_penis")



	if(state == "penis_ride_anus"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		if(!isRepeat):
			playAnimation(StageScene.SexPortalRide, ("inside"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}})
			
			saynn(RNG.pick([
				"You place the fleshlight with someone’s {npc.penis} on the floor and then position yourself above it. One of your hands guides it down your {pc.anusStretch} {anus} while you slowly lower yourself onto it. A little cute noise leaves your lips as you feel it spreading your star and sliding inside your needy love tunnel.. Time to ride it..",
				"You place the fleshlight with someone’s {npc.penis} on the floor and then position yourself above it. Your {pc.anusStretch} {anus} is already feeling quite needy as you lower yourself onto that shaft, its tip spreading your anal star and sliding inside, brushing against your inner walls and forcing a little moan out of you.. Time to ride it..",
			]))
		else:
			playAnimation(StageScene.SexPortalRide, ("sex" if connectedChar.getArousal() <= 0.7 else "fast"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}})
			
			saynn(RNG.pick([
				"You ride that hard {penis}, raising your body before bringing yourself down onto it, your {asshole} getting all tight when you’re getting most of it inside.",
				"Your {pc.breasts} bounce a bit while you ride that {npc.penis}. It’s so.. warm and slick.. better than any toy.",
				"You can feel their {npc.penis} twitching inside you.. so you ride it harder. You’re not planning to stop until you milk those balls dry.",
				"That {penis} is hitting your sensitive spot so well, more and more moans escape from you as you ride it.",
				"They’re probably quite confused about why their {penis} is suddenly getting squeezed by your ass.. good.. Your legs are shivering slightly while you ride it, warmness spreading throughout your whole body.",
				"You are riding that {penis} like it's just a dildo, an object to pleasure yourself with.. But it’s so much better than any dildo.",
			]))
		
		if(extraText != ""):
			saynn(extraText)
			extraText = ""
		
		if(connectedChar.getArousal() >= 1.0):
			saynn("That cock is about to cum!")
			
			addButton("Inside!", "Make it cum inside you", "penis_ride_anus_inside")
		else:
			addButton("Ride more", "It feels so good!", "penis_ride_anus")
		
		isRepeat = true

	if(state == "penis_ride_anus_inside"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortalRide, ("inside"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={exposedCrotch=true, hard=true}, npcBodyState={hard=true}})
			
		saynn(RNG.pick([
			"Their {npc.penis} is throbbing and pulsing inside you.. While you just keep riding it. And soon enough, you feel your {ass} getting flooded with waves of sticky {npc.cum}, your inner walls painted white. Good..",
			"You were so busy riding that {npc.penis} that you didn’t even notice when it began pulsing and cumming inside your {ass}! Waves after waves of sticky hot seed are filling you up.. while you moan and squirm on top of it.",
		]))
		
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
		if(charCanUseVagina(connectedChar)):
			addButton("Vagina", "Use the cock to fuck their pussy", "penis_proxyfuck_vagina", ["vagina"])
		if(charCanUseAnus(connectedChar)):
			addButton("Anus", "Use the cock to fuck their anus", "penis_proxyfuck_anus", ["anus"])

	if(state == "penis_proxyfuck_vagina"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		#var subConnectedChar = GlobalRegistry.getCharacter(secondPortalCharID)
		
		var animName = ("sex" if connectedChar.getArousal() <= 0.7 else "fast")
		if(!isRepeat):
			animName = "inside"
		if(secondPortalCharID == "pc" && portalCharID == "pc"):
			playAnimation(StageScene.SexPortalProxy, animName, {onlyRight=true})
		else:
			playAnimation(StageScene.SexPortalProxy, animName, {onlyRight=(secondPortalCharID=="pc"), npc=secondPortalCharID, npc2=portalCharID})
		
		if(!isRepeat):
			if(secondPortalCharID == "pc" && portalCharID == "pc"):
				# You fuck yourself
				saynn(RNG.pick([
					"You press the fleshlights together, causing your own {penis} to penetrate your own pussy.. Moans escape you as your moist inner walls clench around your shaft..",
				]))
			elif(secondPortalCharID == "pc"):
				# You are being fucked
				saynn(RNG.pick([
					"You press the fleshlights together, causing someone's {penis} to penetrate your pussy.. Moans escape you as your moist inner walls clench around that hard shaft..",
				]))
			elif(isPCPortal()):
				# You fuck someone else
				saynn(RNG.pick([
					"You press the fleshlights together, causing your {penis} to penetrate someone's {pussy} with ease! Let's hope that they are ready because you don't plan on stopping there..",
				]))
			elif(secondPortalCharID == portalCharID):
				# Someone else fucks themselves
				saynn(RNG.pick([
					"You press the fleshlights together, making someone's {penis} go up their own {pussy}! Hopefully they are ready because you're gonna make them fuck themselves!",
				]))
			else:
				# 2 different npcs fuck
				saynn(RNG.pick([
					"You press the fleshlights together, making someone's {penis} penetrate someone else's {pussy}! Hopefully they are both ready because you don't plan on stopping there..",
				]))
		else:	
			if(secondPortalCharID == "pc" && portalCharID == "pc"):
				# You fuck yourself
				saynn(RNG.pick([
					"You move the fleshlights against each other, moaning as your own {penis} is fucking your {npc2.vaginaStretch} {pussy}!",
					"Your body squirms.. while you are fucking yourself in the most weird way possible.",
					"You can hear your pussy making wet noises as you shove your own {penis} in and out.. Feels so good.",
					"Each time you slide the fleshlight with your {pussy} along your own {penis}, it spreads your wet inner walls and hammers away at your g-spot.. You know exactly how to make yourself feel good.",
					"You’re pounding your own {pussy} with your {pc.penis} fast and hard! A slight bump appears on your belly as your {penis} is reaching your cervix each time.",
				]))
			elif(secondPortalCharID == "pc"):
				# You are being fucked
				saynn(RNG.pick([
					"You move the fleshlights against each other, moaning as someone’s {penis} is fucking your {npc2.vaginaStretch} {pussy}!",
					"Your body squirms.. while you are making someone fuck you in the most weird way possible.",
					"You can hear your pussy making wet noises as you shove someone’s {penis} in and out.. Feels so good.",
					"Each time you slide the fleshlight with your {pussy} along your that {penis}, it spreads your wet inner walls and hammers away at your g-spot.. You know exactly how to make yourself feel good.",
					"You’re pounding your {pussy} with someone’s {npc.penis} fast and hard like it’s a dildo! A slight bump appears on your belly as that {penis} is reaching your cervix each time.",
				]))
			elif(isPCPortal()):
				# You fuck someone else
				saynn(RNG.pick([
					"You move the fleshlights against each other, panting softly as your {penis} is fucking someone’s {npc2.vaginaStretch} {pussy}!",
					"Your body squirms a bit.. while you are fucking someone in the most weird way possible.",
					"You can hear that {pussy} making wet noises as you shove your {penis} in and out.. Yeah, take that, slut.",
					"Each time you slide the fleshlight with that {pussy} along your {penis}, it spreads their wet inner walls and hammers away at their g-spot.. Makes that pussy feel so tight..",
					"You’re pounding that {pussy} with your {npc.penis} fast and hard, having your member disconnected from your body makes it so much easier to fuck someone!",
				]))
			elif(secondPortalCharID == portalCharID):
				# Someone else fucks themselves
				saynn(RNG.pick([
					"You move the fleshlights against each other, making it so someone’s {penis} is fucking their own {npc2.vaginaStretch} {pussy}!",
					"Your eyes watch with great interest.. while you are making someone fuck themselves in the most weird way possible.",
					"You can hear that pussy making wet noises as you shove their own {penis} in and out.. Should feel good for them, it’s double the stimulation after all.",
					"Each time you slide the fleshlight with someone’s {pussy} along their {penis}, it spreads their wet inner walls and hammers away at their g-spot.. You can spot the muscles twitching since you’re watching the action from up so close.",
					"You’re pounding someone’s {pussy} with their own {npc.penis} fast and hard! That pussy is dripping juices all over the other fleshlight.",
				]))
			else:
				# 2 different npcs fuck
				saynn(RNG.pick([
					"You move the fleshlights against each other, making it so someone’s {penis} is fucking that {npc2.vaginaStretch} {pussy}! They probably don’t even realize that you are making them fuck each other.",
					"Your eyes watch with great interest.. while you are making someone fuck someone else in the most weird way possible.",
					"You can hear that pussy making wet noises as you shove someone {penis} in and out.. Feels strange to see a fleshlight work like the real thing.. but it is also quite fun.",
					"Each time you slide the fleshlight with someone’s {pussy} along someone else’s {penis}, it spreads their wet inner walls and hammers away at their g-spot.. You can spot the muscles twitching since you’re watching the action from up so close.",
					"You’re pounding someone’s {pussy} with a stranger’s {npc.penis} fast and hard! That pussy is dripping juices all over the other fleshlight.",
				]))
			
		if(extraText != ""):
			saynn(extraText)
			extraText = ""
		
		if(connectedChar.getArousal() >= 1.0):
			saynn("That cock is about to cum!")
			
			addButton("Orgasm", "See what happens", "penis_proxyfuck_vagina_orgasm")
		else:
			addButton("More", "Keeps those toys moving against each other", "penis_proxyfuck_vagina")
		
		isRepeat = true

	if(state == "penis_proxyfuck_vagina_orgasm"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		if(secondPortalCharID == "pc" && portalCharID == "pc"):
			playAnimation(StageScene.SexPortalProxy, "inside", {onlyRight=true})
		else:
			playAnimation(StageScene.SexPortalProxy, "inside", {onlyRight=(secondPortalCharID=="pc"), npc=secondPortalCharID, npc2=portalCharID})
	
		if(secondPortalCharID == "pc" && portalCharID == "pc"):
			# You fuck yourself
			saynn(RNG.pick([
				"You let out some passionate stifled noises as your {npc.penis} is throbbing inside your {pussy}.. before stuffing your womb to the brim with your seed. You curl your toes and squirm a lot, your hands shaking, making your cock rub against your pussy walls more..",
			]))
		elif(secondPortalCharID == "pc"):
			# You are being fucked
			saynn(RNG.pick([
				"You let out some passionate stifled noises as someone’s {npc.penis} is throbbing inside your {pussy}.. before stuffing your womb to the brim with its seed. You curl your toes and squirm a lot, your hands shaking, making that cock rub against your pussy walls more..",
			]))
		elif(isPCPortal()):
			# You fuck someone else
			saynn(RNG.pick([
				"You grunt softly as your {npc.penis} is throbbing inside that clenching {pussy}.. before stuffing its womb to the brim with your seed. Remote breeding, fuck yeah.",
			]))
		elif(secondPortalCharID == portalCharID):
			# Someone else fucks themselves
			saynn(RNG.pick([
				"You can’t help but to grin while watching that throbbing {npc.penis} cum inside the {pussy} that belongs to the same person. What if you just made them knock themselves up?",
			]))
		else:
			# 2 different npcs fuck
			saynn(RNG.pick([
				"You can’t help but to smile while watching that throbbing {npc.penis} cum inside the helpless twitching {pussy}. You just made two complete strangers breed. Nice.",
			]))
	
		addButton("Continue", "See what happens next", "choose_penis")




	if(state == "penis_proxyfuck_anus"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		#var subConnectedChar = GlobalRegistry.getCharacter(secondPortalCharID)
		
		var animName = ("sex" if connectedChar.getArousal() <= 0.7 else "fast")
		if(!isRepeat):
			animName = "inside"
		if(secondPortalCharID == "pc" && portalCharID == "pc"):
			playAnimation(StageScene.SexPortalProxy, animName, {onlyRight=true})
		else:
			playAnimation(StageScene.SexPortalProxy, animName, {onlyRight=(secondPortalCharID=="pc"), npc=secondPortalCharID, npc2=portalCharID})
		
		if(!isRepeat):
			if(secondPortalCharID == "pc" && portalCharID == "pc"):
				# You fuck yourself
				saynn(RNG.pick([
					"You press the fleshlights together, causing your own {penis} to penetrate your own {anus}.. Moans escape you as your moist inner walls clench around your shaft..",
				]))
			elif(secondPortalCharID == "pc"):
				# You are being fucked
				saynn(RNG.pick([
					"You press the fleshlights together, causing someone's {penis} to penetrate your ass.. Moans escape you as your needy inner walls clench around that hard shaft..",
				]))
			elif(isPCPortal()):
				# You fuck someone else
				saynn(RNG.pick([
					"You press the fleshlights together, causing your {penis} to penetrate someone's {anus} with ease! Let's hope that they are ready because you don't plan on stopping there..",
				]))
			elif(secondPortalCharID == portalCharID):
				# Someone else fucks themselves
				saynn(RNG.pick([
					"You press the fleshlights together, making someone's {penis} go up their own {ass}! Hopefully they are ready because you're gonna make them fuck themselves!",
				]))
			else:
				# 2 different npcs fuck
				saynn(RNG.pick([
					"You press the fleshlights together, making someone's {penis} penetrate someone else's {anus}! Hopefully they are both ready because you don't plan on stopping there..",
				]))
		else:	
			if(secondPortalCharID == "pc" && portalCharID == "pc"):
				# You fuck yourself
				saynn(RNG.pick([
					"You move the fleshlights against each other, moaning as your own {penis} is fucking your {npc2.anusStretch} {anus}!",
					"Your body squirms.. while you are fucking yourself in the most weird way possible.",
					"You can hear your {anus} making wet noises as you shove your own {penis} in and out.. Feels so good.",
					"Each time you slide the fleshlight with your {anus} along your own {penis}, it spreads your wet inner walls wide and hammers away at your prostate.. You know exactly how to make yourself feel good.",
					"You’re pounding your own {anus} with your {npc.penis} fast and hard! A slight bump appears on your belly as your {penis} is reaching deep and putting pressure on your inner walls.",
				]))
			elif(secondPortalCharID == "pc"):
				# You are being fucked
				saynn(RNG.pick([
					"You move the fleshlights against each other, moaning as someone’s {penis} is fucking your {npc2.anusStretch} {anus}!",
					"Your body squirms.. while you are making someone fuck you in the most weird way possible.",
					"You can hear your {anus} making wet noises as you shove someone’s {penis} in and out.. Feels so good.",
					"Each time you slide the fleshlight with your {anus} along your that {penis}, it spreads your wet inner walls and hammers away at your pleasure spot.. You know exactly how to make yourself feel good.",
					"You’re pounding your {anus} with someone’s {npc.penis} fast and hard like it’s a dildo! A slight bump appears on your belly as that {penis} is reaching deep and putting pressure on all your buttons.",
				]))
			elif(isPCPortal()):
				# You fuck someone else
				saynn(RNG.pick([
					"You move the fleshlights against each other, panting softly as your {penis} is fucking someone’s {npc2.anusStretch} {anus}!",
					"Your body squirms a bit.. while you are fucking someone in the most weird way possible.",
					"You can hear that {anus} making wet noises as you shove your {penis} in and out.. Yeah, take that, slut.",
					"Each time you slide the fleshlight with that {anus} along your {penis}, it spreads their wet inner walls and hammers away at all their buttons.. Makes that ass feel so tight..",
					"You’re pounding that {anus} with your {npc.penis} fast and hard, having your member disconnected from your body makes it so much easier to fuck someone!",
				]))
			elif(secondPortalCharID == portalCharID):
				# Someone else fucks themselves
				saynn(RNG.pick([
					"You move the fleshlights against each other, making it so someone’s {penis} is fucking their own {npc2.anusStretch} {anus}!",
					"Your eyes watch with great interest.. while you are making someone fuck themselves in the most weird way possible.",
					"You can hear that {anus} making wet noises as you shove their own {penis} in and out.. Should feel good for them, it’s double the stimulation after all.",
					"Each time you slide the fleshlight with someone’s {anus} along their {penis}, it spreads their wet inner walls and hammers away at their prostate.. You can spot the muscles twitching since you’re watching the action from up so close.",
					"You’re pounding someone’s {anus} with their own {npc.penis} fast and hard! That slut is clenching tight around its own cock!",
				]))
			else:
				# 2 different npcs fuck
				saynn(RNG.pick([
					"You move the fleshlights against each other, making it so someone’s {penis} is fucking that {npc2.anusStretch} {anus}! They probably don’t even realize that you are making them fuck each other.",
					"Your eyes watch with great interest.. while you are making someone fuck someone else in the most weird way possible.",
					"You can hear that {anus} making wet noises as you shove someone {penis} in and out.. Feels strange to see a fleshlight work like the real thing.. but it is also quite fun.",
					"Each time you slide the fleshlight with someone’s {anus} along someone else’s {penis}, it spreads their wet inner walls and hammers away at all their buttons.. You can spot the muscles twitching since you’re watching the action from up so close.",
					"You’re pounding someone’s {anus} with a stranger’s {npc.penis} fast and hard! That slut is clenching tight around some stranger’s cock!",
				]))
			
		if(extraText != ""):
			saynn(extraText)
			extraText = ""
		
		if(connectedChar.getArousal() >= 1.0):
			saynn("That cock is about to cum!")
			
			addButton("Orgasm", "See what happens", "penis_proxyfuck_anus_orgasm")
		else:
			addButton("More", "Keeps those toys moving against each other", "penis_proxyfuck_anus")
		
		isRepeat = true

	if(state == "penis_proxyfuck_anus_orgasm"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		if(secondPortalCharID == "pc" && portalCharID == "pc"):
			playAnimation(StageScene.SexPortalProxy, "inside", {onlyRight=true})
		else:
			playAnimation(StageScene.SexPortalProxy, "inside", {onlyRight=(secondPortalCharID=="pc"), npc=secondPortalCharID, npc2=portalCharID})
	
		if(secondPortalCharID == "pc" && portalCharID == "pc"):
			# You fuck yourself
			saynn(RNG.pick([
				"You let out some passionate stifled noises as your {npc.penis} is throbbing inside your {anus}.. before stuffing it to the brim with your seed. You curl your toes and squirm a lot, your hands shaking, making your cock rub against your prostate more..",
			]))
		elif(secondPortalCharID == "pc"):
			# You are being fucked
			saynn(RNG.pick([
				"You let out some passionate stifled noises as someone’s {npc.penis} is throbbing inside your {anus}.. before stuffing it to the brim with its seed. You curl your toes and squirm a lot, your hands shaking, making that cock rub against your inner walls more..",
			]))
		elif(isPCPortal()):
			# You fuck someone else
			saynn(RNG.pick([
				"You grunt softly as your {npc.penis} is throbbing inside that clenching {anus}.. before stuffing it to the brim with your seed. Remote pounding, fuck yeah.",
			]))
		elif(secondPortalCharID == portalCharID):
			# Someone else fucks themselves
			saynn(RNG.pick([
				"You can’t help but to grin while watching that throbbing {npc.penis} cum inside the {anus} that belongs to the same person. Their prostate is probably aching so must right now..",
			]))
		else:
			# 2 different npcs fuck
			saynn(RNG.pick([
				"You can’t help but to smile while watching that throbbing {npc.penis} cum inside the helpless twitching {anus}. You just made two complete strangers fuck. Nice.",
			]))
	
		addButton("Continue", "See what happens next", "choose_penis")





	if(state == "vagina_fuck"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortal, ("sex" if connectedChar.getArousal() <= 0.7 else "fast"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={hard=true, exposedCrotch=true}, npcBodyState={hard=true}})
		
		if(!isRepeat):
			if(isPCPortal()):
				saynn(RNG.pick([
					"You move the fleshlight with your wet {npc.vaginaStretch} {pussy} closer to your {pc.penis}.. and then penetrate yourself, your own member sliding up your pussy slit. Feels nice..",
					"You grab the fleshlight with your wet {npc.vaginaStretch} {pussy} on it and wear it onto your {pc.penis} like it's a sextoy. Feels good..",
				]))
			else:
				saynn(RNG.pick([
					"You move the fleshlight with someone’s {npc.vaginaStretch} {pussy} closer to your {pc.penis}.. and then penetrate it, your member sliding up that pussy slit. They are clenching, probably not expecting this. But that only makes you more eager to fuck them.",
					"You grab the fleshlight with someone’s {npc.vaginaStretch} {pussy} on it and wear it onto your {pc.penis} like it's a sextoy. Their pussy feels nice and warm..",
				]))
		else:	
			if(isPCPortal()):
				saynn(RNG.pick([
					"You moan and shudder as you fuck your own {npc.vaginaStretch} {pussy}!",
					"You shiver.. while fucking yourself, using your own {pussy} for your pleasure.",
					"You fuck your own pussy so eagerly that it starts making wet noises.. Feels so good.",
					"You angle that fleshlight a bit, making it so your {penis} is hammering away at your g-spot as you pound your {pussy}. You know exactly how to make yourself feel good.",
					"You’re pounding your own {pussy} with your {pc.penis} fast and hard! A slight bump appears on your belly as your {penis} is reaching your cervix each time.",
				]))
			else:
				saynn(RNG.pick([
					"You pant softly as you fuck that eager {npc.vaginaStretch} {pussy}! Feels so much better than a sextoy.",
					"You smile while fucking someone, using their {pussy} for your pleasure remotely.",
					"You fuck that {pussy} so eagerly that it starts making wet noises.. The way its inner walls grip your length.. so good.",
					"You shove your {penis} deep, hammering away at that slit’s pleasure spot. Whoever they are, they are dripping like a whore.",
					"You’re pounding someone’s {pussy} with your {pc.penis} fast and hard! So hard that your {penis} is reaching their cervix each time, probably creating a small bump on their belly.",
				]))
		
		if(extraText != ""):
			saynn(extraText)
			extraText = ""
		
		if(GM.pc.getArousal() >= 1.0):
			saynn("You're about to cum!")
			
			addButton("Cum inside", "Cum inside them", "vagina_fuck_inside")
		else:
			addButton("Fuck more", "Really fuck that hole", "vagina_fuck")
		
		isRepeat = true
	
	if(state == "vagina_fuck_inside"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortal, "inside", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={hard=true, exposedCrotch=true}})
		
		if(isPCPortal()):
			saynn(RNG.pick([
				"You let out some passionate stifled noises as your {pc.penis} is throbbing inside your {pussy}.. before stuffing your womb to the brim with your seed. You curl your toes and squirm a lot, your hands shaking, making your cock rub against your pussy walls more..",
			]))
		else:
			saynn(RNG.pick([
				"You grunt softly as your {pc.penis} is throbbing inside that clenching {pussy}.. before stuffing its womb to the brim with your seed. Remote breeding, fuck yeah.",
			]))
		
		addButton("Continue", "See what happens next", "choose_vagina")



	if(state == "anus_fuck"):
		showFightUI = true
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortal, ("sex" if connectedChar.getArousal() <= 0.7 else "fast"), {onlyRight=isPCPortal(), npc=portalCharID, bodyState={hard=true, exposedCrotch=true}, npcBodyState={hard=true}})
		
		if(!isRepeat):
			if(isPCPortal()):
				saynn(RNG.pick([
					"You move the fleshlight with your {npc.anusStretch} {anus} closer to your {pc.penis}.. and then penetrate yourself, your own member sliding up your own butt. Feels nice..",
					"You grab the fleshlight with your {npc.anusStretch} {anus} on it and wear it onto your {pc.penis} like it's a sextoy. Feels good..",
				]))
			else:
				saynn(RNG.pick([
					"You move the fleshlight with someone’s {npc.anusStretch} {anus} closer to your {pc.penis}.. and then penetrate it, your member sliding deep inside. They are clenching, probably not expecting this. But that only makes you more eager to fuck them.",
					"You grab the fleshlight with someone’s {npc.anusStretch} {anus} on it and wear it onto your {pc.penis} like it's a sextoy. Feels nice and warm..",
				]))
		else:	
			if(isPCPortal()):
				saynn(RNG.pick([
					"You moan and shudder as you fuck your own {npc.anusStretch} {ass}!",
					"You shiver.. while fucking yourself, using your own {asshole} for your pleasure.",
					"You fuck your own {asshole} so eagerly that it starts making wet noises.. Feels so good.",
					"You angle that fleshlight a bit, making it so your {penis} is hammering away at your prostate as you pound yourself. You know exactly how to make yourself feel good.",
					"You’re pounding your own {ass} with your {pc.penis} fast and hard! A slight bump appears on your belly as your {penis} is reaching deep and putting pressure on the inner wall.",
				]))
			else:
				saynn(RNG.pick([
					"You pant softly as you fuck that eager {npc.anusStretch} {ass}! Feels so much better than any sextoy.",
					"You smile while fucking someone, using their {ass} for your pleasure remotely.",
					"You fuck that {asshole} so eagerly that it starts making wet noises.. The way its inner walls grip your length.. so good.",
					"You shove your {penis} deep, hammering away at that {asshole}. Whoever they are, they are clenching like a whore.",
					"You’re pounding someone’s {ass} with your {pc.penis} fast and hard! So hard that your {penis} is reaching deep inside and putting pressure on their inner wall, probably creating a small bump on their belly.",
				]))
		
		if(extraText != ""):
			saynn(extraText)
			extraText = ""
		
		if(GM.pc.getArousal() >= 1.0):
			saynn("You're about to cum!")
			
			addButton("Cum inside", "Cum inside them", "anus_fuck_inside")
		else:
			addButton("Fuck more", "Really fuck that hole", "anus_fuck")
		
		isRepeat = true
	
	if(state == "anus_fuck_inside"):
		showFightUI = true
		#var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		
		playAnimation(StageScene.SexPortal, "inside", {onlyRight=isPCPortal(), npc=portalCharID, bodyState={hard=true, exposedCrotch=true}})
		
		if(isPCPortal()):
			saynn(RNG.pick([
				"You let out some passionate stifled noises as your {pc.penis} is throbbing inside your {anus}.. before stuffing it to the brim with your seed. You curl your toes and squirm a lot, your hands shaking, making your cock rub against your prostate more..",
			]))
		else:
			saynn(RNG.pick([
				"You grunt softly as your {pc.penis} is throbbing inside that clenching {anus}.. before stuffing it to the brim with your seed. Remote pounding, fuck yeah.",
			]))
		
		addButton("Continue", "See what happens next", "choose_anus")



func calcArousalBasedOnKink(_char, _theKink):
	return (0.1 + _char.getLustLevel()*0.1)

func _react(_action: String, _args):
	if(_action == "endthescene"):
		GM.pc.setArousal(0.0)
		endScene()
		return
	
	if(_action == "penis_masturbate_anus"):
		processTime(60)
		var sameMult = 1.0
		if(portalCharID == "pc"):
			sameMult = 0.6
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.AnalSexGiving) * sameMult)
		GM.pc.addLust(10)
		GM.pc.addArousal(calcArousalBasedOnKink(GM.pc, Fetish.AnalSexReceiving) * sameMult)
		if(GM.pc.getArousal() >= 1.0 && portalCharID != "pc"):
			extraText = "{pc.You} {pc.youVerb('orgasm')} hard, {pc.yourHis} {asshole} pulsing a lot!"
			GM.pc.orgasmFrom(portalCharID)
			GM.pc.setArousal(0.0)
	
	if(_action == "penis_masturbate_anus_inside"):
		processTime(60*2)
		GM.pc.gotAnusFuckedBy(portalCharID)
		GM.pc.cummedInAnusBy(portalCharID)
		GM.pc.orgasmFrom(portalCharID)
		GM.pc.setArousal(0.0)
		if(portalCharID != "pc"):
			var connectedChar = GlobalRegistry.getCharacter(portalCharID)
			connectedChar.orgasmFrom("pc")
			connectedChar.setArousal(0.0)
	
	if(_action == "penis_masturbate_vagina"):
		processTime(60)
		var sameMult = 1.0
		if(portalCharID == "pc"):
			sameMult = 0.6
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.VaginalSexGiving) * sameMult)
		GM.pc.addLust(10)
		GM.pc.addArousal(calcArousalBasedOnKink(GM.pc, Fetish.VaginalSexReceiving) * sameMult)
		if(GM.pc.getArousal() >= 1.0 && portalCharID != "pc"):
			extraText = "{pc.You} {pc.youVerb('orgasm')} hard, {pc.yourHis} {pussy} pulsing a lot!"
			GM.pc.orgasmFrom(portalCharID)
			GM.pc.setArousal(0.0)
	
	if(_action == "penis_masturbate_vagina_inside"):
		processTime(60*2)
		GM.pc.gotVaginaFuckedBy(portalCharID)
		GM.pc.cummedInVaginaBy(portalCharID)
		GM.pc.orgasmFrom(portalCharID)
		GM.pc.setArousal(0.0)
		if(portalCharID != "pc"):
			var connectedChar = GlobalRegistry.getCharacter(portalCharID)
			connectedChar.orgasmFrom("pc")
			connectedChar.setArousal(0.0)
	
	if(_action == "penis_ride_anus"):
		processTime(60)
		var sameMult = 1.0
		if(portalCharID == "pc"):
			sameMult = 0.6
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.AnalSexGiving) * sameMult)
		GM.pc.addLust(10)
		GM.pc.addArousal(calcArousalBasedOnKink(GM.pc, Fetish.AnalSexReceiving) * sameMult)
		if(GM.pc.getArousal() >= 1.0 && portalCharID != "pc"):
			extraText = "{pc.You} {pc.youVerb('orgasm')} hard, {pc.yourHis} {asshole} pulsing a lot!"
			GM.pc.orgasmFrom(portalCharID)
			GM.pc.setArousal(0.0)
	
	if(_action == "penis_ride_anus_inside"):
		processTime(60*2)
		GM.pc.gotAnusFuckedBy(portalCharID)
		GM.pc.cummedInAnusBy(portalCharID)
		GM.pc.orgasmFrom(portalCharID)
		GM.pc.setArousal(0.0)
		if(portalCharID != "pc"):
			var connectedChar = GlobalRegistry.getCharacter(portalCharID)
			connectedChar.orgasmFrom("pc")
			connectedChar.setArousal(0.0)
	
	if(_action == "penis_ride_vagina"):
		processTime(60)
		var sameMult = 1.0
		if(portalCharID == "pc"):
			sameMult = 0.6
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.VaginalSexGiving) * sameMult)
		GM.pc.addLust(10)
		GM.pc.addArousal(calcArousalBasedOnKink(GM.pc, Fetish.VaginalSexReceiving) * sameMult)
		if(GM.pc.getArousal() >= 1.0 && portalCharID != "pc"):
			extraText = "{pc.You} {pc.youVerb('orgasm')} hard, {pc.yourHis} {pussy} pulsing a lot!"
			GM.pc.orgasmFrom(portalCharID)
			GM.pc.setArousal(0.0)
	
	if(_action == "penis_ride_vagina_inside"):
		processTime(60*2)
		GM.pc.gotVaginaFuckedBy(portalCharID)
		GM.pc.cummedInVaginaBy(portalCharID)
		GM.pc.orgasmFrom(portalCharID)
		GM.pc.setArousal(0.0)
		if(portalCharID != "pc"):
			var connectedChar = GlobalRegistry.getCharacter(portalCharID)
			connectedChar.orgasmFrom("pc")
			connectedChar.setArousal(0.0)
	
	
	if(_action == "anus_fuck"):
		processTime(60)
		var sameMult = 1.0
		if(portalCharID == "pc"):
			sameMult = 0.6
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.AnalSexReceiving) * sameMult)
		GM.pc.addLust(10)
		GM.pc.addArousal(calcArousalBasedOnKink(GM.pc, Fetish.AnalSexGiving) * sameMult)
		if(connectedChar.getArousal() >= 1.0 && portalCharID != "pc"):
			extraText = "{npc.You} {npc.youVerb('orgasm')} hard, {npc.yourHis} {anus} pulsing a lot!"
			connectedChar.orgasmFrom("pc")
			connectedChar.setArousal(0.0)
	
	if(_action == "anus_fuck_inside"):
		processTime(60*2)
		getCharacter(portalCharID).gotAnusFuckedBy("pc")
		getCharacter(portalCharID).cummedInAnusBy("pc")
		GM.pc.orgasmFrom(portalCharID)
		GM.pc.setArousal(0.0)
		if(portalCharID != "pc"):
			var connectedChar = GlobalRegistry.getCharacter(portalCharID)
			connectedChar.orgasmFrom("pc")
			connectedChar.setArousal(0.0)
	
	
	if(_action == "vagina_fuck"):
		processTime(60)
		var sameMult = 1.0
		if(portalCharID == "pc"):
			sameMult = 0.6
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.VaginalSexReceiving) * sameMult)
		GM.pc.addLust(10)
		GM.pc.addArousal(calcArousalBasedOnKink(GM.pc, Fetish.VaginalSexGiving) * sameMult)
		if(connectedChar.getArousal() >= 1.0 && portalCharID != "pc"):
			extraText = "{npc.You} {npc.youVerb('orgasm')} hard, {npc.yourHis} {pussy} pulsing a lot!"
			connectedChar.orgasmFrom("pc")
			connectedChar.setArousal(0.0)
	
	if(_action == "vagina_fuck_inside"):
		processTime(60*2)
		getCharacter(portalCharID).gotVaginaFuckedBy("pc")
		getCharacter(portalCharID).cummedInVaginaBy("pc")
		GM.pc.orgasmFrom(portalCharID)
		GM.pc.setArousal(0.0)
		if(portalCharID != "pc"):
			var connectedChar = GlobalRegistry.getCharacter(portalCharID)
			connectedChar.orgasmFrom("pc")
			connectedChar.setArousal(0.0)
	
	
	
	if(_action == "penis_proxyfuck_anus"):
		processTime(60)
		var sameMult = 1.0
		if(portalCharID == secondPortalCharID):
			sameMult = 0.6
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.AnalSexGiving) * sameMult)
		var connectedChar2 = GlobalRegistry.getCharacter(secondPortalCharID)
		connectedChar2.addLust(10)
		connectedChar2.addArousal(calcArousalBasedOnKink(connectedChar2, Fetish.AnalSexReceiving) * sameMult)
		if(connectedChar2.getArousal() >= 1.0 && portalCharID != secondPortalCharID):
			extraText = "{npc2.You} {npc2.youVerb('orgasm')} hard, {npc2.yourHis} {anus} pulsing a lot!"
			connectedChar2.orgasmFrom(portalCharID)
			connectedChar2.setArousal(0.0)
	
	if(_action == "penis_proxyfuck_anus_orgasm"):
		processTime(60*2)
		getCharacter(secondPortalCharID).gotAnusFuckedBy(portalCharID)
		getCharacter(secondPortalCharID).cummedInAnusBy(portalCharID)
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.orgasmFrom(secondPortalCharID)
		connectedChar.setArousal(0.0)
		if(portalCharID != secondPortalCharID):
			var connectedChar2 = GlobalRegistry.getCharacter(secondPortalCharID)
			connectedChar2.orgasmFrom(portalCharID)
			connectedChar2.setArousal(0.0)
	
	if(_action == "penis_proxyfuck_vagina"):
		processTime(60)
		var sameMult = 1.0
		if(portalCharID == secondPortalCharID):
			sameMult = 0.6
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.VaginalSexGiving) * sameMult)
		var connectedChar2 = GlobalRegistry.getCharacter(secondPortalCharID)
		connectedChar2.addLust(10)
		connectedChar2.addArousal(calcArousalBasedOnKink(connectedChar2, Fetish.VaginalSexReceiving) * sameMult)
		if(connectedChar2.getArousal() >= 1.0 && portalCharID != secondPortalCharID):
			extraText = "{npc2.You} {npc2.youVerb('orgasm')} hard, {npc2.yourHis} {pussy} pulsing a lot!"
			connectedChar2.orgasmFrom(portalCharID)
			connectedChar2.setArousal(0.0)
	
	if(_action == "penis_proxyfuck_vagina_orgasm"):
		processTime(60*2)
		getCharacter(secondPortalCharID).gotVaginaFuckedBy(portalCharID)
		getCharacter(secondPortalCharID).cummedInVaginaBy(portalCharID)
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.orgasmFrom(secondPortalCharID)
		connectedChar.setArousal(0.0)
		if(portalCharID != secondPortalCharID):
			var connectedChar2 = GlobalRegistry.getCharacter(secondPortalCharID)
			connectedChar2.orgasmFrom(portalCharID)
			connectedChar2.setArousal(0.0)
	
	if(_action == "choose_penis"):
		if(secondPortalCharID != ""):
			if(secondPortalCharID != "pc" && secondPortalCharID!=portalCharID):
				removeCharacter(secondPortalCharID)
			secondPortalCharID = ""
	
	if(_action == "penis_proxyfuck_secondchoose"):
		var character = _args[0]
		secondPortalCharID = character.getID()
		if(!character.isPlayer()):
			addCharacter(secondPortalCharID)
		setState("penis_proxyfuck_choose_hole")
		return
	
	if(_action == "anus_lick_swallow"):
		processTime(60*2)
		#GM.pc.cummedInMouthBy(portalCharID, FluidSource.Vagina, RNG.randf_range(0.3,0.5))
		#GM.pc.cummedOnBy(portalCharID, FluidSource.Vagina, RNG.randf_range(0.1,0.4))
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.orgasmFrom(portalCharID)
		connectedChar.setArousal(0.0)
	
	if(_action == "anus_lick_spit"):
		processTime(60)
		extraText = GM.pc.getBodypartContentsStringList(BodypartSlot.Head)
		var howMuch = GM.pc.bodypartTransferFluidsToAmount(BodypartSlot.Head, portalCharID, BodypartSlot.Anus, 0.2, 20.0)
		var newSexEvent:SexEvent = SexEvent.new()
		newSexEvent.type = SexEvent.HoleSpitted
		newSexEvent.sourceCharID = "pc"
		newSexEvent.targetCharID = portalCharID
		newSexEvent.data = {hole=BodypartSlot.Anus, loadSize = howMuch}
		#newSexEvent.isSexEngine = true
		#newSexEvent.sexEngine = getSexEngine()
		
		GM.pc.sendSexEvent(newSexEvent)
		if(portalCharID != "pc"):
			getCharacter(portalCharID).sendSexEvent(newSexEvent)
	
	if(_action == "anus_lick"):
		processTime(60)
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.RimmingReceiving))
		
		if(connectedChar.hasEffect(StatusEffect.HasCumInsideAnus) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(20)):
				if(connectedChar.bodypartTransferFluidsTo(BodypartSlot.Anus, "pc", BodypartSlot.Head, 0.1, 20.0)):
					extraText = RNG.pick([ 
						Util.capitalizeFirstLetter(connectedChar.getBodypartContentsStringList(BodypartSlot.Vagina))+" lands on your tongue, leaking out of {npc.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["asshole", "tailhole"])+".",
					])
	
	if(_action == "vagina_lick_swallow"):
		processTime(60*2)
		GM.pc.cummedInMouthBy(portalCharID, FluidSource.Vagina, RNG.randf_range(0.3,0.5))
		GM.pc.cummedOnBy(portalCharID, FluidSource.Vagina, RNG.randf_range(0.1,0.4))
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.orgasmFrom(portalCharID)
		connectedChar.setArousal(0.0)
	
	if(_action == "vagina_lick_spit"):
		processTime(60)
		extraText = GM.pc.getBodypartContentsStringList(BodypartSlot.Head)
		var howMuch = GM.pc.bodypartTransferFluidsToAmount(BodypartSlot.Head, portalCharID, BodypartSlot.Vagina, 0.2, 20.0)
		var newSexEvent:SexEvent = SexEvent.new()
		newSexEvent.type = SexEvent.HoleSpitted
		newSexEvent.sourceCharID = "pc"
		newSexEvent.targetCharID = portalCharID
		newSexEvent.data = {hole=BodypartSlot.Vagina, loadSize = howMuch}
		#newSexEvent.isSexEngine = true
		#newSexEvent.sexEngine = getSexEngine()
		
		GM.pc.sendSexEvent(newSexEvent)
		if(portalCharID != "pc"):
			getCharacter(portalCharID).sendSexEvent(newSexEvent)
	
	if(_action == "vagina_lick"):
		processTime(60)
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.OralSexReceiving))
		
		if(connectedChar.hasEffect(StatusEffect.HasCumInsideVagina) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
			if(RNG.chance(20)):
				if(connectedChar.bodypartTransferFluidsTo(BodypartSlot.Vagina, "pc", BodypartSlot.Head, 0.1, 20.0)):
					extraText = RNG.pick([ 
						Util.capitalizeFirstLetter(connectedChar.getBodypartContentsStringList(BodypartSlot.Vagina))+" lands on your tongue, leaking out of {npc.yourHis} "+RNG.pick(["", "used ", "stuffed "])+RNG.pick(["pussy", "slit", "kitty"])+".",
					])
	
	if(_action == "penis_suck_swallow"):
		processTime(60*2)
		GM.pc.gotThroatFuckedBy(portalCharID)
		GM.pc.cummedInMouthBy(portalCharID)
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.orgasmFrom(portalCharID)
		connectedChar.setArousal(0.0)
	
	if(_action == "penis_suck"):
		processTime(60)
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		connectedChar.addLust(10)
		connectedChar.addArousal(calcArousalBasedOnKink(connectedChar, Fetish.OralSexReceiving))

	if(_action == "penis_make_hard"):
		processTime(60*3)
		var connectedChar = GlobalRegistry.getCharacter(portalCharID)
		while(!connectedChar.isReadyToPenetrate()):
			connectedChar.addLust(5)
			if(connectedChar.getLustLevel() >= 1.0):
				break

	if(_action == "disconnectPortal"):
		processTime(30)
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
		if(character.isWearingPortalPanties() || character.isWearingInvisiblePortalPanties()):
			character.updateNonBattleEffects()
			result.append(character)
	
	var dynamicChars = GM.main.getDynamicCharacters()
	for charID in dynamicChars:
		var character:Character = dynamicChars[charID]
		if(character.isWearingPortalPanties() || character.isWearingInvisiblePortalPanties()):
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
	
