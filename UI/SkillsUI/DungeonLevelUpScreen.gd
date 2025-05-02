extends ScrollContainer

signal onConfirm(selectedStat, selectedPerk)

var statToButton:Dictionary = {}
var perkToButton:Dictionary = {}

var perkList:Array = []

onready var stat_list = $"%StatList"
onready var perk_list = $"%PerkList"
onready var level_label = $"%LevelLabel"
onready var perks_panel = $"%PerksPanel"


var perkButtonScene = preload("res://UI/SkillsUI/PerkButton.tscn")

var selectedStat:String = ""
var selectedPerk:String = ""

func setData(theLevel:int, thePerkList:Array = [], lastSelectedStat:String = ""):
	statToButton = {}
	perkToButton = {}
	level_label.text = "You have reached level "+str(theLevel)+"!"
	
	selectedStat = lastSelectedStat
	perkList = thePerkList
	
	Util.delete_children(stat_list)
	
	var nothingButton:Button = Button.new()
	stat_list.add_child(nothingButton)
	nothingButton.text = "SKIP"
	statToButton["SKIP"] = nothingButton
	nothingButton.connect("pressed", self, "onStatButtonPressed", [""])

	for statID in GlobalRegistry.getStats():
		var theStat:StatBase = GlobalRegistry.getStat(statID)
		
		var statButton:Button = Button.new()
		stat_list.add_child(statButton)
		statButton.text = theStat.getVisibleName()
		statButton.hint_tooltip = theStat.getVisibleDescription()
		statToButton[statID] = statButton
		statButton.connect("pressed", self, "onStatButtonPressed", [statID])
	
	updateSelectedStatButton()
	
	perks_panel.visible = !perkList.empty()
	Util.delete_children(perk_list)
	
	if(!perkList.empty()):
		var skipPerkButton = perkButtonScene.instance()
		perk_list.add_child(skipPerkButton)
		skipPerkButton.setSkippedPerk()
		perkToButton["SKIP"] = skipPerkButton
		skipPerkButton.connect("perkClicked", self, "onPerkButtonPressed")
		
		for perkID in perkList:
			var perkButton = perkButtonScene.instance()
			perk_list.add_child(perkButton)
			perkButton.setPerk(GlobalRegistry.getPerk(perkID), false)
			perkToButton[perkID] = perkButton
			perkButton.connect("perkClicked", self, "onPerkButtonPressed")
	
		updateSelectedPerkButton()

func updateSelectedPerkButton():
	var selectedPerkButtonID:String = "SKIP" if selectedPerk == "" else selectedPerk
	
	for perkID in perkToButton:
		var theButton = perkToButton[perkID]
		var isSelected:bool = (selectedPerkButtonID == perkID)
		theButton.modulate = Color(0.5, 0.5, 0.5) if !isSelected else Color.green

func onPerkButtonPressed(perkID:String):
	selectedPerk = perkID
	updateSelectedPerkButton()

func onStatButtonPressed(statID:String):
	selectedStat = statID
	updateSelectedStatButton()

func updateSelectedStatButton():
	var selectedStatButtonID:String = "SKIP" if selectedStat == "" else selectedStat
	
	for statID in statToButton:
		var theButton:Button = statToButton[statID]
		var isSelected:bool = (selectedStatButtonID == statID)
		var buttonName:String = "SKIP"
		if(statID != "SKIP"):
			var theStat:StatBase = GlobalRegistry.getStat(statID)
			buttonName = theStat.getVisibleName()
			buttonName += " ("+str(GM.pc.getStat(statID))+")"
		
		theButton.text = ("[ "+buttonName+" ]" if isSelected else buttonName)
		theButton.disabled = isSelected
		

func _on_ContinueButton_pressed():
	emit_signal("onConfirm", selectedStat, selectedPerk)
