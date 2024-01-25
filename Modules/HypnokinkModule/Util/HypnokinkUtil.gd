extends Object
class_name HypnokinkUtil

const VionGood = 1
const VionNeutral = 2
const VionEvil = 3
	
static func suggestibleIcon(width: int = 16) -> String:
	return "[img="+str(width)+"]"+"res://Modules/HypnokinkModule/Icons/StatusEffects/hypno1.png"+"[/img]"
	
static func hypnosisIcon(width: int = 16) -> String:
	return "[img="+str(width)+"]"+"res://Images/StatusEffects/hypnosissmall.png"+"[/img]"
	
static func tranceIcon(width: int = 16) -> String:
	return "[img="+str(width)+"]"+"res://Images/StatusEffects/hypnosis.png"+"[/img]"
	
static func addUnresistableHypnoButtons(scene: SceneBase, submitAction: String, specificSubmitActions = [], preexistingButtons: int = 0):
	var optionsSubmit = []
	optionsSubmit.append_array(["Submit", "Succumb", "Surrender", "Obey", "Give in", "Play along", "Accept", "Comply", "Stay in trance"])
	optionsSubmit.append_array(specificSubmitActions)
	
	var buttonSlots = 11.0 - preexistingButtons
	var submitButtonsToAdd = 3 + floor((min(getSuggestibleStacks(GM.pc), 100.0) / 100.0) * buttonSlots)
	
	for i in range(submitButtonsToAdd + 1):
		if(i % optionsSubmit.size() == 0):
			optionsSubmit.shuffle()
		scene.addButton(optionsSubmit[i % optionsSubmit.size()], "", submitAction)
	
static func addHypnoButtons(scene: SceneBase, submitAction: String, resistAction: String, specificSubmitActions = [], specificResistActions = [], preexistingButtons: int = 0):
	var optionsSubmit = []
	optionsSubmit.append_array(["Submit", "Succumb", "Surrender", "Obey", "Give in", "Play along", "Accept", "Comply", "Stay in trance"])
	optionsSubmit.append_array(specificSubmitActions)
	
	var optionsResist = []
	optionsResist.append_array(specificResistActions)
	if(specificResistActions.size() == 0):
		optionsResist.append("Resist")
	optionsResist.shuffle()
	
	var buttonSlots = 11.0 - preexistingButtons
	var submitButtonsToAdd = 2 + floor((min(getSuggestibleStacks(GM.pc), 100.0) / 100.0) * buttonSlots)
	var resistButtonIndex = RNG.randi_range(0, submitButtonsToAdd)
	
	for i in range(submitButtonsToAdd + 1):
		if(i == resistButtonIndex):
			scene.addButton(optionsResist[0], "", resistAction)
		if(i % optionsSubmit.size() == 0):
			optionsSubmit.shuffle()
		scene.addButton(optionsSubmit[i % optionsSubmit.size()], "", submitAction)
		
static func getSuggestibleEffect(character: BaseCharacter): #-> StatusEffectBase:
	var status = character.getEffect(StatusEffect.Suggestible)
	return status
	
static func isHypnotized(character: BaseCharacter) -> bool:
	var status = character.getEffect(StatusEffect.Suggestible)
	if(status == null):
		return false
	return status.isHypnotized()
	
static func isInTrance(character: BaseCharacter) -> bool:
	var status = character.getEffect(StatusEffect.Suggestible)
	if(status == null):
		return false
	return status.isInTrance()
	
static func getSuggestibleStacks(character: BaseCharacter) -> float:
	var status = character.getEffect(StatusEffect.Suggestible)
	if(status == null):
		return 0.0
	return status.stacks
	
static func raiseSuggestibilityTo(character: BaseCharacter, amount: float):
	var status = character.getEffect(StatusEffect.Suggestible)
	if(status == null):
		character.addEffect(StatusEffect.Suggestible, [amount])
	else:
		status.stacks = max(status.stacks, amount)
		status.clampOrRemove()
	
static func changeSuggestibilityBy(character: BaseCharacter, amount: float):
	var status = character.getEffect(StatusEffect.Suggestible)
	if(status == null):
		if(amount >= 0):
			character.addEffect(StatusEffect.Suggestible, [amount])
	else:
		status.stacks += amount
		status.clampOrRemove()
