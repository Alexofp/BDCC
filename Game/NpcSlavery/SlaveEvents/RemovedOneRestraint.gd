extends SlaveEventBase

func _init():
	id = "RemovedOneRestraint"
	eventWeight = 1.0

func canHappen(_npcSlavery:NpcSlave):
	if(!_npcSlavery.getChar().getInventory().hasRemovableRestraints()):
		return false
	return true

func shouldHappenChance(_npcSlavery:NpcSlave):
#	var personalityMult = 1.0 + _npcSlavery.personalityScore({
#		PersonalityStat.Subby: -0.8,
#		PersonalityStat.Brat: 0.5,
#		PersonalityStat.Impatient: 0.2,
#		})
	var fetishMult = 1.0 + _npcSlavery.fetishScore({
		Fetish.Bondage: -0.9,
	})
	
	return 100.0 * _npcSlavery.getResistScore() * fetishMult + 10.0 * _npcSlavery.getBratScore() + sqrt(_npcSlavery.getNeediness()) * 2.0

func runEvent(_npcSlavery:NpcSlave):
	# Brats are more likely to try to resist but less likely to actually succeed (because they like restraints)
	# Ones who like bondage are less likely to succeed too
	var removeChanceMult = 1.0 + _npcSlavery.personalityScore({PersonalityStat.Brat:-0.5}) + _npcSlavery.fetishScore({Fetish.Bondage: -0.5})
	var howManyRemoved = removeRandomRestraints(_npcSlavery.getChar(), 100.0*clamp(removeChanceMult, 0.1, 5.0))
	
	var theText = ""
	if(howManyRemoved == 0):
		theText = "You notice that {npc.name} has some signs of damage on {npc.his} restraints. {npc.He} clearly tried to struggle out of them!\n\nNot very successfully it seems. Still, it deserves a small punishment."
		_npcSlavery.deservesPunishment(1)
	elif(howManyRemoved == 1):
		theText = "You notice that {npc.name} has one of {npc.his} restraints missing! Looks like {npc.he} managed to struggle out of it while you weren't looking."
		_npcSlavery.deservesPunishment(2)
	else:
		theText = "You notice that {npc.name} has some of {npc.his} restraints missing! Looks like {npc.he} managed to struggle out of them while you weren't looking."
		_npcSlavery.deservesPunishment(2)
		# Add tiredness here too?
	
	if(_npcSlavery.getNeediness() > 40.0):
		theText += "\n\n[say=npc]"+RNG.pick([
			"I just wanna cum.. Please..",
			"Don't stop me, I need this. You keep denying me..",
			"I'm just.. so horny.. all the time..",
			"You like watching me suffer from constant lust, don't you?"
		])+"[/say]"
		
		theText += "\n\nLooks like the neediness is what makes {npc.him} so desperate to remove the restraints."
	
	return {
		text = theText,
	}

func onEventSkipped(_npcSlavery:NpcSlave):
	removeRandomRestraints(_npcSlavery.getChar(), 50.0)

func removeRandomRestraints(character:BaseCharacter, removedRestraintsChance = 100.0):
	var restraints = character.getInventory().getEquppedRestraints()
	var howManyRemoved = 0
	if(restraints.size() > 0):
		for restraint in restraints:
			if(restraint.isImportant() || restraint.isPersistent()):
				continue
			
			var chanceModifier = 1.0
			var restraintData:RestraintData = restraint.getRestraintData()
			if(restraintData != null):
				chanceModifier /= restraintData.getLevel()
			
			if(RNG.chance(removedRestraintsChance * chanceModifier)):
				character.getInventory().removeEquippedItem(restraint)
				howManyRemoved += 1
	
	return howManyRemoved

func getAnimInfo(_npcSlavery:NpcSlave):
	var possibleAnims = ["struggle"]
	
	if(_npcSlavery.getChar().isGagged() || _npcSlavery.getChar().isMuzzled()):
		possibleAnims.append("struggle_gag")
	if(_npcSlavery.getChar().hasBoundLegs()):
		possibleAnims.append("struggle_legs")
	
	return [StageScene.Duo, "stand", {npc=_npcSlavery.getChar().getID(), npcAction=RNG.pick(possibleAnims)}]
