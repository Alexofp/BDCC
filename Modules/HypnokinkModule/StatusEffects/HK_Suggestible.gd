extends StatusEffectBase

var stacks := 0.0

func _init():
	id = StatusEffect.Suggestible
	isBattleOnly = false
	isSexEngineOnly = false
	
func setCharacter(c):
	.setCharacter(c)
	character.connect("pain_changed", self, "_on_pain_changed")
	
func initArgs(_args = []):
	if(_args.size() > 0):
		stacks = _args[0]
	else:
		stacks = 1
	clampOrRemove()
	
func processBattleTurn():
	clampOrRemove()
	
func processTime(_seconds: int):
	#active hypnosis prevents natural falloff
	if(!(character.hasEffect(StatusEffect.UnderHypnosis) || character.hasEffect(StatusEffect.HypnoVisorActive))):
		var minutes = (_seconds / 60.0)
		if(minutes > 1): #this is cheating, but I want walking around to generate visible amounts without longer times just filling up to max immediately
			minutes /= 10
		stacks = stacks - minutes
	clampOrRemove()

func onSleeping():
	stacks = min(stacks, 25)
	
func _on_pain_changed(after, before):
	var amount = after - before
	if(amount <= 0):
		return
	var mult = 1.5
	if(character.hasPerk(Perk.HypnosisDeepTranceDrawback)):
		mult = 0.25
	stacks -= amount * mult #pain multiplier
	clampOrRemove()

func isHypnotized():
	return (stacks >= 35) #hypnotized threshold
	
func isInTrance():
	return (stacks >= 75) #in trance threshold
		
func getEffectName():
	if(!isHypnotized()):
		return "Suggestible"
	elif(!isInTrance()):
		return "Hypnotized"
	else:
		return "Entranced"

func getEffectDesc():
	var text
	if(!isHypnotized()):
		text = "You are vulnerable to suggestion."
	elif(!isInTrance()):
		text = "You are hypnotized."
	else:
		text = "You are fully in trance!"
		
	return text + "\n\n("+str(ceil(stacks))+"%)"

func getEffectImage():
	if(!isHypnotized()):
		return "res://Modules/HypnokinkModule/Icons/StatusEffects/hypno1.png"
	elif(!isInTrance()):
		return "res://Images/StatusEffects/hypnosissmall.png"
	else:
		return "res://Images/StatusEffects/hypnosis.png"

func getIconColor():
	if(isInTrance()):
		return IconColorBrightPurple
	elif(isHypnotized()):
		return IconColorDarkPurple
	else:
		return IconColorRed

func getBuffs():
	var mult = 1.0
	if(character.hasPerk(Perk.HypnosisMantraMinded)):
		mult -= 0.1
	if(character.hasPerk(Perk.HypnosisDetachment)):
		mult -= 0.2
	if(character.hasPerk(Perk.HypnosisLucidTrance)):
		mult -= 0.3
	var buffs = []
	if(stacks > 20):
		buffs.append(buff(Buff.PhysicalDamageBuff, [round(mult * -(min(stacks - 20, 80)))]))
	if(stacks > 25):
		buffs.append(buff(Buff.ForcedObedienceBuff, [round(mult * (min((stacks - 25) * (1 / 0.75), 100)))]))
	if(stacks > 40):
		buffs.append(buff(Buff.ReceivedLustDamageBuff, [round(mult * +(min((stacks - 40) * 0.5, 30)))]))
	return buffs
	

func combine(_args = []):
	stacks += _args[0]
	clampOrRemove()
	
func saveData():
	return {
		"stacks": stacks,
	}
	
func loadData(_data):
	stacks = SAVE.loadVar(_data, "stacks", 0)
	
func clampOrRemove():
	var maximum = 100.0
	if(character.hasPerk(Perk.HypnosisDeepTranceDrawback)):
		maximum += 25.0
	if(stacks > maximum): 
		stacks = maximum
	elif(stacks <= 0):
		stop()
