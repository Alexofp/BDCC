extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var resultText = ""

var savedWantedToDo = ""
var savedWantedToDoName = ""
var savedWantedToDoArgs = []
var savedButtonChecks = []
var slaveResistedSuc = false
var activeResistType = ""

var lastActionID = ""

func _init():
	sceneID = "SlaveTalkScene"

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)
	
	
func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		aimCameraAndSetLocName(GM.pc.getLocation())
		addCharacter(npcID)
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery == null):
			saynn("Something went wrong")
			addButton("Back", "Enough interactions", "endthescene")
			return
		npcSlavery.checklevelUp()
		
		if(npcSlavery.isDoingActivity()):
			var activity:SlaveActivityBase = npcSlavery.getActivity()
			
			var animInfo = activity.getCustomInteractAnimInfo()
			if(animInfo != null):
				playAnimation(animInfo[0], animInfo[1], animInfo[2])
			else:
				playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
			
			if(activity.preventsNormalInteractions()):
				addButtonAt(14, "Back", "Enough interactions", "endthescene")

				saynn(activity.getActivityText())
				
				addActivityButtons()
				return
		elif(GM.main.IS.hasPawn(npc.getID())):
			playAnimation(StageScene.Solo, "stand")
			
			saynn("{npc.name} is wandering around the prison somewhere.. Wait until {npc.he} {npc.verb('return')}.")
			addButtonAt(14, "Back", "Enough interactions", "endthescene")
			return
		else:
			playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		
		saynn(npc.getName()+" is a level "+str(npcSlavery.slaveLevel)+" {npc.slave} ("+npcSlavery.getExperienceStr()+" exp)")
		#saynn("{npc.He} {npc.isAre} standing still, {npc.his} collar leashed to the floor.")
		saynn(npcSlavery.getPerfectIdleMessage())
		
		if(!npcSlavery.isMindBroken()):
			if(npcSlavery.getDespair() > 0.5):
				saynn("{npc.name} is feeling depressed. Perfect for breaking {npc.his} spirit but it might lead to {npc.him} snapping if you keep it up.")
			elif(npcSlavery.getDespair() > 0.8):
				saynn("[b]{npc.name} looks extremely depressed.[/b] {npc.He} {npc.isAre} close to snapping.")
			
			if(npcSlavery.getWorkEfficiency() < 0.2):
				saynn("{npc.name} looks very tired.")
			
			if(npcSlavery.getObedience() < 0.9 && npc.getInventory().hasRemovableRestraints()):
				var restraintAmount = npc.getInventory().getEquppedRemovableRestraints().size()
				if(restraintAmount > 0):
					if(npcSlavery.getAwareness() < 0.8):
						saynn("{npc.He} {npc.isAre} wearing "+str(restraintAmount)+" restraint"+("s" if restraintAmount != 1 else "")+" which will help {npc.him} understand {npc.his} place.")
					else:
						saynn("{npc.He} {npc.isAre} wearing "+str(restraintAmount)+" restraint"+("s" if restraintAmount != 1 else "")+" which helps remind {npc.him} of {npc.his} place.")
			
			saynn("{npc.name} "+npcSlavery.getRewardBalanceString())
		
		if(getFlag("NpcSlaveryModule.debugSlaveInfo", false)):
			sayn("[b]DEBUG INFO:[/b]")
			saynn(npcSlavery.getDebugInfo())
		elif(npc.getInventory().hasEquippedItemWithTag(ItemTag.Hypnovisor)):
			sayn("The hypnovisor allows you to read {npc.name}'s mind!")
			sayn("[b]Hypnovisor info:[/b]")
			saynn(npcSlavery.getMindreaderInfo())
			
