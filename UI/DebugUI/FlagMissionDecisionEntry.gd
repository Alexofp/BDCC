extends HBoxContainer

onready var label = $Label
onready var option_button = $OptionButton

var missionID:String
var decisionID:String
var storedDecision:Dictionary
var storedValue
var cachedVals:Array

#	decisions = {
#		"helped": {
#			name = "Helped Kait",
#			outcomes = {
#				"avy": {
#					text = "No",
#					effects = [
#						DECISION_EFFECT_AVY_LOVE,
#					],
#					kaitLine = "I asked Avy not to help me.. but she still could have done something!",
#					avyLine = "It was pretty fun to see that softie get wrecked.",
#				},

signal onDecisionSelect(missionID, decisionID, value)

func setDecision(_missionID:String, _decisionID:String, _decisionDict:Dictionary, _value):
	missionID = _missionID
	decisionID = _decisionID
	storedDecision = _decisionDict
	storedValue = _value
	
	label.text = decisionID+" - "+_decisionDict.get("name", "Unknown")
	
	option_button.clear()
	option_button.add_item("- Nothing selected -")
	option_button.select(0)
	var _i:int = 1
	cachedVals.clear()
	
	var theOutcomes:Dictionary = storedDecision.get("outcomes", {})
	for theOutcomeID in theOutcomes:
		var theOutcome:Dictionary = theOutcomes[theOutcomeID]
		var theOutcomeText:String = theOutcomeID+" - "+str(theOutcome.get("text", "Unknown"))
		option_button.add_item(theOutcomeText)
		
		if(theOutcomeID == _value):
			option_button.select(_i)
		cachedVals.append(theOutcomeID)
		
		_i += 1

func _on_OptionButton_item_selected(index:int):
	if(index <= 0):
		emit_signal("onDecisionSelect", missionID, decisionID, null)
	else:
		index -= 1
		if(index >= 0 && index < cachedVals.size()):
			emit_signal("onDecisionSelect", missionID, decisionID, cachedVals[index])
