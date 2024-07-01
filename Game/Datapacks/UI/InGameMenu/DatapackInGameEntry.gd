extends HBoxContainer

signal onLoadPressed(id)
signal onUnloadPressed(id)

var id = ""

func setIsLoaded(isL):
	$LoadButton.visible = !isL
	$UnloadButton.visible = isL
	$NothingToLoadButton.visible = false

func setNothingToLoad():
	$LoadButton.visible = false
	$UnloadButton.visible = false
	$NothingToLoadButton.visible = true

func setNameLabel(theT):
	$NameLabel.text = theT

func setContainsLabel(theT):
	$ContainsLabel.text = theT

func _on_LoadButton_pressed():
	emit_signal("onLoadPressed", id)

func _on_UnloadButton_pressed():
	emit_signal("onUnloadPressed", id)
