extends Control

onready var whs_label = $ScrollContainer/WHSLabel

func _ready():
	updateInfo()
	
func updateInfo():
	if(GM.main == null):
		return
	
	var eventsByType:Dictionary = GM.main.WHS.eventsByEventID
	
	var text:String = "WORLD HISTORY:\n"
	for eventID in eventsByType:
		var events = eventsByType[eventID]
		
		text += "--"+str(eventID)+"--\n"
		for eventA in events:
			var event:WorldHistoryEvent = eventA
			text += "Who:"+str(event.whoID)+",Target:"+str(event.byWhoID)+",Day:"+str(event.day)+",Time:"+str(Util.getTimeStringHHMM(event.time)+",Args:"+str(event.args))+"\n"
		text += "\n"
	whs_label.text = text

func _on_WHS_visibility_changed():
	if(visible):
		updateInfo()
