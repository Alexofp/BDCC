extends Control


func _ready():
	updateInfo()
	
func updateInfo():
	if(GM.main == null):
		return
	
	var resultText = ""
	var scenes = GM.main.sceneStack
	
	var i = 1
	resultText += "[b]Current Scene Stack:[/b]\n"
	for scene in scenes:
		var sceneO:SceneBase = scene
		
		resultText += str(i)+") id = \""+str(sceneO.sceneID)+"\"\n"
		resultText += "state = \""+str(sceneO.state)+"\"\n"
		resultText += "SAVEDATA:\n"+var2str(sceneO.saveData())+"\n\n"
		
		i += 1
		
		
		
	$ScrollContainer/VBoxContainer/RichTextLabel.bbcode_text = resultText


func _on_SceneInfoPanel_visibility_changed():
	if(visible):
		updateInfo()
