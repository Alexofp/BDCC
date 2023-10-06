extends Control

onready var nameLabel = $VBoxContainer/TabContainer/Stats/ScrollContainer/HBoxContainer/PanelContainer/VBoxContainer/NameLabel
onready var levelBar = $VBoxContainer/TabContainer/Stats/ScrollContainer/HBoxContainer/PanelContainer/VBoxContainer/LevelBar
onready var freeStatsLabel = $VBoxContainer/TabContainer/Stats/ScrollContainer/HBoxContainer/Vbox/PanelContainer2/VBoxContainer/FreeStatsLabel
onready var attribList = $VBoxContainer/TabContainer/Stats/ScrollContainer/HBoxContainer/Vbox/PanelContainer2/VBoxContainer/AttribList
signal onClosePressed
onready var applyButton = $VBoxContainer/TabContainer/Stats/ScrollContainer/HBoxContainer/Vbox/PanelContainer2/VBoxContainer/HBoxContainer/ApplyButton
onready var cancelButton = $VBoxContainer/TabContainer/Stats/ScrollContainer/HBoxContainer/Vbox/PanelContainer2/VBoxContainer/HBoxContainer/CancelButton
onready var tabContainer = $VBoxContainer/TabContainer
onready var damageStatsLabel = $VBoxContainer/TabContainer/Stats/ScrollContainer/HBoxContainer/PanelContainer/VBoxContainer/DamageStatsLabel
onready var extraStatsLabel = $VBoxContainer/TabContainer/Stats/ScrollContainer/HBoxContainer/Vbox/SecondPanel/VBoxContainer/ExtraStatsLabel

var skillStatLineScene = preload("res://UI/SkillsUI/SkillStatLine.tscn")
var statObjects = {}
var addedPoints = {}
var skillTabScene = preload("res://UI/SkillsUI/SkillUITab.tscn")
var skillTabs = []
var openedSkillTab = null
var basePerksTabScene = preload("res://UI/SkillsUI/InherentPerksTab.tscn")

func _ready():
	pass

func getAddedStat(statID):
	if(!addedPoints.has(statID)):
		return 0
	return addedPoints[statID]

func getAddedStatsAmount():
	var res = 0
	for statID in addedPoints:
		res += addedPoints[statID]
	return res

func addPoint(statID):
	if(!addedPoints.has(statID)):
		addedPoints[statID] = 0
	addedPoints[statID] += 1

func _on_CloseButton_pressed():
	emit_signal("onClosePressed")

func updateData():
	assert(GM.pc != null)
	
	nameLabel.text = GM.pc.getName()
	
	levelBar.setTextLeft("Level "+str(GM.pc.getSkillsHolder().getLevel()))
	levelBar.setText(str(GM.pc.getSkillsHolder().getExperience())+" / "+str(GM.pc.getSkillsHolder().getRequiredExperienceNextLevel())+" exp")
	levelBar.setProgressBarValue(GM.pc.getSkillsHolder().getLevelProgress())

	createAttribList()
	
	if(openedSkillTab != null):
		openedSkillTab.queue_free()
		openedSkillTab = null
	
#	for tab in skillTabs:
#		tab.queue_free()
#	skillTabs.clear()
#
#	var skills = GM.pc.getSkillsHolder().getSkills()
#	for skillID in skills:
#		var tabID = tabContainer.get_child_count()
#		var skillTab = skillTabScene.instance()
#		tabContainer.add_child(skillTab)
#		skillTab.setSkillID(skillID)
#		skillTabs.append(skillTab)
#		tabContainer.set_tab_title(tabID, skillTab.getTabName())
	
	
func createAttribList():
	statObjects = {}
	Util.delete_children(attribList)
	
	for statID in Stat.getAll():
		var skillStatLine = skillStatLineScene.instance()
		attribList.add_child(skillStatLine)
		skillStatLine.statID = statID

		skillStatLine.connect("onPlusButton", self, "onStatPlusButton")
		statObjects[statID] = skillStatLine
		
	updateAttribList()

