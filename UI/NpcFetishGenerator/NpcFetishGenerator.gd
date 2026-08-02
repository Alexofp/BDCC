extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var entryScene = load("res://UI/NpcFetishGenerator/FetishGenEntry.tscn")

var default : float = FetishInterest.Likes

onready var entriesc : Container = $sc/vb
onready var resultEdit : TextEdit = $vb/resultEdit


func _ready():
	populate()

func populate(map:Dictionary={}) -> void:
	Util.delete_children(entriesc)
	for fetish in GlobalRegistry.getFetishes().values():
		var nentry = entryScene.instance()
		
		entriesc.add_child(nentry)
		nentry.setFetish(fetish, map.get(fetish.id, default))
		nentry.connect("valueChanged", self, "onValueChanged")
	
	updateText()

func list2text() -> String:
	var res : String = "npcFetishes = {\n"
	
	var defs : Array = Fetish.getAllDefault()
	
	var vals : Array = FetishInterest.getAll()
	var texts : Array = FetishInterest.getAllText()
	var map : Dictionary = {}
	for i in vals.size():
		map[vals[i]] = texts[i]
	
	for entry in entriesc.get_children():
		var val : float = entry.getValue()
		if val==default:
			continue
		var id : String = entry.fetish.id
		if id in defs:
			id = "\tFetish.%s: FetishInterest.%s,\n" % [id, map[val]]
		else:
			id = "\t\"%s\": FetishInterest.%s,\n" % [id, map[val]]
		
		res += id
	
	res += "}"
	
	return res

func updateText() -> void:
	resultEdit.text = list2text()

func _on_fromTextButt_pressed():
	text2list()

func onValueChanged() -> void:
	updateText()

func text2list() -> void:
	var text = resultEdit.text
	var lines = text.split("\n")
	
	var map : Dictionary = {}
	
	for line in lines:
		var middleSplit : PoolStringArray = line.split(":")
		if(middleSplit.size() != 2):
			continue
		
		var fetishId : String = middleSplit[0].get_slice(".", 1).strip_edges().trim_prefix("\"").trim_suffix("\"")
		var secondPartSplit : PoolStringArray = middleSplit[1].split(".")
		if !fetishId or secondPartSplit.size()!=2:
			continue
		
		var value : float = FetishInterest.textToNumber(secondPartSplit[1].trim_suffix(","))
		if value!=default:
			map[fetishId] = value
		
	
	populate(map)
	
