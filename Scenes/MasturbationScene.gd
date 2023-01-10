extends "res://Scenes/SceneBase.gd"

var savedActionText = ""
var spottedText = ""
var isInPublic = false

func _reactInit():
	var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	if(lustCombatState.isInPublic()):
		isInPublic = true

func _init():
	sceneID = "MasturbationScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		if(GM.pc.getLocation() == GM.pc.getCellLocation()):
			#(if in cell)
			if(RNG.chance(50)):
				saynn("You look around, the cell seems to be mostly secluded, you should be safe as long as nobody peeks through the reinforced window. But that thought only sparks up more desire in you. You feel kinda horny, maybe it’s a good time to blow some steam off..")
			else:
				saynn("You’re standing in your cell, alone. There are lots of inmates outside but nobody seems to be paying attention to the cell’s window so you should be safe as long as you’re careful. Maybe you can expose yourself a bit without anyone noticing here..")
		elif(!lustCombatState.isInPublic()):
			#(if in private place)
			if(RNG.chance(50)):
				saynn("You take a look around. It’s mostly quiet. The idea of doing some naughty things suddenly crosses your lusty mind. This isn’t your cell but this spot is mostly out of the way so you should be safe as long as you’re fast and nobody notices you. You walk around a bit to make sure there is no one around, your face already starts to glow slightly red, you are so excited.")
			
				saynn("[say=pc]Anyone here?[/say]")
			else:
				saynn("Horny thoughts invade your mind as you stand in this room. It’s a public place but right now there is no one around so it’s your chance. And even if somebody walks in on you, maybe it’s not such a bad thing..")
				
				saynn("[say=pc]Some privacy. good..[/say]")
		else:
			#(if in public place)
			if(GM.pc.getSkillLevel(Skill.Exhibitionism) < 1):
				saynn("You look around, there are people around, lots of them in fact. Doing something lewd would surely get somebody’s attention.. But you are feeling kinda horny, the idea of teasing yourself in public sounds so hot right now.. Just gotta make sure to not get noticed.. You walk around a bit, trying to find a better spot, making sure not to catch too many eyes. Hands travel along your curves, your face is blushing red already..")
				
				if(GM.pc.getExposedPrivates().size() > 0):
					saynn("Your face only gets more flustered as you try to cover your exposed privates as best you can. [b]You're not brave enough to do anything sexual.[/b]")
				
				saynn(RNG.pick([
					"[say=pc]What am I doing..[/say]",
					"[say=pc]Should I stop.. But..[/say]",
					"[say=pc]I’m gonna get caught.. I can’t..[/say]",
				]))
			elif(GM.pc.getSkillLevel(Skill.Exhibitionism) < 2):
				saynn("It’s a public place, you see people around, doing their things. You wonder how much you can get away with, the idea of exposing yourself crosses your mind and you can’t resist it, you feel aroused already. If you’re careful, people shouldn’t even notice you.. Maybe you do want them to notice.. You don’t really wanna hide and decide to stay mostly in the open, so risky..")
				
				saynn(RNG.pick([
					"[say=pc]I can’t believe myself..[/say]",
					"[say=pc]Why do I want this so much..[/say]",
					"[say=pc]Why does it feel so nice..[/say]",
				]))
			else:
				saynn("The thought of doing something lewd in public excites you immensely. There are people around but you don’t even mind them, you’re so horny!")
				
				saynn("You’re so tempted to start exposing yourself, maybe more than that. After all the practice you feel very confident in showing off your body. Your cheeks blush red, you can’t wait to get started.")
				
				saynn(RNG.pick([
					"[say=pc]I so wanna touch myself..[/say]",
					"[say=pc]Everyone’s watching.. Good.[/say]",
					"[say=pc]Wonder how long will it take before I get noticed~[/say]",
				]))
			
	if(state == "doLustAction"):
		saynn(savedActionText.trim_suffix("\n\n"))
		
		if(spottedText != ""):
			saynn(spottedText)
				
	if(state == "" || state == "doLustAction"):
		addButtonAt(13, "Do nothing", "Try not to attract any attention", "doidle")
		addButtonAt(14, "Stop", "Enough horny", "endthescene")
		
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	
		addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted())

		for activity in lustCombatState.getAllText():
			sayn(activity)
		
		if(lustCombatState.isInPublic()):
			var visibility = lustCombatState.getVisibility()
			if(visibility >= 1.0):
				sayn("\nVisibility: You are visible to everyone!")
			elif(visibility >= 0.9):
				sayn("\nVisibility: You're pretty sure people are watching you..")
			elif(visibility >= 0.6):
				sayn("\nVisibility: You have a feeling that you are being watched..")
			elif(visibility >= 0.3):
				sayn("\nVisibility: You think no one watches you")
			else:
				sayn("\nVisibility: You're pretty sure no one sees you")
			
			var danger = lustCombatState.getDanger()
			if(danger > 0.0):
				if(danger >= 0.8):
					sayn("Danger: People are literally reaching out to grope you")
				elif(danger >= 0.5):
					sayn("Danger: People are crowding around you, careful!")
				elif(danger >= 0.2):
					sayn("Danger: There are a few randoms around, watching you")
				else:
					sayn("Danger: No danger")
		
	if(state == "lustCombatAboutToCum"):
		saynn(savedActionText)
		
		saynn("You're about to cum..")
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		addLustActionsButtons(lustCombatState, lustCombatState.getOrgasmActionsSorted())
		
	if(state == "lustCombatAfterCame"):
		saynn(savedActionText)
		
		addButton("Continue", "You're not done yet", "")
		addButton("Stop", "That's enough for now..", "endthescene")

