extends VBoxContainer

onready var tab_container = $TabContainer
onready var missions = $TabContainer/Missions
var missionsVisible:bool = true

func setMissionsPanelVisible(_vis:bool):
	if(_vis && !missionsVisible):
		missionsVisible = true
		missions.get_parent().remove_child(missions)
		tab_container.add_child(missions)
		missions.visible = false
	
	if(!_vis && missionsVisible):
		missionsVisible = false
		missions.get_parent().remove_child(missions)
		add_child(missions)
		missions.visible = false

func _on_DebugPanel_visibility_changed():
	if(visible && GM.main):
		var theModule = GlobalRegistry.getModule("KaitModule")
		if(theModule):
			setMissionsPanelVisible(theModule.hasHideoutAccess())
