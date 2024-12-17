extends Node

var forms:Dictionary = {}
var fillers:Dictionary = {}
var adders:Dictionary = {}

var addersCooldown:Dictionary = {}

var gameParser:GameParser = GameParser.new()
var dialogueParser:DialogueParser = DialogueParser.new()

const WORDS_SLUT = [
	"slut",
	"cunt",
	"whore",
	"fucktoy",
	"bitch",
	"idiot",
]
const WORDS_SLUTS = [
	"sluts",
	"cunts",
	"whores",
	"fucktoys",
	"bitches",
	"idiots",
]
const WORDS_UGH = [
	"argh",
	"ugh",
	"ghh",
	"ahhh!",
	"gah",
	"fuck",
]

func registerFiller(theFiller:DialogueFiller):
	for formID in theFiller.getFormIDs():
		if(!fillers.has(formID)):
			fillers[formID] = []
		
		fillers[formID].append(theFiller)

func registerAdder(theFiller:DialogueFillerAdder):
	for formID in theFiller.getFormIDs():
		if(!adders.has(formID)):
			adders[formID] = []
		
		adders[formID].append(theFiller)

func registerForm(theForm:DialogueForm):
	if(forms.has(theForm.id)):
		Log.printerr("Dialogue form with ID "+str(theForm.id)+" is being registered more than once")
		return
	forms[theForm.id] = theForm

func generate(ID:String, _args:Dictionary, _defaultText:String = "") -> String:
	tickCooldowns()
	
	if(!forms.has(ID)):
		if(_defaultText == ""):
			return "[color=red]"+ID+" MISSING[/color]"
		return _defaultText
	
	var theForm:DialogueForm = forms[ID]
	var checkData:Array = theForm.checkArgs(_args)
	if(!checkData[0]):
		Log.printerr(checkData[1])
		return "[color=red]MD ERROR ("+ID+"): "+checkData[1]+"[/color]"
	
	var resultLine:String = ""
	if(fillers.has(ID)):
		var possibleLines:Array = []
		var lineWeights:Array = []
		var curPrio:int = 0
		
		var fillersToCheck:Array = fillers[ID]
		for filler in fillersToCheck:
			var weight:float = filler.getWeight(ID)
			var priority:int = filler.getPriority(ID)
			if(priority < curPrio):
				continue
			
			if(!filler.canBeUsed(ID, _args, theForm)):
				continue
			var newLines:Array = filler.getTextsFinal(ID, _args)
			if(newLines.size() <= 0):
				continue
				
			if(priority > curPrio):
				possibleLines = []
				lineWeights = []
				curPrio = priority
			
			possibleLines.append_array(newLines)
			for _i in range(newLines.size()):
				lineWeights.append(weight)
		if(possibleLines.size() > 0):
			resultLine = RNG.pickWeighted(possibleLines, lineWeights)
	
	if(resultLine == ""):
		resultLine = theForm.getDefaultText(_args)
	
	if(adders.has(ID)):
		var possibleAdders:Array = []
		var curPrio:int = 0
		
		var addersToCheck:Array = adders[ID]
		for adder in addersToCheck:
			if(addersCooldown.has(adder)):
				continue
			var theChance:float = adder.getChance(ID)
			if(theChance < 100.0 && !RNG.chance(theChance)):
				continue
			var priority:int = adder.getPriority(ID)
			if(priority < curPrio):
				continue
			if(!adder.canBeUsed(ID, _args, theForm)):
				continue
			possibleAdders.append(adder)
		
		if(possibleAdders.size() > 0):
			var randomAdder:DialogueFillerAdder = RNG.pick(possibleAdders)
			var randomTextsToAdd:Array = randomAdder.getTextsFinal(ID, _args)
			var isPrefix:bool = randomAdder.isPrefix(ID)
			addersCooldown[randomAdder] = RNG.randi_range(5, 15)
			
			if(randomTextsToAdd.size() > 0):
				var randomText:String = RNG.pick(randomTextsToAdd)
				
				if(isPrefix):
					resultLine = randomText + " " + resultLine
				else:
					resultLine = resultLine + " " + randomText
		
	var overrides:Dictionary = {}
	for argID in _args:
		if(_args[argID] is BaseCharacter):
			overrides[argID] = _args[argID].getID()
	
	var mainRole:String = theForm.mainRole
	var dirToRole:String = theForm.dirToRole
	
	var finalTags:Dictionary = {}
	if(mainRole != "" && _args.has(mainRole)):
		finalTags = _args[mainRole].getModularDialogueTags(_args[dirToRole] if (dirToRole != "" && _args.has(dirToRole)) else null)
	
	resultLine = dialogueParser.processString(resultLine, finalTags, {
		SLUT = WORDS_SLUT,
		SLUTS = WORDS_SLUTS,
		UGH = WORDS_UGH,
	})
	resultLine = gameParser.executeString(resultLine, overrides)
	
	return resultLine

func tickCooldowns():
	for adder in addersCooldown.keys():
		addersCooldown[adder] -= 1
		if(addersCooldown[adder] <= 0):
			var _ok = addersCooldown.erase(adder)

func registerFormBank(theFormBank:DialogueFormBank):
	var toRegister:Dictionary = theFormBank.getForms()
	
	for formID in toRegister:
		var formData = toRegister[formID]
		
		var newForm:DialogueForm = DialogueForm.new()
		newForm.id = formID
		newForm.defaultLine = formData["text"]
		newForm.requiredArgs = formData["args"] if formData.has("args") else {}
		newForm.mainRole = formData["main"]
		newForm.dirToRole = formData["dirTo"]
		registerForm(newForm)

func registerAllFormBanks():
	var bankPaths:Array = Util.getFilesInFolder("res://Game/ModularDialogue/FormBanks/")
	
	for filePath in bankPaths:
		var theBank = load(filePath).new()
		if(theBank is DialogueFormBank):
			registerFormBank(theBank)
			#print("REGISTERED FORM BANK FROM PATH: "+filePath)

func registerAllFillers():
	var fillerPaths:Array = Util.getFilesInFolder("res://Game/ModularDialogue/Fillers/")
	
	for filePath in fillerPaths:
		var theFiller = load(filePath).new()
		if(theFiller is DialogueFiller):
			registerFiller(theFiller)

func registerAllAdders():
	var fillerPaths:Array = Util.getFilesInFolder("res://Game/ModularDialogue/Adders/")
	
	for filePath in fillerPaths:
		var theFiller = load(filePath).new()
		if(theFiller is DialogueFillerAdder):
			registerAdder(theFiller)

func _ready():
	pass

func registerEverything():
	registerAllFormBanks()
	registerAllFillers()
	registerAllAdders()