func addLustActionsButtons(lustCombatState:LustCombatState, theActions):
	for actionData in theActions:
		var lustAction:LustAction = GlobalRegistry.getLustAction(actionData["id"])
		
		if(!lustAction.shouldShow(lustCombatState, actionData)):
			continue
		var canDo = lustAction.canDo(lustCombatState, actionData)
		var reasonWhyCant = "You can't do this right now"
		if(canDo is Array):
			if(canDo.size() > 1):
				reasonWhyCant = canDo[1]
			canDo = canDo[0]
		
		if(canDo):
			addButton(lustAction.getVisibleName(lustCombatState, actionData), lustAction.getVisibleDescription(lustCombatState, actionData), "doLustAction", [actionData])
		else:
			addDisabledButton(lustAction.getVisibleName(lustCombatState, actionData), reasonWhyCant)
	

func _react(_action: String, _args):
	if(_action == "endthescene"):
		GM.pc.getLustCombatState().resetState()
		endScene()
		return
	
	if(_action == "doidle"):
		processTime(30)
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		
		lustCombatState.processLewdTurn()
		
		savedActionText = "You decide to idle for a bit"
		#GM.pc.addLust(-1)
		
		checkDanger()
		spottedMessages()
		
		setState("doLustAction")
		return
	
	if(_action == "doLustAction"):
		processTime(30)
		
		var actionData = _args[0]
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		
		var result = lustCombatState.doAction(actionData)
		savedActionText = result["text"]
		if("lust" in result):
			GM.pc.addLust(result["lust"] * 4)
			if(GM.pc.getLustLevel() >= 1.0 && ("cantCum" in result) && result["cantCum"]):
				GM.pc.addLust(-1)
		if("pain" in result):
			GM.pc.addPain(result["pain"])
		
		if("came" in result):
			lustCombatState.stopActivities()
			setState("lustCombatAfterCame")
			return
		
		if(GM.pc.getLustLevel() >= 1.0):
			setState("lustCombatAboutToCum")
			return
			
		checkDanger()
		spottedMessages()
		
	setState(_action)

