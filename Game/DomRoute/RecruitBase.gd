extends Reference
class_name RecruitBase

var id:String = ""
var difficulty:int = RecruitDifficulty.Easy
var charID:String = ""

# To save
var history:Array = [] # [["loving", "sex", "bondage"], ["strict", "painplay", "anal"], ...]
var completed:bool = false

# Must have less than 3 choices. Each choice must have less than 3 options. Ideally just 3*3
var choices:Array = [
	{
		id = "tone",
		name = "Tone",
		desc = "Something something",
		options = [
			["loving", "Lovingly", "Do it lovingly", RecruitChoiceResult.Red],
			["strict", "Strict", "Be extremely strict", RecruitChoiceResult.Yellow],
			["mean", "Mean", "Be extremely mean and rough about it", RecruitChoiceResult.Green]
		],
	},
]

# Only gets called when all options are picked, gurantees that _choices has all the choices
func getExtraChoices(_choices:Array) -> Array:
	#if(_choices[1] == "sex"):
	return [
		{
			id = "condom",
			name = "Condom",
			desc = "Something mew mew",
			options = [
				["no", "No condom", "Don't use a condom"],
				["worst", "Worst condom", "Use the worst condom you have"],
				["best", "Best condom", "Use the best condom you have"],
			],
		},
		# Strapon pick
	]

func isCombinationPossible(_choices:Array, _extras:Dictionary) -> Array:
	return [true, ""]

func isCombinationPossibleFinal(_choices:Array, _extras:Dictionary) -> Array:
	var theExtras := getExtraChoices(_choices)
	for theExtra in theExtras:
		var theID:String = theExtra["id"]
		if(!_extras.has(theID)):
			return [false, "'"+theExtra["name"]+"' option needs to be selected."]
	return isCombinationPossible(_choices, _extras)

func getSceneToPlay(_choices:Array, _extras:Dictionary) -> String:
	return "PlaceholderRecruitScene"

# Happens during story after the breaking
func getStorySceneSuccess() -> String:
	return ""

func getStorySceneFail() -> String:
	return ""

func getTalkScene() -> String:
	return ""

func isArSame(_ar1:Array, _ar2:Array) -> bool:
	if(_ar1.size() != _ar2.size()):
		return false
	for _i in _ar1.size():
		if(_ar1[_i] != _ar2[_i]):
			return false
	return true
	
func needsToBeSaved() -> bool:
	if(completed || !history.empty()):
		return true
	return false

func getPresenterCharID() -> String:
	return "kait"

func getPresenterDialogue() -> String:
	return "Want me to do it?"

#var recruitID:String = ""
#var choices:Array = [] # indicies
#var choiceIDs:Array = [] # ids
#var choiceByID:Dictionary = {} # id = id
#var perfect:bool = false
#var success:bool = false
#var extras:Dictionary = {}

# Also checks if the plan was good
func createContext(_choices:Array, _extras:Dictionary) -> RecruitContext:
	var theContext := RecruitContext.new()
	theContext.charID = charID
	theContext.recruitID = id
	theContext.choiceIDs = _choices.duplicate()
	var _i:int = 0
	for theChoiceID in _choices:
		var ourChoice:Dictionary = choices[_i]
		var theOptions:Array = ourChoice["options"]
		var _ii:int = 0
		for theOptionEntry in theOptions:
			if(theOptionEntry[0] == theChoiceID):
				theContext.choices.append(_ii)
				break
			_ii += 1
		_i += 1
	
	_i = 0
	for theChoiceID in _choices:
		var ourChoice:Dictionary = choices[_i]
		theContext.choiceByID[ourChoice["id"]] = theChoiceID
		_i += 1
	
	theContext.extras = _extras
	
	var hasAnyReds:bool = false
	var yellowAmount:int = 0
	
	_i = 0
	for theChoiceID in _choices:
		var ourChoice:Dictionary = choices[_i]
		var theOptions:Array = ourChoice["options"]
		for theOptionEntry in theOptions:
			if(theOptionEntry[0] == theChoiceID):
				var theRes:int = theOptionEntry[3]
				if(theRes == RecruitChoiceResult.Red):
					hasAnyReds = true
				elif(theRes == RecruitChoiceResult.Yellow):
					yellowAmount += 1
				break
		_i += 1
	
	var allowedYellow := RecruitDifficulty.getDifficultyYellowAmount(difficulty)
	var hasTooManyYellows:bool = yellowAmount > allowedYellow
	
	if(hasAnyReds || hasTooManyYellows):
		theContext.success = false
		theContext.perfect = false
	else:
		theContext.success = true
		theContext.perfect = (yellowAmount == 0)
	
	return theContext

func getResultsForChoices(_choices:Array) -> Array:
	var result:Array = []
	var _i:int = 0
	for theChoiceID in _choices:
		var ourChoice:Dictionary = choices[_i]
		var theOptions:Array = ourChoice["options"]
		if(theChoiceID is int):
			var theOptionEntry:Array = theOptions[theChoiceID]
			var theRes:int = theOptionEntry[3]
			result.append(theRes)
			_i += 1
			continue
		
		for theOptionEntry in theOptions:
			if(theOptionEntry[0] == theChoiceID):
				var theRes:int = theOptionEntry[3]
				result.append(theRes)
				break
		_i += 1
	return result

func getResultsAndNamesForChoices(_choices:Array) -> Array:
	var result:Array = []
	var _i:int = 0
	for theChoiceID in _choices:
		var ourChoice:Dictionary = choices[_i]
		var theOptions:Array = ourChoice["options"]
		if(theChoiceID is int):
			var theOptionEntry:Array = theOptions[theChoiceID]
			var theRes:int = theOptionEntry[3]
			result.append([theRes, theOptionEntry[1]])
			_i += 1
			continue
		
		for theOptionEntry in theOptions:
			if(theOptionEntry[0] == theChoiceID):
				var theRes:int = theOptionEntry[3]
				result.append([theRes, theOptionEntry[1]])
				break
		_i += 1
	return result

func getColorStringForChoices(_choices:Array) -> String:
	var theStuff := getResultsAndNamesForChoices(_choices)
	var result:Array = []
	for theEntry in theStuff:
		var theColor:Color = RecruitChoiceResult.getColor(theEntry[0])
		result.append("[color=#"+theColor.to_html(false)+"]"+theEntry[1]+"[/color]")
	
	return Util.join(result, " - ")

func getStringForChoices(_choices:Array) -> String:
	var theStuff := getResultsAndNamesForChoices(_choices)
	var result:Array = []
	for theEntry in theStuff:
		result.append(theEntry[1])
	
	return Util.join(result, " - ")

func onContext(_context:RecruitContext):
	history.erase(_context.choices)
	history.append(_context.choices)
	while(history.size() > 10):
		history.pop_front()

func getHistoryString() -> String:
	if(history.empty()):
		return ""
	var result:Array = ["Previous plans:"]
	for theEntry in history:
		result.append(getColorStringForChoices(theEntry))
	
	return Util.join(result, "\n")

func saveData() -> Dictionary:
	return {
		history = history,
		completed = completed,
	}

func loadData(_data:Dictionary):
	completed = SAVE.loadVar(_data, "completed", false)
	history = SAVE.loadVar(_data, "history", [])