#		if(false):
#			sayn("[b]Personality:[/b]")
#			var personality: Personality = npc.getPersonality()
#			if(personality != null):
#				var texts = []
#				for statID in PersonalityStat.getAll():
#					var value = personality.getStat(statID)
#					var statName = PersonalityStat.getVisibleName(statID)
#					var statValue = PersonalityStat.getVisibleDesc(statID, value)
#
#					texts.append(statName+": "+statValue)
#				saynn(Util.join(texts, "\n"))
		
		sayn("[b]Skills:[/b]")
		for skillID in npcSlavery.slaveSpecializations:
			var slaveType:SlaveTypeBase = GlobalRegistry.getSlaveType(skillID)
			if(slaveType == null):
				continue
			var gradeLetter = npcSlavery.rankToLetter(npcSlavery.slaveSpecializations[skillID])
			
			sayn(""+slaveType.getVisibleName()+": "+gradeLetter)
		sayn("")
		
		if(npcSlavery.isReadyToBeLeveledUp()):
			sayn("In order to level {npc.name} up to slave level "+str(npcSlavery.getLevel()+1)+", make these things happen to {npc.him}:")
			sayn(npcSlavery.getLevelUpHintText())
			saynn("Leveling your slave up makes training {npc.him} easier and also unlocks new actions.")
		
		addButtonAt(12, "Leash", "Leash your slave and see what you can with them around the station", "start_walkies")
		addButtonWithChecksAt(13, "Forced sex" if npcSlavery.isActivelyResisting() else "Sex", "Start sex with your slave", "do_forced_sex", [], [ButtonChecks.CanStartSex])
		addButtonAt(14, "Back", "Enough interactions", "endthescene")
		
		addButton("Talk", "Tell something to your slave", "talk_menu")
		addButtonWithChecks("Train", "Train your slave", "do_train", [], [[ButtonChecks.NotLate], [ButtonChecks.NotGagged], [ButtonChecks.NotBlindfolded]])
		addButton("Reward", "Show a list of rewards", "rewards_menu")
		addButton("Punish", "Show a list of punishments", "punishments_menu")
		addButton("Activities", "See what else you can do with this slave", "actions_menu")
		
		if(npcSlavery.isDoingActivity()):
			var activity:SlaveActivityBase = npcSlavery.getActivity()
			
			if(!activity.preventsNormalInteractions()):
				var theText = activity.getActivityText()
				if(theText != ""):
					saynn(theText)
				addActivityButtons()
		
	if(state == "actions_menu"):
		saynn("What do you want to do with your slave?")
		
		addButtonsForActionsOfType(SlaveActionBase.Action)
		addButton("Back", "You changed your mind!", "")

	if(state == "talk_menu"):
		saynn("What do you want to tell your slave?")
		
		addButtonsForActionsOfType(SlaveActionBase.Talk)
		addButton("Back", "You changed your mind!", "")

	if(state == "rewards_menu"):
		saynn("How do you want to reward your slave?")
		
		addButtonsForActionsOfType(SlaveActionBase.Reward)
		addButton("Back", "You changed your mind!", "")

	if(state == "punishments_menu"):
		saynn("How do you want to punish your slave?")
		
		addButtonsForActionsOfType(SlaveActionBase.Punishment)
		addButton("Back", "You changed your mind!", "")

	if(state == "do_action"):
		saynn(resultText)
		
		addButton("Continue", "See what happens next", "")

		var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(lastActionID)
		if(theAction != null):
			var extraActions = theAction.getExtraActions(npcID, {})
			for actionInfo in extraActions:
				var args = []
				if(actionInfo.has("args")):
					args = actionInfo["args"]
				var buttonChecks = []
				if(actionInfo.has("buttonChecks")):
					buttonChecks = actionInfo["buttonChecks"]
				addButtonWithChecks(actionInfo["name"], actionInfo["desc"], "do_extra_action", [theAction, actionInfo, args], buttonChecks)

	if(state == "do_train"):
		saynn(resultText)
		
		addButton("Continue", "See what happens next", "")
	
	if(state == "resisting_action"):
		saynn("Your slave refuses to obey your orders!")
		
		saynn("You can still force {npc.him} but {npc.he} obviously won't like it.")
		
		saynn("You can also try to beat {npc.him} into submission if you want. Pain brings fear. And fear is a good motivator.")
		
		saynn("Alternatively, you can just cancel what you wanted to do and get a reason to punish {npc.him} instead!")
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		var cowardness = npcSlavery.personalityScore({PersonalityStat.Coward:1.0}) - 0.25
		var fightChance = 0.0
		if(cowardness >= 0.5):
			fightChance = 0.0
		elif(cowardness <= -0.5):
			fightChance = 15.0
		else:
			fightChance = Util.remapValue(cowardness, -0.5, 0.5, 15.0, 0.0)
		if(npc.hasBoundArms() || npc.hasBlockedHands() || npc.isBitingBlocked()):
			fightChance *= 0.3
		if(RNG.chance(fightChance)):
			addButtonWithChecks("Force", "Force them to do what you want them to do without violence", "resist_hastofight", [], savedButtonChecks)
		else:
			addButtonWithChecks("Force", "Force them to do what you want them to do without violence", "do_force_action", [savedWantedToDo, savedWantedToDoArgs], savedButtonChecks)
		addButton("Beat up", "Force them through fighting", "resisting_start_fight")
		addButton("Cancel", "Your slave just earned a punishment!", "forced_sex_let_resist", [false])
	
	if(state == "resisting_actively"):
		if(activeResistType == "resist_kick"):
			if(slaveResistedSuc):
				playAnimation(StageScene.Duo, "hurt", {npc=npcID, npcAction="kick", npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
				saynn("Your slave kicks back when you're trying to do anything with {npc.him}!"+(" Might be worth it to cuff {npc.his} ankles to prevent that from happening." if RNG.chance(30) else ""))
			else:
				playAnimation(StageScene.Duo, "dodge", {npc=npcID, npcAction="kick", npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
				saynn("Your slave tried to kick you but {npc.his} restraints helped you avoid it. Still, your slave actively resists anything that you're trying to do with {npc.him}!")
		elif(activeResistType == "resist_shove"):
			if(slaveResistedSuc):
				playAnimation(StageScene.Duo, "hurt", {npc=npcID, npcAction="shove", npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
				saynn("Your slave shoves you back when you're trying to do anything with {npc.him}!"+(" Might be worth it to cuff {npc.his} wrists to prevent that from happening." if RNG.chance(30) else ""))
			else:
				playAnimation(StageScene.Duo, "dodge", {npc=npcID, npcAction="shove", npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
				saynn("Your slave tried to shove you back but {npc.his} restraints helped you avoid it. Still, your slave actively resists anything that you're trying to do with {npc.him}!")
		elif(activeResistType == "resist_scratch"):
			if(slaveResistedSuc):
				playAnimation(StageScene.Duo, "hurt", {npc=npcID, npcAction="punch", npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
				saynn("Your slave scratches you when you're trying to do anything with {npc.him}!"+(" Might be worth it to block {npc.his} hands to prevent that from happening." if RNG.chance(30) else ""))
			else:
				playAnimation(StageScene.Duo, "dodge", {npc=npcID, npcAction="punch", npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
				saynn("Your slave tried to scratch you but {npc.his} restraints helped you avoid it. Still, your slave actively resists anything that you're trying to do with {npc.him}!")
		elif(activeResistType == "resist_bite"):
			if(slaveResistedSuc):
				playAnimation(StageScene.Duo, "hurt", {npc=npcID, npcAction="bite", npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
				saynn("Your slave bites your hand when you're trying to do anything with {npc.him}!"+(" Might be worth it to gag or muzzle {npc.him} to prevent that from happening." if RNG.chance(30) else ""))
			else:
				playAnimation(StageScene.Duo, "dodge", {npc=npcID, npcAction="bite", npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
				saynn("Your slave tried to bite you but {npc.his} leash was too short for {npc.him} to reach you. Still, your slave actively resists anything that you're trying to do with {npc.him}!")
		else:
			saynn("Your slave actively resists anything that you're trying to do with {npc.him}!")
		
		saynn("You can try to beat {npc.him} into submission if you want. Pain brings fear. And fear is a good motivator. But {npc.he} will obviously fight back..")
		
		saynn("Alternatively, you can just cancel what you wanted to do and get a good reason to punish {npc.him} instead!")
		
		addDisabledButton("Force", "Can't force your slave if they actively fight back")
		addButton("Beat up", "Force them through fighting", "resisting_start_fight")
		addButton("Cancel", "Your slave just earned a punishment!", "forced_sex_let_resist", [true])
	
	if(state == "resist_hastofight"):
		saynn("As soon as you put your hand on your slave, {npc.he} pushes you back!")
		
		saynn("Looks like you will have to fight your slave.")
		
		addButton("Fight", "Start the fight", "start_fight_with_slave")
	
	if(state == "resist_autobeatup"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc=npcID, npcBodyState={leashedBy = "pc"}})
		
		saynn("Furious by {npc.his} disobedience, you unleash a torrent of relentless, raw blows upon your slave. After the first impact, {npc.he} already stops trying to fight back.. but you need to really drive the point home, ramming your knee into {npc.his} stomach.")
		
		saynn("Each strike lands with a sickening thud, bruises and scratches appear throughout {npc.his} bleeding, hurt body.")
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.personalityScore({PersonalityStat.Mean: 1.0}) > 0.3):
			saynn("[say=npc]"+RNG.pick([
				"Grr.. Fucker..",
				"Fuck.. Stupid.. it hurts..",
				"Stop it, you fuck..",
				"Ugh.. Fuck.."
			])+"[/say]")
		elif(npcSlavery.personalityScore({PersonalityStat.Subby: 1.0}) < -0.4):
			saynn("[say=npc]"+RNG.pick([
				"Ow.. Hah.. Using pain.. smart.. ugh..",
				"You can't beat the dominant out of me..",
				"It hurts.. Hope you're happy..",
			])+"[/say]")
		elif(npcSlavery.personalityScore({PersonalityStat.Subby: 1.0}) >= 0.5):
			saynn("[say=npc]"+RNG.pick([
				"Ow.. I'm sorry!.. Agh..",
				"I'm really sorry, please!.. Argh..",
				"Sorry.. Ow.. argh.. it hurts..",
				"I will do anything, please.. Argh..",
			])+"[/say]")
		else:
			saynn("[say=npc]"+RNG.pick([
				"Fuck.. Argh..",
				"Stop it already, it hurts..",
				"Hope you're fucking happy..",
				"Grr.. argh.. ugh..",
			])+"[/say]")
		
		saynn("You chip away at their spirit, breaking down {npc.his} resistance until there's nothing left but fear.")
		
		saynn("You only stop when {npc.he} drops down to the floor. You pin {npc.him} with your leg, showing how defeated {npc.he} really {npc.isAre}.")
		
		saynn("Looks like {npc.he} {npc.isAre} ready for anything.")
		
		addAfterForceButton()
		addButton("Cancel", "They should resist less at least", "")
	
	if(state == "won_resistaction"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcAction="defeat", npcBodyState={leashedBy="pc"}})
		
		saynn("You won! Beating up your slave made {npc.him} more scared of you.")
		
		saynn("You grab {npc.his} chain, meaning {npc.he} can't escape what you will do to {npc.him}.")
		
		addAfterForceButton()
		addButton("Cancel", "They should resist less at least", "")
	
	if(state == "lost_forcedsex"):
		playAnimation(StageScene.Duo, "defeat", {npc=npcID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]] } })
		saynn("You lost. Aw. And it looks like your slave is not planning to just let you walk away free after that..")
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.personalityScore({PersonalityStat.Mean: 1.0}) > 0.3):
			saynn("[say=npc]"+RNG.pick([
				"You suck! I will make sure you do!",
				"No-no-no, don't crawl away, slut. Get over here.",
				"Get over here, stupid whore of an owner.",
				"Time for me to have some fun with you, stupid whore!",
				"I'm so fucking mad, get your ass over here."
			])+"[/say]")
		elif(npcSlavery.personalityScore({PersonalityStat.Subby: 1.0}) < -0.4):
			saynn("[say=npc]"+RNG.pick([
				"Let me show it how it's done.",
				"Don't worry, I will be gentle. As long as you obey.",
				"Time to punish you.",
				"My turn to punish.",
				"My turn to be an owner.",
			])+"[/say]")
		elif(npcSlavery.personalityScore({PersonalityStat.Subby: 1.0}) >= 0.5):
			saynn("[say=npc]"+RNG.pick([
				"Um.. I will try to be gentle..",
				"Can I?.. I think I can.. Please?",
			])+"[/say]")
		else:
			saynn("[say=npc]"+RNG.pick([
				"My turn. Don't resist.",
				"Don't get up.",
				"I'm gonna fuck you for this!",
				"My turn to have som fun.",
			])+"[/say]")
		
		saynn("This deserves a [b]punishment[/b].. will deserve..")
		
		addButton("Get fucked", "See what they do to you", "start_sex_as_sub")
	
	if(state == "lost_removedrestraints"):
		playAnimation(StageScene.Duo, "defeat", {npc=npcID, npcAction="struggle", npcBodyState={chains=[["normal", "neck", "scene", "floor"]] } })

		saynn("You hit the floor, unable to continue fighting.")
		
		saynn("While you're trying to recover, your slave has enough time to remove some of {npc.his} restraints! Luckily, the chain prevented {npc.him} from escaping.")
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.personalityScore({PersonalityStat.Mean: 1.0}) > 0.3):
			saynn("[say=npc]"+RNG.pick([
				"Fuck your shit! It won't keep me from escaping for long.",
				"See? You can't keep me here! Just fucking let me go already, you stupid bitch.",
				"I'm so close! Watch me, soon I won't even be here!",
				"Stupid cunt, I will break you, just like I broke your toys.",
				"So? Happy now? Want more? I have more!",
			])+"[/say]")
		elif(npcSlavery.personalityScore({PersonalityStat.Subby: 1.0}) < -0.4):
			saynn("[say=npc]"+RNG.pick([
				"Nice toys. Mine are better.",
				"Your toys can't hold me forever.",
				"Hah. That was easy.",
			])+"[/say]")
		elif(npcSlavery.personalityScore({PersonalityStat.Subby: 1.0}) >= 0.5):
			saynn("[say=npc]"+RNG.pick([
				"I broke something.. sorry..",
				"Oops.. I broke a few things.. sorry..",
				"I hope you mind.. I broke a few things..",
			])+"[/say]")
		else:
			saynn("[say=npc]"+RNG.pick([
				"These can't hold me for long.",
				"I will escape.. You can't stop me.",
				"Just let me go already, you clearly can't handle me.",
				"You're too weak. Just let me go.",
				"Think I will respect you after this?",
			])+"[/say]")
		
		saynn("That surely deserves a punishment.")
		
		addButton("Continue", "That was rough", "")
	
	if(state == "lost_noaction"):
		playAnimation(StageScene.Duo, "defeat", {npc=npcID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]] } })

		saynn("You hit the floor, unable to continue fighting.")
		
		saynn("While you're trying to recover, your slave.. doesn't exactly know what to do. {npc.He} tugs on the chains a bit.. but they don't budge.")
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.personalityScore({PersonalityStat.Mean: 1.0}) > 0.3):
			saynn("[say=npc]"+RNG.pick([
				"You suck!",
				"Why do you suck so much?",
				"If I had more time, I wouldn't be here by now!",
				"Wow, you punch like a slut.",
				"Beating me up? That was a stupid idea. Almost as dumb as enslaving me in the first place.",
				"Easy, pal. Don't make me finish you off.",
			])+"[/say]")
		elif(npcSlavery.personalityScore({PersonalityStat.Subby: 1.0}) < -0.4):
			saynn("[say=npc]"+RNG.pick([
				"Nice try. But I think it's you who should be the slave here.",
				"If I had more time.. You'd be kissing my feet by now.. and loving it.",
				"Damn chains. I love them.. but not when they're on me!",
				"Call me the owner now, I'm clearly stronger.",
			])+"[/say]")
		elif(npcSlavery.personalityScore({PersonalityStat.Subby: 1.0}) >= 0.5):
			saynn("[say=npc]"+RNG.pick([
				"Um.. sorry..",
				"Sorry.. I didn't mean to win.. I mean.. Never mind..",
				"You will be okay, right?..",
				"I just wanted to protect myself.. sorry..",
			])+"[/say]")
		else:
			saynn("[say=npc]"+RNG.pick([
				"Maybe you should listen when I say that I don't want to do something?",
				"I just wanted to protect myself.",
				"Easy, pal. Don't make me finish you off.",
				"So? Gonna listen to me better now?",
			])+"[/say]")
		
		saynn("Your slave has beat you up in a fair fight.. but this still deserves a small punishment.")
		
		addButton("Continue", "That was rough", "")

func addActivityButtons():
	var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
	if(npcSlavery.isDoingActivity()):
		var activity:SlaveActivityBase = npcSlavery.getActivity()
	
		var extraActions = activity.getInteractActions()
		for actionInfo in extraActions:
			var args = []
			if(actionInfo.has("args")):
				args = actionInfo["args"]
			var buttonChecks = []
			if(actionInfo.has("buttonChecks")):
				buttonChecks = actionInfo["buttonChecks"]
			addButtonWithChecks(actionInfo["name"], actionInfo["desc"], "do_activity_action", [activity, actionInfo, args], buttonChecks)


static func sortSlaveActions(a, b):
	if a.buttonPriority > b.buttonPriority:
		return true
	return false
		
func addButtonsForActionsOfType(actionsType):
	var theActionIDs = GlobalRegistry.getSlaveActionIDsOfType(actionsType)
	var actionsSorted = []
	for theActionID in theActionIDs:
		var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(theActionID)
		if(theAction == null):
			continue
		actionsSorted.append(theAction)
	actionsSorted.sort_custom(self, "sortSlaveActions")
	
	for theAction in actionsSorted:
		#var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(actionID)
		if(!theAction.isActionVisibleFinal(npcID)):
			continue
		
		if(theAction.extraSlaves.empty()):
			var canDoInfo = theAction.checkCanDoFinal(npcID)
			if(canDoInfo[0]):
				addButton(theAction.getVisibleName(), theAction.getFinalVisibleDesc(), "do_action", [theAction.id])
			elif(canDoInfo.size() > 1):
				addDisabledButton(theAction.getVisibleName(), "[color=red]"+canDoInfo[1]+"[/color]\n\n"+theAction.getFinalVisibleDesc())
		else:
			addButton(theAction.getVisibleName(), theAction.getFinalVisibleDesc(), "do_action", [theAction.id])

func addAfterForceButton():
	addButtonWithChecks(savedWantedToDoName, "Do what you wanted to do", savedWantedToDo, savedWantedToDoArgs, savedButtonChecks)

func checkSlaveResist(resistChance, onlyActiveResist = false):
	var npcSlavery:NpcSlave = npc.getNpcSlavery()
	slaveResistedSuc = true
	if(onlyActiveResist && RNG.chance(resistChance) && npcSlavery.isResistingSuperActively()):
		var possibleResists = []
		var resistSuccessChance = 100
		if(npc.isBlindfolded()):
			resistSuccessChance *= 0.5
		if(npc.hasBoundLegs()):
			resistSuccessChance *= 0.6
		else:
			possibleResists.append("resist_kick")
		if(npc.hasBlockedHands()):
			resistSuccessChance *= 0.8
		else:
			possibleResists.append("resist_scratch")
		if(npc.hasBoundArms()):
			resistSuccessChance *= 0.7
		else:
			possibleResists.append("resist_shove")
		if(npc.isBitingBlocked()):
			resistSuccessChance *= 0.95
		else:
			possibleResists.append("resist_bite")
		
		if(!RNG.chance(resistSuccessChance)):
			slaveResistedSuc = false
		
		if(possibleResists.size() > 0):
			var randomResist = RNG.pick(possibleResists)
			# Do add pain
			if(slaveResistedSuc):
				GM.pc.addPain(RNG.randi_range(3, 6))
			activeResistType = randomResist
			setState("resisting_actively")
			return true
	
	if(npcSlavery.isActivelyResisting() && RNG.chance(resistChance) && !onlyActiveResist):
		setState("resisting_action")
		return true
	
	return false
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "do_action"):
		var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(_args[0])
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		# Resisting!
		if(checkSlaveResist(theAction.slaveResistChanceMult * 100.0, theAction.slaveOnlyActiveResist)):
			savedWantedToDo = "do_action_noresist"
			savedWantedToDoName = theAction.getVisibleName()
			savedWantedToDoArgs = [_args[0]]
			savedButtonChecks = []
			return
		
	if(_action == "do_action" || _action == "do_action_noresist"):
		var theAction:SlaveActionBase = GlobalRegistry.getSlaveAction(_args[0])
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		# Multi-slave action
		if(!theAction.extraSlaves.empty()):
			runScene("SlaveStartActionScene", [theAction.id, npcID], "slaveStartAction")
			setState("")
			return
		
		# Action that launches a scene
		if(theAction.sceneID != ""):
			runScene("SlaveActionWrapperScene", [theAction.id, npcID, {}])
			if(theAction.endsTalkScene):
				endScene()
				return
			setState("")
			return
		# Simple action
		var result = theAction.doActionSimpleFinal(npcID)
		if(result.has("text")):
			resultText = result["text"]
		else:
			resultText = "An action happened!"
		lastActionID = theAction.id
		#theAction.playAnimation(npcID, {})
		setState("do_action")
		return

	if(_action == "do_train"):
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		#var resistChance = max(80.0*float(npcSlavery.isResistingSuperActively()), 30.0*float(npcSlavery.isActivelyResisting()))
		#if(RNG.chance(resistChance)):
		if(checkSlaveResist(80.0)):
			savedWantedToDo = "do_train_noresist"
			savedWantedToDoName = "Train"
			savedWantedToDoArgs = []
			savedButtonChecks = []
			return
		
	if(_action == "do_train" || _action == "do_train_noresist"):
		processTime(30*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		var result = npcSlavery.doTrain()
		resultText = Util.join(result["texts"], "\n\n")
		
		setState("do_train")
		return

	if(_action == "do_activity_action"):
		#var action:SlaveActivityBase = _args[0]
		var actionInfo = _args[1]
		var theArgs = _args[2]
		
		endScene()
		runScene(actionInfo["sceneID"], [npcID, {}, theArgs])
		return

	if(_action == "do_extra_action"):
		#var action:SlaveActionBase = _args[0]
		var actionInfo = _args[1]
		var theArgs = _args[2]
		
		endScene()
		runScene(actionInfo["sceneID"], [npcID, {}, theArgs])
		return

	if(_action == "resisting_start_fight"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		var cowardness = npcSlavery.personalityScore({PersonalityStat.Coward:1.0})
		
		var fightChance = 0.0
		if(cowardness >= 0.5):
			fightChance = 0.0
		elif(cowardness <= -0.5):
			fightChance = 100.0
		else:
			fightChance = Util.remapValue(cowardness, -0.5, 0.5, 100.0, 0.0)
		
		if(RNG.chance(fightChance)):
			setState("resist_hastofight")
		else:
			npcSlavery.afterBeatenUp()
			setState("resist_autobeatup")
		return
	
	if(_action == "start_fight_with_slave"):
		runScene("FightScene", [npcID], "antiresistancefight")
		return

	if(_action == "start_walkies"):
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		#if(npcSlavery.isResistingSuperActively() || (RNG.chance(40) && npcSlavery.isActivelyResisting())):
		if(checkSlaveResist(100.0)):
			savedWantedToDo = "start_walkies_forced"
			savedWantedToDoName = "Leash slave"
			savedWantedToDoArgs = []
			savedButtonChecks = []
		else:
			runScene("SlaveryWalkiesGrabScene", [npcID])
			endScene()
		return

	if(_action == "start_walkies_forced"):
		runScene("SlaveryWalkiesGrabScene", [npcID])
		endScene()
		return

	if(_action == "do_forced_sex"):
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		#if(npcSlavery.isResistingSuperActively() || (RNG.chance(40) && npcSlavery.isActivelyResisting())):
		if(checkSlaveResist(100.0)):
			savedWantedToDo = "start_forced_sex_forced"
			savedWantedToDoName = "Forced sex"
			savedWantedToDoArgs = []
			savedButtonChecks = [[ButtonChecks.CanStartSex]]
		else:
			startSex()
		return
	
	if(_action == "start_forced_sex_forced"):
		startSex(true)
		return
		
	if(_action == "forced_sex_let_resist"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		# Raise the spirit here?
		if(_args.size() > 0 && _args[0]):
			npcSlavery.addBrokenSpirit(-0.02)
			npcSlavery.addAwareness(-0.02)
			npcSlavery.deservesPunishment(2)
		else:
			npcSlavery.addBrokenSpirit(-0.01)
			npcSlavery.addAwareness(-0.01)
			npcSlavery.deservesPunishment(1)
		setState("")
		return
	
	if(_action == "start_sex_as_sub"):
		runScene("GenericSexScene", [npcID, "pc"], "fucked_by_angry_slave")
		setState("")
		return
		
	if(_action == "do_force_action"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.getTrust() <= 0.0):
			npcSlavery.addDespair(0.03)
		else:
			npcSlavery.addTrust(-0.02)
			npcSlavery.addLove(-0.02)
		npcSlavery.addAwareness(0.01)
		
		return _react(_args[0], _args[1]) # Might break one day, don't hurt me

	setState(_action)

func startSex(isResisting = false):
	if(isResisting):
		npc.addEffect("SexActivelyResisting")
	runScene("GenericSexScene", ["pc", npcID], "sex_with_slave")

func _react_scene_end(_tag, _result):
	if(_tag == "slaveStartAction"):
		if(_result is Array && _result.size() > 0 && _result[0]):
			endScene()
			return
			
	if(_tag in ["sex_with_slave"]):
		setState("")
	
	if(_tag == "antiresistancefight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("won_resistaction")
			addExperienceToPlayer(10)
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			npcSlavery.afterBeatenUp()
			npcSlavery.deservesPunishment(2)
			#npcSlavery.handlePunishment(2)
		else:
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			
			var canSex = true
			var shouldSex = false
			if(npc.hasBlockedHands() || npc.hasBoundArms() || npc.isOralBlocked() || npc.isBlindfolded()):
				canSex = false
			else:
				var fuckChance = 75 + npcSlavery.personalityScore({PersonalityStat.Subby:1.0, PersonalityStat.Mean:1.0, PersonalityStat.Coward:-1.0})*25.0
				if(RNG.chance(fuckChance)):
					shouldSex = true
				
			var removeChanceMult = 1.0 + npcSlavery.personalityScore({PersonalityStat.Brat:-0.5}) + npcSlavery.fetishScore({Fetish.Bondage: -0.5})
			var howMuchRestraintsRemoved = npc.getInventory().removeRandomRestraints(100.0*clamp(removeChanceMult, 0.1, 5.0))
			
			npcSlavery.addBrokenSpirit(-0.2)
			npcSlavery.addObedience(-0.2)
			npcSlavery.addDespair(-0.2)
			npcSlavery.addTired(1.0)
			
			if(howMuchRestraintsRemoved > 0):
				setState("lost_removedrestraints")
				npcSlavery.deservesPunishment(2)
			else:
				if(canSex && shouldSex):
					setState("lost_forcedsex")
					npcSlavery.deservesPunishment(3)
				else:
					setState("lost_noaction")
					npcSlavery.deservesPunishment(1)
			
			

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["resultText"] = resultText
	data["savedWantedToDo"] = savedWantedToDo
	data["savedWantedToDoName"] = savedWantedToDoName
	data["savedWantedToDoArgs"] = savedWantedToDoArgs
	data["lastActionID"] = lastActionID
	data["savedButtonChecks"] = savedButtonChecks
	data["slaveResistedSuc"] = slaveResistedSuc
	data["activeResistType"] = activeResistType
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)

	resultText = SAVE.loadVar(data, "resultText", "")
	savedWantedToDo = SAVE.loadVar(data, "savedWantedToDo", "")
	savedWantedToDoName = SAVE.loadVar(data, "savedWantedToDoName", "")
	savedWantedToDoArgs = SAVE.loadVar(data, "savedWantedToDoArgs", null)
	lastActionID = SAVE.loadVar(data, "lastActionID", "")
	savedButtonChecks = SAVE.loadVar(data, "savedButtonChecks", [])
	slaveResistedSuc = SAVE.loadVar(data, "slaveResistedSuc", false)
	activeResistType = SAVE.loadVar(data, "activeResistType", "")

func getDebugActions():
	return [
		{
			"id": "levelUP",
			"name": "Slave levelup",
			"args": [
			],
		},
		{
			"id": "skillLevelup",
			"name": "Skill levelup",
			"args": [
			],
		},
		{
			"id": "addExp",
			"name": "Add exp",
			"args": [
				{
					"id": "amount",
					"name": "Amount",
					"type": "number",
					"value": 1000,
				},
			],
		},
		{
			"id": "toggleDebug",
			"name": "Toggle Debug Info",
			"args": [
			],
		},
		{
			"id": "setObedience",
			"name": "Set obedience",
			"args": [
				{
					"id": "amount",
					"name": "Amount (%)",
					"type": "number",
					"value": 100.0,
				},
			],
		},
		{
			"id": "setLove",
			"name": "Set love",
			"args": [
				{
					"id": "amount",
					"name": "Amount (%)",
					"type": "number",
					"value": 100.0,
				},
			],
		},
		{
			"id": "setBrokenSpirit",
			"name": "Set broken spirit",
			"args": [
				{
					"id": "amount",
					"name": "Amount (%)",
					"type": "number",
					"value": 100.0,
				},
			],
		},
	]

func doDebugAction(_id, _args = {}):
	var npcSlavery:NpcSlave = npc.getNpcSlavery()
	if(_id == "levelUP"):
		npcSlavery.doLevelup()
	if(_id == "skillLevelup"):
		npcSlavery.levelupCurrentSpecialization()
	if(_id == "toggleDebug"):
		setFlag("NpcSlaveryModule.debugSlaveInfo", !getFlag("NpcSlaveryModule.debugSlaveInfo", false))
	if(_id == "addExp"):
		npcSlavery.addExperience(_args["amount"])
	if(_id == "setObedience"):
		npcSlavery.obedience = clamp(_args["amount"] / 100.0, 0.0, 1.0)
	if(_id == "setLove"):
		npcSlavery.love = clamp(_args["amount"] / 100.0, 0.0, 1.0)
	if(_id == "setBrokenSpirit"):
		npcSlavery.brokenspirit = clamp(_args["amount"] / 100.0, 0.0, 1.0)