func spottedMessages():
	spottedText = ""
	
	var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	if(lustCombatState.isInPublic()):
		if(lustCombatState.getVisibility() < 1.0):
			
			if(RNG.chance(50)):
				return
			
			var barks = [
				"Your heart races, you swear you saw someone’s eyes watching you.",
				"You look around frantically, constantly checking if someone sees you.",
				"You can’t believe that you are doing this, you feel like you could be spotted at any second.",
				"What if someone is watching?.. Just thinking about it makes you more aroused.",
				"You wonder how far you can push this before being spotted..",
			]
			
			spottedText = RNG.pick(barks)
			return
		
		if(lustCombatState.getDanger() > 0):
			var population = GM.pc.getLocationPopulation()
			if(population.size() <= 0 || RNG.chance(50)):
				return
			
			var randomPop = RNG.pick(population)
			if(randomPop == WorldPopulation.Inmates):
				var randI = RNG.randi_range(0, 5)
				match(randI):
					0:
						spottedText = "You catch a lewd gaze of one of the inmates that stares at you and your {pc.masc} body."
					1:
						spottedText = "One of the inmates exposes his canine cock and starts stroking himself while watching the show that you’re offering."
						spottedText += "\n\n"
						spottedText += RNG.pick([
							"[sayMale]Yeah, wiggle that ass![/sayMale]",
							"[sayMale]What a slut![/sayMale]",
							"[sayMale]Don’t stop, whore. Give us a good show.[/sayMale]",
						])
					2:
						spottedText = "A group of inmates turn around and catch the glimpses of your hands doing lewd things."
						spottedText += "\n\n"
						spottedText += RNG.pick([
							"[sayMale]Look at {pc.him}, should we go help?[/sayMale]",
							"[sayMale]Wow, {pc.he} is making me want to fuck {pc.him}.[/sayMale]",
							"[sayFemale]The boys can do whatever they want with that ass, {pc.his} face is mine~.[/sayFemale]",
						])
					3:
						spottedText = "One of the inmate girls walks past and then spots what you are doing before taking a step back, blushing."
						spottedText += "\n\n"
						spottedText += RNG.pick([
							"[sayFemale]H-hey, you can’t do that![/sayFemale]",
							"[sayFemale]Um-m.. my bad.[/sayFemale]",
						])
					4:
						spottedText = "An inmate creeps closer to you and watches you play with yourself, smiling."
					5:
						spottedText = "You notice the eyes of many inmates attached to you, it seems you are attracting quite an audience."
						spottedText += "\n\n"
						spottedText += RNG.pick([
							"[sayMale]I wanna fuck {pc.him} first![/sayMale]",
							"[sayMale]That ass is so {pc.thick}, makes me wanna stretch it.[/sayMale]",
							"[sayMale]Hey, look at that slut whoring herself out![/sayMale]",
							"[sayFemale]Sweetie, why don’t you lick me out.[/sayFemale]",
							"[sayFemale]What a slut![/sayFemale]",
						])
			if(randomPop == WorldPopulation.Guards):
				var randI = RNG.randi_range(0, 7)
				match(randI):
					0:
						spottedText = "One of the staff members glances at you. You quickly turn away but you’re almost certain he saw you doing something lewd."
					1:
						spottedText = "A staff member walks past and sees you. She rolls her eyes and leaves you to your things."
					2:
						spottedText = "A few staff members walk past but one of them stops and stares at you."
						spottedText += "\n\n"
						spottedText += RNG.pick([
							"[sayMale]Hey, should we go punish {pc.him}?[/sayMale]",
							"[sayMale]Look at that slut.[/sayMale]",
							"[sayFemale]Hey, stop that or we will have to use force.[/sayFemale]",
						])
					3:
						spottedText = "One of the guards sees your actions and starts walking towards you with a stun baton in his hand. Luckily, he stops to watch you some more."
					4:
						spottedText = "One of the female staff members raises her brow at you."
						spottedText += "\n\n"
						spottedText += RNG.pick([
							"[sayFemale]Are you a lilac? That would explain it.[/sayFemale]",
							"[sayFemale]Someone begs to be punished.[/sayFemale]",
							"[sayFemale]Hey, don’t complain later when people will start passing you around.[/sayFemale]",
							"[sayFemale]Someone’s horny, huh~?[/sayFemale]",
						])
					5:
						spottedText = "Staff starts crowding around you but that only makes you more eager, you’ve been spotted."
					6:
						spottedText = "A guard sneaks a hand under his crotch armor piece and clearly strokes himself while watching you."
					7:
						spottedText = "One of the staff members walks past and pretends to not see what you are doing."
						
	

func checkDanger():
	var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	var newDanger = lustCombatState.getDanger()
	if(lustCombatState.isInPublic() && newDanger >= 1.0):
		print("SPOTTED")
		lustCombatState.resetDanger()
		var population = GM.pc.getLocationPopulation()
		if(population.size() > 0):
			var randomPop = RNG.pick(population)
			var triggerID
			if(randomPop == WorldPopulation.Inmates):
				triggerID = Trigger.MasturbationSpottedInmate
			if(randomPop == WorldPopulation.Guards):
				triggerID = Trigger.MasturbationSpottedGuard
			
			if(triggerID != null && GM.ES.triggerReact(triggerID)):
				GM.pc.getLustCombatState().resetState()
				endScene()

func resolveCustomCharacterName(_charID):
	if(_charID == "attacker"):
		return "pc"
	
	return null

func saveData():
	var data = .saveData()
	
	data["savedActionText"] = savedActionText
	data["isInPublic"] = isInPublic
	data["spottedText"] = spottedText
	
	return data
	
func loadData(data):
	.loadData(data)
	
	savedActionText = SAVE.loadVar(data, "savedActionText", "")
	isInPublic = SAVE.loadVar(data, "isInPublic", false)
	spottedText = SAVE.loadVar(data, "spottedText", "")
