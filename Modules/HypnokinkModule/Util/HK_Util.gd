extends Object
class_name HK_Util

static func addUnresistableHypnoButtons(scene: SceneBase, submitAction: String, specificSubmitActions = [], preexistingButtons: int = 0):
	var optionsSubmit = []
	optionsSubmit.append_array(["Submit", "Succumb", "Surrender", "Obey", "Give in", "Play along", "Accept", "Comply", "Stay in trance"])
	optionsSubmit.append_array(specificSubmitActions)
	
	var buttonSlots = 11.0 - preexistingButtons
	var submitButtonsToAdd = 3 + floor((min(HK_CharUtil.getSuggestibleStacks(GM.pc), 100.0) / 100.0) * buttonSlots)
	
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
	var submitButtonsToAdd = 2 + floor((min(HK_CharUtil.getSuggestibleStacks(GM.pc), 100.0) / 100.0) * buttonSlots)
	var resistButtonIndex = RNG.randi_range(0, submitButtonsToAdd)
	
	for i in range(submitButtonsToAdd + 1):
		if(i == resistButtonIndex):
			scene.addButton(optionsResist[0], "", resistAction)
		if(i % optionsSubmit.size() == 0):
			optionsSubmit.shuffle()
		scene.addButton(optionsSubmit[i % optionsSubmit.size()], "", submitAction)