func updateAttribList():
	var myAddedPoints = getAddedStatsAmount()
	var freeStatPoints = GM.pc.getSkillsHolder().getFreeStatPoints() - myAddedPoints
	freeStatsLabel.text = "Free stat points: "+str(freeStatPoints)
	var canAddPoints = true
	if(freeStatPoints <= 0):
		canAddPoints = false
	
	for statID in statObjects:
		var baseStat = GM.pc.getSkillsHolder().getBaseStat(statID) + getAddedStat(statID)
		var finalStat = GM.pc.getSkillsHolder().getStat(statID) + getAddedStat(statID)
		var statObject:StatBase = GlobalRegistry.getStat(statID)
		
		var statNumberText = str(baseStat)
		if(baseStat != finalStat):
			statNumberText = str(baseStat) + " ("+str(finalStat)+")"
		statObjects[statID].setStatName(statObject.getVisibleName()+": "+statNumberText)
		statObjects[statID].setCanPressPlus(canAddPoints)
	
	if(myAddedPoints > 0):
		applyButton.disabled = false
		cancelButton.disabled = false
	else:
		applyButton.disabled = true
		cancelButton.disabled = true
		
	updateDamageStatsLabel()

func _on_SkillsUI_visibility_changed():
	if(visible):
		addedPoints.clear()
		updateData()

func onStatPlusButton(statID):
	var freeStatPoints = GM.pc.getSkillsHolder().getFreeStatPoints() - getAddedStatsAmount()
	if(freeStatPoints <= 0):
		return
	#GM.pc.getSkillsHolder().increaseStatIfCan(statID)
	addPoint(statID)
	updateAttribList()


func _on_CancelButton_pressed():
	addedPoints.clear()
	updateAttribList()


func _on_ApplyButton_pressed():
	for statID in addedPoints:
		GM.pc.getSkillsHolder().increaseStatIfCan(statID, addedPoints[statID])
	
	addedPoints.clear()
	updateAttribList()

func updateDamageStatsLabel():
	var text = "Output damage multiplier:\n"
	for damageType in DamageType.getAll():
		var dam = GM.pc.getDamageMultiplier(damageType)
		var damName = DamageType.getName(damageType)
		text += damName +": " +Util.numberToPercentString(dam)+"\n"
		
	text += "\n"
	text += "Recieved damage multiplier:\n"
	for damageType in DamageType.getAll():
		var dam = GM.pc.getRecieveDamageMultiplier(damageType)
		var damName = DamageType.getName(damageType)
		text += damName +": " +Util.numberToPercentString(dam)+"\n"
		
	text += "\n"
	text += "Armor:\n"
	for damageType in DamageType.getAll():
		var dam = GM.pc.getArmor(damageType)
		var damName = DamageType.getName(damageType)
		text += damName +": " +str(dam)+"\n"
		
	text += "\n"
	text += "Dodge chance: "
	var dodgeChance = GM.pc.getDodgeChance()
	text += str(dodgeChance*100)+"%"+"\n"
		
	text += "\n"
	text += "Attack accuracy: "
	var accuracy = GM.pc.getAttackAccuracy() + 1.0
	text += str(accuracy * 100.0)+"%\n"
		
	damageStatsLabel.bbcode_text = text


	text = ""
	text += "Ambient lust: "+str(GM.pc.getAmbientLust()) +"\n"
	text += "Ambient pain: "+str(GM.pc.getAmbientPain()) + "\n"
	text += "Exposure: "+str(int(GM.pc.getExposure()*100))+"%" + "\n"
	extraStatsLabel.bbcode_text = text


func _on_Skills_openPerksButton(skillID):
	if(openedSkillTab != null):
		openedSkillTab.queue_free()
		openedSkillTab = null
	
	var tabID = tabContainer.get_child_count()
	var skillTab = skillTabScene.instance()
	tabContainer.add_child(skillTab)
	skillTab.setSkillID(skillID)
	openedSkillTab = skillTab
	tabContainer.set_tab_title(tabID, skillTab.getTabName())
	tabContainer.current_tab = tabID


func _on_Skills_openBasePerks():
	if(openedSkillTab != null):
		openedSkillTab.queue_free()
		openedSkillTab = null
	
	var tabID = tabContainer.get_child_count()
	var skillTab = basePerksTabScene.instance()
	tabContainer.add_child(skillTab)
	#skillTab.setSkillID(skillID)
	openedSkillTab = skillTab
	tabContainer.set_tab_title(tabID, "Base perks")
	tabContainer.current_tab = tabID
