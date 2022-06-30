extends LustAction

func _init():
	id = "CumCumOnEnemy"
	isOrgasmAction = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isInBattle()):
		return false
	var pc: Player = _lustState.getCharacter()
	if(!pc.hasPerk(Perk.CumCumOnOpponent)):
		return false
	if(!pc.hasPenis() && !pc.hasVagina()):
		return false
	return true

func canDo(_lustState: LustCombatState, _args):
	var pc: Player = _lustState.getCharacter()
	if(pc.getStamina() <= 0):
		return [false, "You don't have enough stamina to do this"]
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Cum on enemy"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Use 40 stamina to tackle the enemy and cum all over them, covering their body in your cum/juices!"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)
	var pc: Player = _lustState.getCharacter()
	pc.orgasmFrom(pc.getID())
	pc.addStamina(-40)
	
	var enemy = _lustState.getEnemyCharacter()
	if(enemy != null):
		if(pc.hasPenis()):
			enemy.addEffect(StatusEffect.NPCCoveredInCum, [3, "cum"])
		elif(pc.hasVagina()):
			enemy.addEffect(StatusEffect.NPCCoveredInCum, [3, "girlcum"])
		enemy.addEffect(StatusEffect.Stunned, [1])
	
	var text = ""
	if(pc.hasPenis()):
		text += "You feel your climax taking over your body. But instead of just being still, you pounce at your opponent, knocking them off their feet and pinning to the floor. Then you use this opportunity to stroke yourself further over the edge!"
		text += "\n\n"
	
		text += "Your {pc.cock} starts throbbing and shooting ropes of hot sticky {pc.cum} all over the opponent, covering them from head to feet. You feel your balls being drained as each second the shaft fires off more and more {pc.cum} until you’re spent."
		text += "\n\n"
	
		text += "Opponent’s confusion gives you enough time to get off them and calm down after your climax."
		text += "\n\n"
	elif(pc.hasVagina()):
		text += "You feel your climax taking over your body. But instead of just being still, you pounce at your opponent, knocking them off their feet and pinning to the floor. Then you use this opportunity to rub your pussy, forcing yourself over the edge."
		text += "\n\n"
	
		text += "You let out a couple passionate moans as your pussy starts squirting with girlcum all over your enemy, covering them from head to feet. You legs shake, body shivers, you arch your back and endure the pleasure waves while humiliating the opponent by cumming on them in the process."
		text += "\n\n"
		
		text += "Opponent’s confusion gives you enough time to get off them and calm down after your orgasm."
		text += "\n\n"

	return {
		text = text,
		came = true,
		#lostBattle = true,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.1,
		InterestTopic.MasculineBody : 0.1,
		InterestTopic.AndroBody : 0.1,
		InterestTopic.BigCock : 0.1,
		InterestTopic.AverageCock : 0.1,
		InterestTopic.SmallCock : 0.1,
		InterestTopic.HasVaginaOnly : 0.3,
		InterestTopic.HasCockOnly : 0.1,
		InterestTopic.HasVaginaAndCock : 0.3,
		InterestTopic.StuffedPussy : 0.1,
		InterestTopic.CoveredInCum : 0.1,
		InterestTopic.CoveredInLotsOfCum : 0.1,
	}

func getPriority():
	return 1

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 3], [Skill.CumLover, 10]]
	return []
