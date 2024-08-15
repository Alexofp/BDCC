extends Node

var forms:Dictionary = {}
var fillers:Dictionary = {}

func registerFiller(theFiller:DialogueFiller):
	for formID in theFiller.getFormIDs():
		if(!fillers.has(formID)):
			fillers[formID] = []
		
		fillers[formID].append(theFiller)

func registerForm(theForm:DialogueForm):
	if(forms.has(theForm.id)):
		Log.printerr("Dialogue form with ID "+str(theForm.id)+" is being registered more than once")
		return
	forms[theForm.id] = theForm

func generate(ID:String, _args:Dictionary, _defaultText:String = "[color=red]Error![/color]"):
	if(!forms.has(ID)):
		return _defaultText
	
	var theForm:DialogueForm = forms[ID]
	var checkData:Array = theForm.checkArgs(_args)
	if(!checkData[0]):
		Log.printerr(checkData[1])
		return "[color=red]MD ERROR ("+ID+"): "+checkData[1]+"[/color]"
	
	if(fillers.has(ID)):
		var possibleLines:Array = []
		var curPrio:int = 0
		
		var fillersToCheck:Array = fillers[ID]
		for filler in fillersToCheck:
			var priority:int = filler.getPriority(ID)
			if(priority < curPrio):
				continue
			if(!filler.canBeUsed(ID, _args)):
				continue
			if(priority > curPrio):
				possibleLines = []
				curPrio = priority
			possibleLines.append_array(filler.getTextsFinal(ID, _args))
		if(possibleLines.size() > 0):
			return RNG.pick(possibleLines)
	
	return theForm.getDefaultText(_args)

func registerFormBank(theFormBank:DialogueFormBank):
	var toRegister:Dictionary = theFormBank.getForms()
	
	for formID in toRegister:
		var formData = toRegister[formID]
		
		var newForm:DialogueForm = DialogueForm.new()
		newForm.id = formID
		newForm.defaultLine = formData["text"]
		newForm.requiredArgs = formData["args"] if formData.has("args") else {}
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

func _ready():
	registerAllFormBanks()
	registerAllFillers()
