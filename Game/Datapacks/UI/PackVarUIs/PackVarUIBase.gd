extends Control

var id = ""
signal onValueChange(id, newValue)

func getMenu():
	var toCheck = self
	while(toCheck != null):
		if(toCheck.has_method("isDatapackMenu")):
			return toCheck
		toCheck = toCheck.get_parent()
	return null

func showAlert(theText:String):
	var theMenu = getMenu()
	if(theMenu == null):
		printerr("Was unable to show an alert, no menu var is set. Alert text is: "+str(theText))
	else:
		theMenu.showAlert(theText)

func pushMenu(theMenuToPush:Control):
	var theMenu = getMenu()
	if(theMenu == null):
		printerr("Was unable to push a menu")
	else:
		theMenu.pushMenu(theMenuToPush)

func popMenu():
	var theMenu = getMenu()
	if(theMenu == null):
		printerr("Was unable to pop a menu")
	else:
		theMenu.popMenu()

func setData(_dataLine:Dictionary):
	pass

func triggerChange(_newValue):
	emit_signal("onValueChange", id, _newValue)

func onEditorClose():
	pass
