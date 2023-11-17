extends StatusEffectBase
class_name HK_Suggestible

#const hypnotizedThreshold = 35
#const inTranceThreshold = 75

var stacks := 0.0

func _init():
	id = HK_StatusEffect.Suggestible
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
	if(!(character.hasEffect(HK_StatusEffect.UnderHypnosis) || character.hasEffect(HK_StatusEffect.HypnoVisorActive))):
		var minutes = (_seconds / 60.0)
		if(minutes > 1): #this is cheating, but I want walking around to generate visible amounts without longer times just filling up to max immediately
			minutes /= 10
		stacks = stacks - minutes
	clampOrRemove()

func _on_pain_changed(after, before):
	var amount = after - before
	if(amount <= 0):
		return
	var mult = 1.5
	if(character.hasPerk(HK_Perk.DeepTranceDrawback)):
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
		return "res://Modules/HypnokinkModule/Icons/StatusEffects/hypno2.png"
	else:
		return "res://Modules/HypnokinkModule/Icons/StatusEffects/hypno3.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	var mult = 1.0
	if(character.hasPerk(HK_Perk.MantraMinded)):
		mult -= 0.1
	if(character.hasPerk(HK_Perk.Detachment)):
		mult -= 0.2
	if(character.hasPerk(HK_Perk.LucidTrance)):
		mult -= 0.3
	var buffs = []
	if(stacks > 20):
		buffs.append(buff(Buff.PhysicalDamageBuff, [mult * -(min(stacks - 20, 80))]))
	if(stacks > 40):
		buffs.append(buff(Buff.ReceivedLustDamageBuff, [mult * +(min((stacks - 40) * 0.5, 30))]))
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
	if(character.hasPerk(HK_Perk.DeepTranceDrawback)):
		maximum += 25.0
	if(stacks > maximum): 
		stacks = maximum
	elif(stacks <= 0):
		stop()
